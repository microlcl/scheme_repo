package com.eastteam.myprogram.web.media;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	@Autowired
	MediaService mediaService;
	
	@RequestMapping(value="list",method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "media_id") String sortType,
			Model model, ServletRequest request) {
		logger.info("from property file: pagesize=====" + configProperties.getProperty("media.pic.pagesize"));
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info(searchParams.toString());		
		Page<Media> medias = mediaService.getCurrentPageContent(searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		model.addAttribute("medias", medias);
		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
		model.addAttribute("searchParams", searchParams);
		logger.info("searchParams=" + searchParams);
		return "media/list";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/api/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Page<Media> search(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sortType", defaultValue = "media_id") String sortType,
			Model model, ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		logger.info("in ajax response:" + searchParams.toString());		
		Page<Media> medias = mediaService.getCurrentPageContent(searchParams, pageNumber, Integer.parseInt(configProperties.getProperty("media.pic.pagesize")), sortType);
		return medias;
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
		mediaService.saveFile(file, realPath, filename);
		
		return "";
	}
	

	
	@RequestMapping(value="add",method = RequestMethod.POST)
	public String showAddPage(Model model, HttpServletRequest request, HttpSession session, @RequestParam("uploader_count")int count) {
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
				media.setPath(session.getId() + "_" + fileName);
				logger.info("======Media.path:" + media.getPath());
				if (media.getPath().toLowerCase().endsWith(".jpg")) {
					media.setMediaType("picture");
				}else if (media.getPath().toLowerCase().endsWith(".mp3")) {
					media.setMediaType("audio");
				}
				logger.info("======media Type:"+ media.getMediaType());
				media.setStatus("上传成功");
				mediaList.add(media);	
			}
		}
		
		model.addAttribute("mediaList", mediaList);
		
		return "media/add";
	}
	
	@RequestMapping(value="save",method = RequestMethod.POST)
	public String save(MediaFormBean mediaFormBean, HttpSession session, RedirectAttributes redirectAttributes) {
		logger.info("in medai save" + mediaFormBean.toString());
		User user = (User)session.getAttribute("user");
		List<MediaWrapper> medias = mediaFormBean.getMedias();
		for(MediaWrapper media : medias) {
			if (StringUtils.isBlank(media.getTitle())) {
				media.setTitle(mediaFormBean.getTitle());
			}
			if (StringUtils.isBlank(media.getDescription())) {
				media.setDescription(mediaFormBean.getDescription());
			}
			if (StringUtils.isBlank(media.getCategoryIds())) {
				media.setCategoryIds(mediaFormBean.getCategoryId());
			}
			if (StringUtils.isBlank(media.getMediaType())) {
				media.setMediaType(mediaFormBean.getMediaType());
			}
			if (StringUtils.isBlank(media.getAuthor())) {
				media.setAuthor(mediaFormBean.getAuthor()); 
			}
			logger.info("categoryid=======" + media.getCategoryIds());
			if (user != null) {
				media.setUserId(user.getId());
				media.setPath(media.getPath());
				logger.info("===== The media type of the uploading resource:"+ media.getMediaType());
				media.setMediaType(media.getMediaType());
				logger.info("===== The Author of the uploading resource:"+ media.getAuthor());
				media.setAuthor(media.getAuthor());
			}
		}
		
		if (!medias.isEmpty()) {
			mediaService.insert(medias);
			logger.info("Save media to DB finished.");
		}
		
		redirectAttributes.addAttribute("search_mediaType","picture");
		return "redirect:list?search_mediaType={search_mediaType}";
	}
	
	@RequestMapping(value="edit/{type}",method = RequestMethod.GET)
	public String showEditMedia(@PathVariable("type") String type, Model model, HttpServletRequest request) {
		String[] mediaIds = request.getParameterValues(type);
		List<Media> mediaList = this.mediaService.getMediaList(mediaIds);

		model.addAttribute("mediaList", mediaList);
		
		return "media/editMedia";
	}
	
	@RequestMapping(value="delete/{type}",method = RequestMethod.GET)
	public String deleteMedia(@PathVariable("type") String type, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String[] mediaIds = request.getParameterValues(type);
		logger.info("==========Delte media type: " + type);
		this.mediaService.deleteMedias(mediaIds);
		
		redirectAttributes.addAttribute("search_mediaType",type);
		return "redirect:/media/list/?search_mediaType={search_mediaType}";
	}
	
	@RequestMapping(value="update",method = RequestMethod.POST)
	public String updateMedia(MediaFormBean mediaFormBean, RedirectAttributes redirectAttributes) {
		logger.info("in media update" + mediaFormBean.toString());
		String mediaType = "";

		List<MediaWrapper> medias = mediaFormBean.getMedias();
		for(MediaWrapper media : medias) {
			mediaType = media.getMediaType();
			if (StringUtils.isBlank(media.getTitle())) {
				media.setTitle(mediaFormBean.getTitle());
			}
			if (StringUtils.isBlank(media.getDescription())) {
				media.setDescription(mediaFormBean.getDescription());
			}
			if (StringUtils.isBlank(media.getCategoryIds())) {
				media.setCategoryIds(mediaFormBean.getCategoryId());
			}
			if (StringUtils.isBlank(media.getMediaType())) {
				media.setMediaType(mediaFormBean.getMediaType());
			}
			if (StringUtils.isBlank(media.getAuthor())) {
				media.setAuthor(mediaFormBean.getAuthor()); 
			}
			logger.info("categoryid=======" + media.getCategoryIds());
		}
		
		if (!medias.isEmpty()) {
			mediaService.updateMedias(medias);
			logger.info("update media to DB finished.");
		}
		logger.info("in media update: mediaType = " +mediaType);
		redirectAttributes.addAttribute("search_mediaType",mediaType);
		return "redirect:list?search_mediaType={search_mediaType}";
	}
}
