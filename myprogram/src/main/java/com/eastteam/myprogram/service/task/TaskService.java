package com.eastteam.myprogram.service.task;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.eastteam.myprogram.dao.TaskMybatisDao;
import com.eastteam.myprogram.entity.Attachment;
import com.eastteam.myprogram.entity.Comment;
import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.Task;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class TaskService extends PageableService{
	
	@Autowired
	private TaskMybatisDao taskDao;

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
	
	
	public Task getTask(String id) {
		return this.taskDao.getTask(id);
	}
	
	public void save(Task task){
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
		List attachments=task.getAttachments();
		if(attachments!=null){
			for (Iterator iterator = attachments.iterator(); iterator.hasNext();) {
				Attachment attachment = (Attachment) iterator.next();
				taskDao.saveAttachment(attachment);
			}
		}
		task.getAttachments();
	}

}