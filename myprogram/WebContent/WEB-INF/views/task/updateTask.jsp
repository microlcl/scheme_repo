<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>协同作业</title>
    
    <link
	href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/styles/form.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<script
	src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script
	src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/static/ckeditor/ckeditor.js"></script>	
    <script>
    $(document).ready(function() {
		$("#task-tab").addClass("active");
		
		var url = '${ctx}/account/api/search?departmentId=D1';
		$('#myaccount_id').combobox('reload', url);
	
		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#department').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
    });
    
	</script>
</head>
<body>
<div class="form">
		<h1>修改任务</h1>
		<form id="taskForm" action="${ctx}/task/update" method="post" class="form-horizontal" >
		<div>
		<p style="padding-left:130px;" class="formlabel" > 
		摘要：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="summary" name="summary" value="${task.summary}"  maxlength="256" style="width: 60%" class="required"/>
		</p>
		<div class="row" style="margin:0px;">
	<div class="span5" style="padding:10px;margin-left:0px;">
		<fieldset>
	<div class="control-group">
		<label class="control-label formlabel">任务类型:</label>
		<div class="controls">
			<input id="taskType" name="taskType.id" value="${task.taskType.id}" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9-1',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">任务状态:</label> 
		<div class="controls">
			<input id="status" name="status.id" value="${task.status.id}" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">所属部门:</label> 
		<div class="controls">
		<input id="department" name="department.id"
			class="easyui-combotree" style="width:225px;" value="${task.department.id}"
			data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">		
		<label class="control-label formlabel">拥有者：</label>
		<div class="controls">
		 <input id="myaccount_id" name="owner.id"
			class="easyui-combobox" style="width:225px;" value="${task.owner.id}"
			data-options="method:'get',valueField:'id',textField:'name'"> 
			</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">优先级：</label>
		<div class="controls">
		<input type="text" id="priority" name="priority.id"
			class="easyui-combotree" style="width:225px;" value="${task.priority.id}"
			data-options="url:'${ctx}/category/api/getAll/M1-9-2',method:'get',required:false">
		</div>
	</div>	
	</fieldset>
</div>
<div class="span5" style="padding:10px;margin-left:0px;">	
		<fieldset>

	<div class="control-group">
		<label class="control-label formlabel">计划完成时间：</label>
		<div class="input-append date form_date controls" style="margin-left: 20px">
					<input size="16" type="text" id="finishTime" name="finishTime" value="<fmt:formatDate value='${task.dueDate}' type='both' pattern='yyyy-MM-dd HH:mm'/>" style="width: 160px">
						 <span class="add-on"><i class="icon-remove"></i></span> 
						 <span class="add-on"><i class="icon-th"></i></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">任务进度：</label>
		<div class="controls">
		<input type="text" id="progress" name="progress" value="${task.progress}"
					class="input-large" maxlength="64" readonly value="0"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">剩余时间：</label>
		<div class="controls">
		<input type="text" id="timeRemaining" name="timeRemaining" value="${task.timeRemaining}"
					class="input-large" maxlength="64" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">创建人：</label>
		<div class="controls">
		<input type="text" 
					class="input-large" value="${task.createdBy.name}" maxlength="64" readonly />
		<input type="hidden" id="createdBy" name="createdBy.id" 
					class="input-large" value="${task.createdBy.id}" maxlength="64" readonly />
		</div>
	</div>
	 <div class="control-group">
		<label class="control-label formlabel">创建时间:</label>
		<div class="controls">
		<input type="text" id="createdTimestamp"  value="<fmt:formatDate value="${task.createdTimestamp}" type="both" pattern="yyyy-MM-dd HH:mm"/>"
					class="input-large" maxlength="64" readonly /> 
		</div>
	</div>
		</fieldset>
</div>

</div>
<label class=" offset1 formlabel">描述:</label>
		<textarea id="description" name="description"  
					class="input-large offset1" maxlength="64" style="width: 70%" >${task.description}</textarea>

		<legend>
			<small>讨论</small>
			
		</legend>
	<div style="margin:10px 20px 15px;">	
	
	<label class="formlabel">评论:</label>
	<c:forEach items="${task.comments}" var="comment">
	     <p>${comment.user.name}</p>
	     <p><fmt:formatDate value='${comment.createdTimestamp}' type='both' pattern='yyyy-MM-dd HH:mm'/></p>
		<textarea  name="comment" 
					class="input-large offset1" maxlength="64" style="width: 60%" readonly>${comment.comment}</textarea>
	</c:forEach>
	
	<label class="formlabel">添加评论:</label>
	
	<textarea id="comment" name="comment"
					class="input-large offset1" maxlength="64" style="width: 70%" ></textarea>
					
	</div>
	
					
  <div class="form-actions">
			<input id="cancel_btn" class="btn" type="submit" value="保存" />
		</div>
	</div>
</form>
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
</body>
</html>

