<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<!-- First, add jQuery (and jQuery UI if using custom easing or animation -->
	<!-- script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script-->
	<!--script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script-->
	
	<!-- Second, add the Timer and Easing plugins -->
	<script type="text/javascript" src="${ctx}/static/jackwanders-GalleryView-cfeeb10/js/jquery.timers-1.2.js"></script>
	<script type="text/javascript" src="${ctx}/static/jackwanders-GalleryView-cfeeb10/js/jquery.easing.1.3.js"></script>
	
	<!-- Third, add the GalleryView Javascript and CSS files -->
	<script type="text/javascript" src="${ctx}/static/jackwanders-GalleryView-cfeeb10/js/jquery.galleryview-3.0-dev.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/static/jackwanders-GalleryView-cfeeb10/css/jquery.galleryview-3.0-dev.css" />	

	<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css" type="text/css" />
	<!-- combotreee -->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script>
		$(document).ready(function() {
			$("#media-tab").addClass("active");
			$('#cc').combotree({cascadeCheck:false});
			$('#myGallery').galleryView();
		});


	</script>
	
			
</head>

<body>
	<h1>资源管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span10">
			<form class="form-search form-inline" action="#">
			 	<label>类别</label> <!-- input type="text" name="search_categoryId"   class="input-small"  value="${param.search_categoryId}"--> 
			 	<select id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get'" multiple style="width:200px;"></select>

					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="图片" checked>图片
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="视频" >视频
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="音频" >音频
					</label>									


			    <button type="submit" class="btn" id="search_btn">Search</button>
			    <a class="btn pull-right" href="${ctx}/media/upload">添加新资源</a>
		    </form>
	    </div>
	</div>

	<div class="row">
		<div class="span">
			<ul id="myGallery">
				<c:forEach items="${medias.content}" var="media">
					<li>
						<img src="${ctx}/plupload/files/large/${media.path}" alt="${media.description}" />
				</c:forEach>

			</ul>
		</div>
		<div class="span2"></div>

	</div>



	<tags:pagination page="${medias}" paginationSize="4"/>

</body>
</html>
