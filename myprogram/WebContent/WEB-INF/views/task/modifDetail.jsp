<%@ page contentType="text/html;charset=UTF-8"%>
<style>
.form-horizontal .control-label {
    float: left;
    padding-top: 5px;
    text-align: left;
    width: 100px;
}

.form-horizontal .controls {
    margin-left: 100px;
}
</style>
<div class="form-horizontal">
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="business_type">任务类型:</label>
			<div class="controls">
				<input id="taskType" name="taskType.id"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getAll/M1-9-1',method:'get',required:false" value="${task.taskType.id}">
			</div>
		</div>
		<div class="control-group pull-right">
			<label class="control-label" for="finish_time">计划完成时间：</label>
			<div class="pull-right">
				<!--input type="text" class="span4" id="event_time" placeholder=""-->
				<div class="input-append date form_date" >
                    <input size="16" type="text" id="finishTime" name="finishTime" style="width:302px" value="<fmt:formatDate value='${task.dueDate}' pattern='yyyy-MM-dd hh:mm'/>" >
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="department">所属部门:</label>
			<div class="controls">
				<input id="mydepartment_id" name="department.id"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/department/api/get',method:'get',required:false" value="${task.department.id}">
			</div>
		</div>
		<div class="control-group span5 pull-right">
			<label class="control-label" for="task_create">创建人:</label>
			<div class="controls">
				<input type="text" class="span4" value="${task.createdBy.name}" maxlength="64" readonly >
				<input type="hidden" id="createdBy" name="createdBy.id" 
					class="span4" value="${task.createdBy.id}" maxlength="64" readonly />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_owner">拥有者:</label>
			<div class="controls">
				<input id="myaccount_id" name="owner.id"
				class="span4 easyui-combobox"
				data-options="method:'get',valueField:'id',textField:'name'" value="${task.owner.id}">		
			</div>
		</div>
		<div class="control-group span5 pull-right">
			<label class="control-label" for="task_progress">任务进度：</label>
			<div class="controls">
				<input type="text" class="span4" id="progress" name="progress" value="${task.progress}">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_priority">优先级：</label>
			<div class="controls">
				<input id="priority" name="priority.id"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getAll/M1-9-2',method:'get',required:false" value="${task.priority.id}">
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="time_remaining">剩余时间：</label>
			<div class="controls">
				<input type="text" class="span4" id="timeRemaining" name="timeRemaining" value="${task.timeRemaining}">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_status">任务状态:</label>
			<div class="controls">
				<input name="status.id" value="${task.status.id}" id="status"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false" value="${task.status.id}">
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="create_time">创建时间:</label>
			<div class="controls">
				<input type="text" class="span4" id="createdTimestamp"  value="<fmt:formatDate value="${task.createdTimestamp}" type="both" pattern="yyyy-MM-dd HH:mm"/>"
					 maxlength="64" readonly>
			</div>
		</div>
	</div>
	<div class="control-group">
			<label class="control-label" for="description">描述：</label>
			<div class="controls">
				<textarea rows="6" class="input-block-level" id="description" name="description" maxlength="1024">${task.description}</textarea>
			</div>
	</div>
	
	<div class="control-group">
	<label>评论:</label>
	<c:forEach items="${task.comments}" var="comment">	    
	     <label style="margin:20px;">${comment.user.name}&nbsp;&nbsp;<fmt:formatDate value='${comment.createdTimestamp}' type='both' pattern='yyyy-MM-dd HH:mm'/></label>
		 <div class="controls">${comment.comment}</div>
	</c:forEach>
	</div>
	
	<label >添加评论:</label>
	
	<div style="margin:10px 100px 15px;">	
	<textarea id="comment" name="comment"
					class="input-large offset1" maxlength="64" style="width: 70%" ></textarea>
					
	</div>
</div>	


<script type="text/javascript">
$('.form_date').datetimepicker({
		language : 'zh-CN',
		weekStart : 1,
		todayBtn : true,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0,
		pickerPosition: "bottom-left",
		format : 'yyyy-mm-dd HH:ii'
	});
	
CKEDITOR.replace('comment');
</script>