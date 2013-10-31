<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<c:if test="${not empty user.id}">

	<div id="leftbar" class="span2">
		<h1>管理</h1>
		<div class="submenu">
			<a id="category-tab" href="${ctx}/category/">类别管理</a>
			<a id="account-tab" href="${ctx}/account/list">人员管理</a>
		</div>
		<h1>菜单2</h1>
		<div class="submenu">
			<a id="web-tab" href="${ctx}/story/web">子菜单1</a> <a
				id="webservice-tab" href="${ctx}/story/webservice">子菜单2</a> <a
				id="jmx-tab" href="${ctx}/story/jmx">子菜单3</a>
		</div>
		<h1>菜单3</h1>
		<div class="submenu">
			<a id="persistence-tab" href="${ctx}/story/persistence">子菜单1</a> <a
				id="jms-tab" href="${ctx}/story/jms">子菜单2</a> <a id="reids-tab"
				href="${ctx}/story/redis">子菜单3</a> <a id="cache-tab"
				href="${ctx}/story/cache">子菜单4</a>
		</div>
	</div>
</c:if>