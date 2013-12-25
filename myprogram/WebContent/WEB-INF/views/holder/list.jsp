<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<title>场地管理</title>
	<script>
		$(document).ready(function() {
			$("#account-tab").addClass("active");
		});
	</script>
</head>
<body>
<div class="form" style="padding:20px;">
	<h1>场地管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
		  	<form class="form-search" action="#">
			 	<label>酒店名称：</label> <input type="text" name="search_holder_name"   class="input-small"  value="${param.search_holder_name }"> 
			    <label>星级：</label> <input type="text" name="search_level" class="input-small" value="${param.search_level}">
			    <label>关键字：</label> <input type="text" name="search_keyword" class="input-small" value="${param.search_keyword}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
			    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
			    <a href="${ctx}/holder/add/" >创建新场地</a>
		    </form>
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
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${spaces.content}" var="space">
			<tr>
				<td>${space.space_name}</td>
				<td>${space.volume}</td>
				<td>${space.holders.holder_name}&nbsp;</td>
				<td>${space.holders.level}</td>
				<td>${space.holders.address}</td>
				<td>
					<a href="${ctx}/holder/show/holderInfo/${space.id}" id="info-${space.id}"><i class="icon-pencil"></i> 查看</a>
					<a href='${ctx}/holder/update/${space.id}' id='editLink-${space.id}'><i class='icon-edit'></i> 修改</a>
					<a href="javascript: if(confirm('确定删除吗')){location.href='${ctx}/holder/delete/${space.id}';}" id="editLink-${space.id}"><i class="icon-remove-circle"></i> 删除</a>
				</td>
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