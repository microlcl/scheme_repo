<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>角色管理</title>
	<script>
		$(document).ready(function() {
			$("#role-tab").addClass("active");
		});
	</script>
</head>
<body>
	<h1>帐号管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>角色名</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>经理&nbsp;</td>
				<td>
						<a href="${ctx}/account/update/${user.id}" id="editLink-${user.id}">修改</a>
				</td>
			</tr>
			<tr>
				<td>主管&nbsp;</td>
				<td>
						<a href="${ctx}/account/update/${user.id}" id="editLink-${user.id}">修改</a>
				</td>
			</tr>
			<tr>
				<td>员工&nbsp;</td>
				<td>
						<a href="${ctx}/account/update/${user.id}" id="editLink-${user.id}">修改</a>
				</td>
			</tr>
		</tbody>		
	</table>

</body>
</html>