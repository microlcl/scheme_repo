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
			<mytag:PermssionTag functionId="F4-1"><a id="media-tab" href="${ctx}/media/list?search_mediaType=picture">资源管理</a></mytag:PermssionTag>
			<mytag:PermssionTag functionId="F5-1"><a id="product-tab" href="${ctx}/product/list">产品管理</a></mytag:PermssionTag>
			<a id="space-tab" href="${ctx}/holder/list">场地管理</a>
			<a id="question-tab" href="${ctx}/question/list">问题管理</a>
			<a id="paper-tab" href="${ctx}/paper/list">调查问卷</a>
			<a id="collaboration-tab" href="${ctx}/task/list">协同作业</a>
		</div>
		<h1>业务</h1>
		<div class="submenu">
			<a id="caselist-tab" href="${ctx}/case/list">需求管理列表</a>	
			<a id="casemaintain-tab" href="${ctx}/case/detail/1">详情(暂放此)</a>
		</div>
		<h1>页面效果测试</h1>
		<div class="submenu">
			<a id="persistence-tab" href="${ctx}/demo/list">bootstrap demo</a>
			<a id="demo-tab" href="${ctx}/demo/test">jscrollpane demo</a>
			<a id="popupwindow-tab" href="${ctx}/demo/popupwindow">问题选择模态框</a>
			<a id="accountSelector-tab" href="${ctx}/demo/accountSelector">员工选择器</a>
		</div>
	</div>
</c:if>