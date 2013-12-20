<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:if test="${not empty user.id}">

	<div id="leftbar" class="span2">
		<h1>管理</h1>
		<div class="submenu">
			<mytag:PermssionTag functionId="F1-1"><a id="category-tab" href="${ctx}/category/list">类别管理</a></mytag:PermssionTag>
			<mytag:PermssionTag functionId="F2-1"><a id="account-tab" href="${ctx}/account/list">人员管理</a></mytag:PermssionTag>
			<mytag:PermssionTag functionId="F3-1"><a id="role-tab" href="${ctx}/role/list">角色管理</a></mytag:PermssionTag>
			<mytag:PermssionTag functionId="F4-1"><a id="media-tab" href="${ctx}/media/list?search_mediaType=picture">多媒体资源管理</a></mytag:PermssionTag>
			<mytag:PermssionTag functionId="F5-1"><a id="product-tab" href="${ctx}/product/list">产品</a></mytag:PermssionTag>
		</div>
		<h1>菜单2</h1>
		<div class="submenu">
			<a id="web-tab" href="${ctx}/story/web">子菜单1</a> <a
				id="webservice-tab" href="${ctx}/story/webservice">子菜单2</a> <a
				id="jmx-tab" href="${ctx}/story/jmx">子菜单3</a>
		</div>
		<h1>页面效果测试</h1>
		<div class="submenu">
			<a id="persistence-tab" href="${ctx}/demo/list">bootstrap demo</a> <a
				id="jms-tab" href="${ctx}/story/jms">子菜单2</a> <a id="reids-tab"
				href="${ctx}/story/redis">子菜单3</a> <a id="cache-tab"
				href="${ctx}/story/cache">子菜单4</a>
		</div>
	</div>
</c:if>