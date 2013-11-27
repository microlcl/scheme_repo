<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
	<div id="title">
	    <h1><a href="${ctx}">方案管理系统</a><small>--程序骨架</small>


		</h1>
	</div>	
</div>
<c:if test="${not empty user.id}">
<div class="navbar">
	<div class="navbar-inner">
		<a class="brand" href="#">方案管理系统</a>
		<ul class="nav">
			<li class="active"><a href="#" data-toggle="dropdown">管理</a>
				<ul class="dropdown-menu">
					<mytag:PermssionTag functionId="F1-1"><li><a href="${ctx}/category/">类别</a></li></mytag:PermssionTag>
					<mytag:PermssionTag functionId="F2-1"><li><a href="${ctx}/account/list">人员</a></li></mytag:PermssionTag>
					<mytag:PermssionTag functionId="F3-1"><li><a href="${ctx}/role/list">角色</a></li></mytag:PermssionTag>
					<mytag:PermssionTag functionId="F4-1"><li><a href="${ctx}/media/list?search_mediaType=图片">资源</a></li></mytag:PermssionTag>
					<mytag:PermssionTag functionId="F5-1"><li><a href="${ctx}/product/list">产品</a></li></mytag:PermssionTag>
				</ul></li>
			<li><a href="#">模块1</a></li>
			<li><a href="#">模块2</a></li>
		</ul>

		<div class="btn-group pull-right">
			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"> <i
				class="icon-user"></i> ${user.name} <span class="caret"></span>
			</a>

			<ul class="dropdown-menu">

				<li><a href="${ctx}/admin/user">Admin Users</a></li>
				<li class="divider"></li>

				<li><a href="${ctx}/account/editProfile/${user.id}">Edit
						Profile</a></li>
				<li><a href="${ctx}/account/logout">Logout</a></li>
			</ul>
		</div>
	</div>
</div>
</c:if>