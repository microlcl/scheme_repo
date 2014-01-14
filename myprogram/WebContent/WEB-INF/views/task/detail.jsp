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
		<fieldset>
	<div class="control-group">
		<label class="control-label formlabel">任务类型:</label>
		<div class="controls">
			<input id="taskType" name="taskType.id" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9-1',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">任务状态:</label> 
		<div class="controls">
			<input id="status" name="status.id" class="easyui-combotree" style="width:225px;" data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">所属部门:</label> 
		<div class="controls">
		<input id="department" name="department.id"
			class="easyui-combotree" style="width:225px;"
			data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		</div>
	</div>
	<div class="control-group">		
		<label class="control-label formlabel">拥有者：</label>
		<div class="controls">
		 <input id="myaccount_id" name="owner.id"
			class="easyui-combobox" style="width:225px;"
			data-options="method:'get',valueField:'id',textField:'name'">
			</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">优先级：</label>
		<div class="controls">
		<input type="text" id="priority" name="priority.id"
			class="easyui-combotree" style="width:225px;"
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
					<input size="16" type="text" id="finishTime" name="finishTime"
						style="width: 160px" readonly>
						 <span class="add-on"><i class="icon-remove"></i></span> 
						 <span class="add-on"><i class="icon-th"></i></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">任务进度：</label>
		<div class="controls">
		<input type="text" id="progress" name="progress"
					class="input-large" maxlength="64" readonly value="0"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">剩余时间：</label>
		<div class="controls">
		<input type="text" id="timeRemaining" name="timeRemaining" value="0"
					class="input-large" maxlength="64" onkeyup="clearNoNum(this)"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label formlabel">创建人：</label>
		<div class="controls">
		<input type="text" 
					class="input-large" value="${user.name}" maxlength="64" readonly />
		<input type="hidden" id="createdBy" name="createdBy.id" 
					class="input-large" value="${user.id}" maxlength="64" readonly />
		</div>
	</div>
	 <div class="control-group">
		<label class="control-label formlabel">创建时间:</label>
		<div class="controls">
		<input type="text" id="createdTimestamp" 
					class="input-large" maxlength="64" readonly /> 
		</div>
	</div>
		</fieldset>
</div>

</div>
<label class=" offset1 formlabel">描述:</label>
		<textarea id="description" name="description"
					class="input-large offset1" maxlength="64" style="width: 70%" ></textarea>
					
		<legend>
			<small>讨论</small>
			
		</legend>


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
		$('#department').combotree({
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
</script>