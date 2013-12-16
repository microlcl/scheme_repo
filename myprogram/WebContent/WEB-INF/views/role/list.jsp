<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<title>角色管理</title>
	<script>
		$(document).ready(function() {
			$("#role-tab").addClass("active");
		});
		function fn(){
			location.href='${ctx}/role/add/';
		}
	</script>
</head>

<body>
<div class="form" style="padding:20px;">
	<h1>角色管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span">
			<form class="form-search" action="#">
			 	<label>角色名：</label> <input type="text" name="search_name"   class="input-small"  value="${param.search_name}"> 
		 	    <label>描述：</label> <input type="text" name="search_description" class="input-small" value="${param.search_description}">
			   <mytag:PermssionTag functionId="F3-2"> <button type="submit" class="btn" id="search_btn">Search</button></mytag:PermssionTag>
			    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
		 <!--	<button class="btn btn-danger" onclick="fn()">创建新角色</button>	 -->
				<mytag:PermssionTag functionId="F3-2"><a href="${ctx}/role/add/" >创建新角色</a></mytag:PermssionTag>
		    </form>
	    </div>
	    <tags:sort/>
	</div>	
			
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>角色名</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${roles.content}" var="role">
			<tr>
				<td>${role.name}&nbsp;</td>
				<td>${role.description}&nbsp;</td>
				<td>
					<mytag:PermssionTag functionId="F3-3"><a href='${ctx}/role/update/${role.id}' id='editLink-${role.id}'><i class='icon-edit'></i> 修改</a></mytag:PermssionTag>
					<mytag:PermssionTag functionId="F3-4"><a href="javascript: if(confirm('确定删除吗')){location.href='${ctx}/role/delete/${role.id}';}" id="editLink-${role.id}"><i class="icon-remove-circle"></i> 删除</a></mytag:PermssionTag>
				</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${roles}" paginationSize="4"/>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
</div>
</body>
</html>
