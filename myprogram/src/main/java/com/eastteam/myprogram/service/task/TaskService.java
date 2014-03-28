package com.eastteam.myprogram.service.task;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.text.ParsePosition;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eastteam.myprogram.dao.TaskMybatisDao;
import com.eastteam.myprogram.entity.Attachment;
import com.eastteam.myprogram.entity.Comment;
import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.entity.Task;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.PageableService;
import com.eastteam.myprogram.service.media.MediaService;
import com.eastteam.myprogram.web.Thumbnail;
import com.google.common.collect.Maps;

@Component
@Transactional
public class TaskService extends PageableService{
	@Autowired
	private TaskMybatisDao taskDao;
	private static final int BUFFER_SIZE = 100 * 1024;
	private static Logger logger = LoggerFactory.getLogger(MediaService.class);
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		//这里必须new一个新的Map作为Mybatis的传入参数，以防改变parameters的values，进而影响URL的生成。
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return taskDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		return taskDao.getCount(parameters);
	}
	
	
	public Task getTask(long id) {
		return this.taskDao.getTask(id);
	}
	
	public void save(Task task){
		int hours=(int)(task.getDueDate().getTime()/1000/60/60-task.getCreatedTimestamp().getTime()/1000/60/60);
		task.setTimeRemaining(hours/3);
		taskDao.save(task);
		List comments=task.getComments();
		if(comments!=null){
			for (Iterator iterator = comments.iterator(); iterator.hasNext();) {
				Comment comment = (Comment) iterator.next();
				taskDao.saveComments(comment);
				Map<String, Object> parameters=new HashMap<String, Object>();
				parameters.put("comment_id", comment.getId());
				parameters.put("task_id", task.getId());
				taskDao.saveTaskComment(parameters);
			}
		}
		List subUsers=task.getSubUsers();
		if(subUsers!=null){
			for(Iterator iterator = subUsers.iterator(); iterator.hasNext();){
			   User user = (User) iterator.next();
			   Map<String, Object> parameters=new HashMap<String, Object>();
			   parameters.put("user_id", user.getId());
				parameters.put("task_id", task.getId());
				taskDao.saveTaskSubscriber(parameters);
			}
		}
		List attachments=task.getAttachments();
		if(attachments!=null){
			for (Iterator iterator = attachments.iterator(); iterator.hasNext();) {
				Attachment attachment = (Attachment) iterator.next();
				taskDao.saveAttachment(attachment);
			}
		}
		task.getAttachments();
		Case cases=task.getCases();
		if(cases!=null){
			Map<String, Object> parameters=new HashMap<String, Object>();
			parameters.put("case_id", cases.getId());
			parameters.put("task_id", task.getId());
			taskDao.saveCaseTask(parameters);
		}
	}
	
	public void update(Task task){
		long day=(task.getDueDate().getTime()-task.getCreatedTimestamp().getTime())/1000/60/60/24;
		double hour=(task.getDueDate().getTime()/1000/60/60-task.getCreatedTimestamp().getTime()/1000/60/60)/3;
		double percent=(hour-task.getTimeRemaining())/hour*100;       
		task.setProgress((int)percent);
		taskDao.update(task);
		List comments=task.getComments();
		if(comments!=null){
			for (Iterator iterator = comments.iterator(); iterator.hasNext();) {
				Comment comment = (Comment) iterator.next();
				taskDao.saveComments(comment);
				Map<String, Object> parameters=new HashMap<String, Object>();
				parameters.put("comment_id", comment.getId());
				parameters.put("task_id", task.getId());
				System.out.println(comment.getId() +" "+task.getId());
				taskDao.saveTaskComment(parameters);
			}
		}
		taskDao.deleteSubscriber(task.getId());
		List subUsers=task.getSubUsers();
		if(subUsers!=null){
			for(Iterator iterator = subUsers.iterator(); iterator.hasNext();){
			   User user = (User) iterator.next();
				if (user!= null) {
					Map<String, Object> parameters = new HashMap<String, Object>();
					parameters.put("user_id", user.getId());
					parameters.put("task_id", task.getId());
					taskDao.saveTaskSubscriber(parameters);
				}
			}
		}
		List attachments=task.getAttachments();
		if(attachments!=null){
			for (Iterator iterator = attachments.iterator(); iterator.hasNext();) {
				Attachment attachment = (Attachment) iterator.next();
				taskDao.saveAttachment(attachment);
			}
		}
		task.getAttachments();
		Case cases=task.getCases();
		if(cases.getId()!=null){
			Map<String, Object> parameters=new HashMap<String, Object>();
			parameters.put("case_id", cases.getId());
			parameters.put("task_id", task.getId());
			taskDao.updateCaseTask(parameters);
		}
	}
	public void saveFile(MultipartFile file, String realPath, String filename) {
		String mediafolder = "";
		mediafolder = realPath ;
			
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
			
	}
}