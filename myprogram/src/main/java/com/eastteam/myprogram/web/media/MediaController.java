package com.eastteam.myprogram.web.media;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.media.MediaService;
import com.eastteam.myprogram.web.Servlets;
import com.eastteam.myprogram.web.WebUtils;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = "/media")
public class MediaController {
	
	@Autowired
  	@Qualifier("configProperties")
  	private Properties configProperties;
	
	  
//	  @Value("#{configProperties['pagesize]}")
	@Value("${pagesize}")	
	private String pageSize;
	

	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	@Autowired
	MediaService mediaService;
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "media_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list, pageSize=" + this.pageSize);
		logger.info("from property file: pagesize=====" + configProperties.getProperty("pagesize"));
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
		Page<Media> medias = mediaService.getCurrentPageContent(searchParams, pageNumber, 7, sortType);
		model.addAttribute("medias", medias);
		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
		logger.info("searchParams=" + searchParams);
		return "media/list";
	}

	
	@RequestMapping(value="upload",method = RequestMethod.GET)
	public String showUplaodPage() {
		logger.info("in upload page");
		return "media/upload";
	}
	
	/**
	 * 使用plupload上传文件
	 * @param file		文件对象
	 * @param name		文件名称
	 * @param chunk		数据块序号
	 * @param chunks	数据块总数
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="upload",method=RequestMethod.POST)	
	public String plupload(@RequestParam MultipartFile file, HttpSession session, String name) {
		String relativePath = "/plupload/files/large";
		String realPath = WebUtils.getRealPath(session);
		String mediafolder = realPath + relativePath;
		//加上sessionId作为上传文件名
		String filename = session.getId() + "_" + name;
		logger.info("文件保存路径：" + mediafolder);
		logger.info("文件名称：" + filename);		
		mediaService.saveFile(file, mediafolder, filename);
		
		return "";
	}
	

	
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String showAddPage(Model model, HttpServletRequest request, @RequestParam("uploader_count")int count) {
		logger.info("show add page");

		List<Media> mediaList = Lists.newArrayList();
		for(int i = 0; i < count; i++) {
			String nameKey = MessageFormat.format("uploader_{0}_name", i);
			String statusKey = MessageFormat.format("uploader_{0}_status", i);;
			String fileName = request.getParameter(nameKey);
			String status = request.getParameter(statusKey);
			logger.info("file={},status={}", fileName, status);
			if (status.equalsIgnoreCase("done")) {
				Media media = new Media();
				media.setPath(fileName);
				media.setStatus("上传成功");
				mediaList.add(media);	
			}
		}
		
		model.addAttribute("mediaList", mediaList);
		
		return "media/add";
	}
	
	@RequestMapping(value="save",method = RequestMethod.POST)
	public String save(MediaFormBean mediaFormBean, HttpSession session) {
		logger.info("in medai save" + mediaFormBean.toString());
		User user = (User)session.getAttribute("user");
		List<Media> medias = mediaFormBean.getMedias();
		for(Media media : medias) {
			media.setDescription(mediaFormBean.getDescription());
			if (user != null) {
				media.setUserId(user.getId());
				media.setPath(session.getId() + "_" + media.getPath());
				// TODO hardcode here:
				media.setMediaType("图片");
			}
		}
		
		if (!medias.isEmpty()) {
			mediaService.insert(medias);
			logger.info("Save media to DB finished.");
		}
		
		return "redirect:list";
	}


//	public String getPageSize() {
//		return pageSize;
//	}
//
//
//	public void setPageSize(String pageSize) {
//		this.pageSize = pageSize;
//	}
	
	
}
