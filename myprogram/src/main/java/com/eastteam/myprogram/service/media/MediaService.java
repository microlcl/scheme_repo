package com.eastteam.myprogram.service.media;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eastteam.myprogram.dao.MediaMybatisDao;
import com.eastteam.myprogram.entity.Media;
import com.eastteam.myprogram.service.PageableService;
import com.eastteam.myprogram.web.Thumbnail;
import com.google.common.collect.Maps;

@Component
@Transactional
public class MediaService extends PageableService {

	private static final int BUFFER_SIZE = 100 * 1024;

	private static Logger logger = LoggerFactory.getLogger(MediaService.class);

	@Autowired
	private MediaMybatisDao medaiDao;
	
	  @Value("${media.pic.pagesize}")	
//	  @Value("#{configProperties['pagesize]}")
	private int pageSize;
	  
	@Value("${thumbnail.width}")	
	private int thumbnailWidth;
	  
	@Value("${thumbnail.height}")	
	private int thumbnailHeight;	  

	public List<Media> search(Map parameters, Pageable pageRequest) {
		logger.info("in service, pagesize = " + pageSize);
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return medaiDao.search(param);
	}

	public Long getCount(Map parameters) {
		Map param = Maps.newHashMap(parameters);
		return medaiDao.getCount(param);
	}

	public void insert(List<Media> mediaList) {
		for (Media media : mediaList) {
			medaiDao.insert(media);
		}
	}

	public void saveFile(MultipartFile file, String mediafolder, String filename) {
		// 检查文件目录，不存在则创建
		File folder = new File(mediafolder);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		// 目标文件
		File destFile = new File(folder, filename);
		// 文件已存在删除旧文件（上传了同名的文件）
		if (destFile.exists()) {
			destFile.delete();
			destFile = new File(folder, filename);
		}
		OutputStream out = null;
		InputStream in = null;

		try {
			in = file.getInputStream();
			// plupload 配置了chunk的时候新上传的文件append到文件末尾
			if (destFile.exists()) {
				out = new BufferedOutputStream(new FileOutputStream(destFile,
						true), BUFFER_SIZE);
			} else {
				out = new BufferedOutputStream(new FileOutputStream(destFile),
						BUFFER_SIZE);
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
				if (null != out) {
					out.close();
				}
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}
		//生成缩略图
		try {
			Thumbnail thum = new Thumbnail(folder + "/" + filename);
			logger.info("thumbnail size = " + this.thumbnailWidth + ":" + this.thumbnailHeight);
			thum.resizeFix(this.thumbnailWidth, this.thumbnailHeight);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}

}
