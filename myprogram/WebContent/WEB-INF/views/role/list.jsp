<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
	<h1>角色管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
			<form class="form-search" action="#">
			 	<label>角色名：</label> <input type="text" name="search_name"   class="input-small"  value="${param.search_name}"> 
		 	    <label>描述：</label> <input type="text" name="search_description" class="input-small" value="${param.search_description}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
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
						<a href="${ctx}/role/update/${role.id}" id="editLink-${role.id}"><i class="icon-pencil"></i> 修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${roles}" paginationSize="4"/>
</body>
</html>
