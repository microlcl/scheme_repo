<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>协同作业</title>
    <link rel="stylesheet" type="text/css"  href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css"	href="${ctx}/static/styles/form.css">
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/easyui/jquery.easyui.min.js"	type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/static/ckeditor/ckeditor.js"></script>	
    <script>
    $(document).ready(function() {
		$("#task-tab").addClass("active");
		

		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#mydepartment_id').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
		var defaultDept = $('#mydepartment_id').combotree('getValue');
    	if (defaultDept) {
    		var url = '${ctx}/account/api/search?departmentId=' + defaultDept;
			$('#myaccount_id').combobox('reload', url);
    	}
    });
   
	</script>
</head>
<body>
<div class="form">
		<h1>修改任务</h1>
		<form id="taskForm" class="form" style="padding:20px;" action="${ctx}/task/doUpdate" method="post">
		<div class="row">
			<div class="span">
				<div class="form-search" style="padding-left:20px;">
					<label for="case_title">概要：</label> 
					<input type="text" class="input-xxlarge" id="summary" name="summary" value="${task.summary}">
					<input type="hidden" name="id" value="${task.id}">
				</div>
			</div>
			<div class="pull-right">
				<input name="status.id" id="status"
				class="span easyui-combotree" 
				data-options="url:'${ctx}/category/api/getAll/getTaskStatus',method:'get',required:false" value="${task.status.id}">

				</div>
		</div>
		<div style="padding: 20px;">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#detail" data-toggle="tab">任务详细信息</a></li>
					<li><a href="#other" data-toggle="tab">附属内容</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="detail">
						 <%@ include file="modifDetail.jsp"%>
					</div>
					<div class="tab-pane" id="other">
						<%@ include file="modifOther.jsp"%>
					</div>
								
				</div>
			</div>

		</div>
	</form>
	</div>
</body>
</html>

