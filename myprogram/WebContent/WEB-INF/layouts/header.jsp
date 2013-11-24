<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="title">
	    <h1><a href="${ctx}">方案管理系统</a><small>--程序骨架</small>

			<div class="btn-group pull-right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="icon-user"></i> ${user.name}
					<span class="caret"></span>
				</a>
			
				<ul class="dropdown-menu">

						<li><a href="${ctx}/admin/user">Admin Users</a></li>
						<li class="divider"></li>

					<li><a href="${ctx}/account/editProfile/${user.id}">Edit Profile</a></li>
					<li><a href="${ctx}/account/logout">Logout</a></li>
				</ul>
			</div>
		</h1>
	</div>
</div>