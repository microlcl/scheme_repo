<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
<!-- CKEditor (Rich Text Editor) -->
<script type="text/javascript" src="${ctx}/static/ckeditor/ckeditor.js"></script>
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
				data-options="url:'${ctx}/category/api/getAll/M1-9-1',method:'get',required:false">
			</div>
		</div>
		<div class="control-group pull-right">
			<label class="control-label" for="finish_time">计划完成时间：</label>
			<div class="pull-right">
				<!--input type="text" class="span4" id="event_time" placeholder=""-->
				<div class="input-append date form_date" >
                    <input size="16" type="text" id="finishTime" name="finishTime" style="width:302px">
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
				data-options="url:'${ctx}/department/api/get',method:'get',required:false">
			</div>
		</div>
		<div class="control-group span5 pull-right">
			<label class="control-label" for="task_create">创建人:</label>
			<div class="controls">
				<input type="text" class="span4" value="${user.name}" maxlength="64" readonly >
				<input type="hidden" id="createdBy" name="createdBy.id" 
					class="span4" value="${user.id}" maxlength="64" readonly />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_owner">拥有者:</label>
			<div class="controls">
				<input id="myaccount_id" name="owner.id"
				class="span4 easyui-combobox"
				data-options="method:'get',valueField:'id',textField:'name'">		
			</div>
		</div>
		<div class="control-group span5 pull-right">
			<label class="control-label" for="task_progress">任务进度：</label>
			<div class="controls">
				<input type="text" class="span4" id="progress" name="progress" readonly value="0">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_priority">优先级：</label>
			<div class="controls">
				<input id="priority" name="priority.id"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getAll/M1-9-2',method:'get',required:false">
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="time_remaining">剩余时间：</label>
			<div class="controls">
				<input type="text" class="span4" id="timeRemaining" name="timeRemaining" value="0">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="task_status">任务状态:</label>
			<div class="controls">
				<input name="status.id" id="status"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="create_time">创建时间:</label>
			<div class="controls">
				<input type="text" class="span4" id="createdTimestamp"  class="input-large" maxlength="64" readonly>
			</div>
		</div>
	</div>
	<div class="control-group">
			<label class="control-label" for="description">描述：</label>
			<div class="controls">
				<textarea rows="6" class="input-block-level" id="description" name="description" maxlength="1024"></textarea>
			</div>
	</div>
</div>				
		<legend>
			<small>讨论</small>
			
		</legend>
<label>评论:</label>
		<textarea id="comment" name="comment"
					class="input-large offset1" maxlength="64" style="width: 70%" ></textarea>
					
					

<div class="form-actions">
			<input id="cancel_btn" class="btn" type="submit" value="保存" />
		</div>


  

<script type="text/javascript">
//显示创建时间
	$(document).ready(function() {
		var d = new Date();
		var vYear = d.getFullYear();
		var vMon = d.getMonth() + 1;
		var vDay = d.getDate();
		var h = d.getHours(); 
		var m = d.getMinutes(); 
		var se = d.getSeconds(); 
		s=vYear+"-"+(vMon<10 ? "0" + vMon : vMon)+"-"+(vDay<10 ? "0"+ vDay : vDay)+" "+(h<10 ? "0"+ h : h)+":"+(m<10 ? "0" + m : m)+":"+(se<10 ? "0" +se : se);
		$("#createdTimestamp").val(s);
		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#mydepartment_id').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
		
	});
//时间控件
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
//验证输入数字	
	function clearNoNum(obj)
	{
	    //先把非数字的都替换掉，除了数字和.
	    obj.value = obj.value.replace(/[^\d.]/g,"");
	}
	
	CKEDITOR.replace('comment');
</script>