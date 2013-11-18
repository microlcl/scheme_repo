package com.eastteam.myprogram.web.media;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	private static final int PAGE_SIZE = 10;
	private static final int BUFFER_SIZE = 100 * 1024; 

	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	@Autowired
	MediaService mediaService;
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "media_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("in list");
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
		Page<Media> medias = mediaService.getCurrentPageContent(searchParams, pageNumber, PAGE_SIZE, sortType);
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
		
		try {
			//检查文件目录，不存在则创建
			File folder = new File(mediafolder);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			
			//目标文件 
			File destFile = new File(folder, filename);
			//文件已存在删除旧文件（上传了同名的文件） 
	        if (destFile.exists()) {  
	        	destFile.delete();  
	        	destFile = new File(folder, filename);
	        }
	        //合成文件
	        appendFile(file.getInputStream(), destFile);  
			
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		
		return "";
	}
	
	private void appendFile(InputStream in, File destFile) {
		OutputStream out = null;
		try {
			// plupload 配置了chunk的时候新上传的文件append到文件末尾
			if (destFile.exists()) {
				out = new BufferedOutputStream(new FileOutputStream(destFile, true), BUFFER_SIZE); 
			} else {
				out = new BufferedOutputStream(new FileOutputStream(destFile),BUFFER_SIZE);
			}
			in = new BufferedInputStream(in, BUFFER_SIZE);
			
			int len = 0;
			byte[] buffer = new byte[BUFFER_SIZE];			
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {		
			try {
				if (null != in) {
					in.close();
				}
				if(null != out){
					out.close();
				}
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
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
}
