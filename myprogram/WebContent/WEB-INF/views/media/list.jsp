<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	<script>
		$(document).ready(function() {
			$("#media-tab").addClass("active");
		});
	</script>
</head>

<body>
	<h1>资源管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
			<form class="form-search" action="#">
			 	<label>类别</label> <input type="text" name="search_type"   class="input-small"  value="${param.search_type}"> 
			    <label>Title：</label> <input type="text" name="search_title" class="input-small" value="${param.search_title}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
			    <a class="btn" href="${ctx}/media/upload">上传</a>
					</span>
		    </form>
	    </div>
	</div>	
			
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>简介</th>
			<th>类别</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>${user.status}&nbsp;</td>
				<td>
						<a href="${ctx}/resource/show/${resource.id}" id="editLink-${resource.id}">修改</a>
				</td>
			</tr>
		</tbody>		
	</table>
</body>
</html>
