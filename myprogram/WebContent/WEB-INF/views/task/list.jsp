<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
    <title>协同作业</title>
    <link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
    <script>
    $(document).ready(function() {
		$("#task-tab").addClass("active");

		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#mydepartment_id').combotree({
			onChange : function(node) {
				var url = '../account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
	});
	</script>
	</head>
<body>
	<div class="form" style="padding:20px;">
	<h1>协同作业</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
    <div class="row">
		<div class="span">
			<form class="form-search" action="#">
			 	<label>部门：</label> <input name="search_department" id="mydepartment_id" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		 	    <label>拥有者：</label> <input name="search_owner" id="myaccount_id" class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'">
		 	    <label>状态：</label> <input type="text" name="search_description" class="input-small" value="${param.search_status}">
		 	    <label>关键字：</label><input type="text" name="search_keyword" class="input-small" value="${param.search_keyword}" style="width:205px;">
                <button type="submit" class="btn" id="search_btn">Search</button>
	    </div>
	    <tags:sort/>
	    </div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>任务描述</th>
			<th>状态</th>
			<th>拥有者</th>
			<th>创建时间</th>
			<th>优先度</th>
			<th>所属案例</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${tasks.content}" var="task">
			<tr>
				<td>${task.summary}&nbsp;</td>
				<td>${task.status}&nbsp;</td>
				<td>${task.owner}</td> 
				<td>${task.createdTimestamp}</td>
				<td>${task.priority}</td>
				<td></td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${tasks}" paginationSize="4"/>
 </div>

<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>