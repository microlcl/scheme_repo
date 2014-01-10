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
		format : 'yyyy-mm-dd'
	});
</script>
<table>
	<tr>
		<td style="width:60%" align="center">任务类型：<input type="text" id="taskType" name="taskType.id"
			class="input-large required" maxlength="64" />
		</td>
		<td  align="right">任务状态： <input id="status" name="status.id"
			class="easyui-combotree" style="width: 220px;"
			data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
		</td>
	</tr>
	<tr>
		<td style="width:60%" align="center">所属部门： <input id="department" name="department.id"
			class="easyui-combotree"
			data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		</td>
		<td  align="right">拥有者： <input id="myaccount_id" name="owner.id"
			class="easyui-combobox"
			data-options="method:'get',valueField:'id',textField:'name'">
		</td>
	</tr>
	<tr>
		<td style="width:60%" align="center">	
			优先级：<input type="text" id="priority" name="priority.id"
			class="easyui-combotree" style="width: 220px;"
			data-options="url:'${ctx}/category/api/getAll/M1-9-2',method:'get',required:false">
		</td>
		<td  align="right">
				计划完成时间：
				<!-- 
				<div class="input-append date form_date" style="margin-left: 20px">
					<input size="16" type="text" id="dueDate" name="dueDate"
						style="width: 160px" readonly> <span class="add-on"><i
						class="icon-remove"></i></span> <span class="add-on"><i
						class="icon-th"></i></span>
				</div>
				 -->
		</td>
	</tr>
	<tr>
		<td style="width:60%" align="center">
				任务进度：<input type="text" id="progress" name="progress"
					class="input-large required" maxlength="64" readonly value="0"/>
		</td>
		<td  align="right">
					剩余时间：<input type="text" id="timeRemaining" name="timeRemaining" value="0"
					class="input-large required" maxlength="64" />
		</td>
	</tr>
	
	<tr>
		<td style="width:60%" align="center">
		创建人：<input type="text" id="createdBy" name="createdBy.id"
					class="input-large required" maxlength="64" readonly /> 
		</td>
		<td  align="right">
				创建时间：<input type="text" id="createdTimestamp" name="createdTimestamp"
					class="input-large required" maxlength="64" readonly /> 
		</td>
	</tr>
	<tr>
		<td colspan="2">
				描述：<textarea id="description" name="description"
					class="input-large required" maxlength="64" style="width: 90%" ></textarea>
		</td>
	</tr>
</table>