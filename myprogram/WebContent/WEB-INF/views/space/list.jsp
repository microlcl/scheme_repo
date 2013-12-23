<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>场地管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
</head>
<body>
<div class="from" style="padding:20px;">
	<h1>场地管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
		<!--  	<form class="form-search" action="#">
			 	<label>酒店名称：</label> <input type="text" name="search_holder_name"   class="input-small"  value="${param.search_holder_name }"> 
			    <label>星级：</label> <input type="text" name="search_level" class="input-small" value="${param.search_level}">
			    <label>关键字：</label> <input type="text" name="search_keyword" class="input-small" value="${param.search_keyword}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
		  -->
	    </div>
	    <tags:sort/>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>场地名称</th>
			<th>容纳人数</th>
			<th>所属酒店</th>
			<th>星级</th>
			<th>场地地址</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${spaces.content}" var="space">
			<tr>
				<td>
					<a href="${ctx}/space/show/spacesInfo/${space.space_name}" id="info-${space.space_name}"><i class="icon-pencil"></i> ${space.space_name}&nbsp;</a>
				</td>
				<td>${space.volume}&nbsp;</td>
				<td>${space.holders.name}&nbsp;</td>
				<td>${space.holders.level}</td>
				<td>${space.holders.address}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<tags:pagination page="${spaces}" paginationSize="4"/>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>