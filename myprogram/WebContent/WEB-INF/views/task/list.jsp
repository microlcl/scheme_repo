<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="form">
	<h1>协同作业</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class=" onefield" style="height:40px !important; text-align: right !important;padding-right: 10px;padding-top: 7px;margin-left:20px;background-color: white;">
			<form style="padding-left:10px;">
				<span  style="float:left;">
				部&nbsp;&nbsp;&nbsp;门：  <input name="search_department_id" id="mydepartment_id" style="width:150px;" value="${param.search_department_id }" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
				&nbsp; &nbsp;拥有者： <input name="search_owner_id" id="myaccount_id" value="${param.search_owner_id }" style="width:150px;" class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'">
				&nbsp; &nbsp;状&nbsp; &nbsp;态： <input  name="search_statusId" id="search_statusId" style="width:150px;" class="easyui-combotree" value="${param.search_statusId}"  data-options="url:'${ctx}/category/api/getAll/getTaskStatus',method:'get',required:false"> 
				&nbsp; &nbsp;<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:150px;margin-bottom: 0px;margin-left:10px;" placeholder="输入关键字搜索">
				<button type="submit" class="btn" id="search_btn_test"><i class="icon-search"></i></button>
				<button type="button" class="btn btn-success" onclick="location.href='${ctx}/task/add/'" style="margin-left: 20px;"><i class="icon-plus" style="margin-right: 5px;"></i>新建任务</button>
				&nbsp; &nbsp;&nbsp; &nbsp;<tags:sort/>
				</span>
			</form>
	</div>
	
	<div style="padding:20px;">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>任务描述</th>
			<th>状态</th>
			<th>拥有者</th>
			<th>创建时间</th>
			<th>优先度</th>
			<th>所属任务</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${tasks.content}" var="task">
			<tr>
				<td><a href="${ctx}/task/update?id=${task.id}">${task.summary}</a></td>
				<td>${task.status.name}&nbsp;</td>
				<td>${task.owner.name}</td> 
				<td><fmt:formatDate value="${task.createdTimestamp}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${task.priority.name}</td>
				<td><a href="${ctx}/case/detail/${task.cases.id}">${task.cases.title}</a></td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${tasks}" paginationSize="4"/>
	</div>
 </div>

<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>