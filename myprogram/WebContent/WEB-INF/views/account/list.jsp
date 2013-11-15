<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#account-tab").addClass("active");
		});
	</script>
</head>

<body>
	<h1>帐号管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
			<form class="form-search" action="#">
			 	<label>登录名：</label> <input type="text" name="search_id"   class="input-small"  value="${param.search_id}"> 
			    <label>邮件名：</label> <input type="text" name="search_email" class="input-small" value="${param.search_email}">
			    <label>部门：</label><input name="search_department_id" class="easyui-combotree" value="${param.search_department_id}" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
			    <button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	    <tags:sort/>
	</div>	
			
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>登录名</th>
			<th>姓名</th>
			<th>电邮</th>
			<th>部门</th>
			<th>角色</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${users.content}" var="user">
			<tr>
				<td>${user.id}&nbsp;</td>
				<td>${user.name}&nbsp;</td>
				<td>${user.email}&nbsp;</td>
				<td>${user.department.name}</td>
				<td>
				<c:forEach items="${user.roles}" var="role">
					${role.name}&nbsp;
				</c:forEach>
				</td>
				<td>${user.status}&nbsp;</td>
				<td>
						<a href="${ctx}/account/show/${user.id}" id="editLink-${user.id}"><i class="icon-pencil"></i> 修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${users}" paginationSize="4"/>
</body>
</html>
