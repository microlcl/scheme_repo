<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css" type="text/css" />
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
			    <a class="offset2 span2 btn pull-right" href="${ctx}/media/upload">添加新资源</a>
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
						<a href="${ctx}/resource/show/${resource.id}" id="editLink-${resource.id}"><i class="icon-pencil"></i> 修改</a>
				</td>
			</tr>
		</tbody>		
	</table>
	<img src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-01.jpg" class="img-polaroid mypic">
	<img src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-02.jpg" class="img-polaroid mypic">
	<img src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-03.jpg" class="img-polaroid mypic">

	<ul class="media-list">
		<li class="media">
		<a class="pull-left" href="#"> <img class="media-object mypic" src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-03.jpg"></a>
			<div class="media-body">
				<h4 class="media-heading">Media heading</h4>
				产品介绍
			</div></li>
			
					<li class="media">
		<a class="pull-left" href="#"> <img class="media-object mypic" src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-02.jpg"></a>
			<div class="media-body">
				<h4 class="media-heading">Media heading2</h4>
				产品介绍2
			</div></li>
	</ul>


</body>
</html>
