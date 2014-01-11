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
<div class="row" style="margin:0px;">
<div class="span5" style="padding:10px;margin-left:0px;">
	<form class="form-horizontal">
		<fieldset>
	<div class="control-group">
		<label class="control-label">任务类型:</label>
		<div class="controls">
			<input id="taskType" name="taskType.id" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9-1',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">任务状态:</label> 
		<div class="controls">
			<input id="status" name="status.id" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">所属部门:</label> 
		<div class="controls">
		<input id="department" name="department.id"
			class="easyui-combotree" style="width:225px;"
			data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">		
		<label class="control-label">拥有者：</label>
		<div class="controls">
		 <input id="myaccount_id" name="owner.id"
			class="easyui-combobox" style="width:225px;"
			data-options="method:'get',valueField:'id',textField:'name'">
			</div>
	</div>
	<div class="control-group">
		<label class="control-label">优先级：</label>
		<div class="controls">
		<input type="text" id="priority" name="priority.id"
			class="easyui-combotree" style="width:225px;"
			data-options="url:'${ctx}/category/api/getAll/M1-9-2',method:'get',required:false">
		</div>
	</div>	
	</fieldset>
      </form>
</div>
<div class="span5" style="padding:10px;margin-left:0px;">	
	<form class="form-horizontal">
		<fieldset>

	<div class="control-group">
		<label class="control-label">计划完成时间：</label>
		<div class="input-append date form_date controls" style="margin-left: 20px">
					<input size="16" type="text" id="dueDate" name="dueDate"
						style="width: 160px" readonly>
						 <span class="add-on"><i class="icon-remove"></i></span> 
						 <span class="add-on"><i class="icon-th"></i></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">任务进度：</label>
		<div class="controls">
		<input type="text" id="progress" name="progress"
					class="input-large" maxlength="64" readonly value="0"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">剩余时间：</label>
		<div class="controls">
		<input type="text" id="timeRemaining" name="timeRemaining" value="0"
					class="input-large" maxlength="64" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">创建人：</label>
		<div class="controls">
		<input type="text" id="createdBy" name="createdBy.id"
					class="input-large" maxlength="64" readonly />
		</div>
	</div>
	 <div class="control-group">
		<label class="control-label">创建时间:</label>
		<div class="controls">
		<input type="text" id="createdTimestamp" name="createdTimestamp"
					class="input-large" maxlength="64" readonly /> 
		</div>
	</div>
		</fieldset>
      </form>
</div>

</div>
<label class=" offset1">描述:</label>
		<textarea id="description" name="description"
					class="input-large offset1" maxlength="64" style="width: 70%" ></textarea>




  

<script type="text/javascript">
	$(document).ready(function() {

		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#department').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
		var time=new Date();  
		$("#createdTimestamp").val(time);
	});

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
</script>