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
	<script>
		$(document).ready(function() {
			$("#media-tab").addClass("active");
		});
		
		$(function(){
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
		<div class="span">
			<form class="form-search" action="#">
			 	<label>类别</label> <input type="text" name="search_type"   class="input-small"  value="${param.search_type}"> 
			    <label>Title：</label> <input type="text" name="search_title" class="input-small" value="${param.search_title}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
			    <a class="offset2 span2 btn pull-right" href="${ctx}/media/upload">添加新资源</a>
		    </form>
	    </div>
	</div>	
			

	<ul id="myGallery">
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp1.jpg" alt="Lone Tree Yellowstone" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp2.jpg" alt="Is He Still There?!" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp4.jpg" alt="Noni Nectar For Green Gecko" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp7.jpg" alt="Flight of an Eagle Owl" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp14.jpg" alt="Winter Lollipops" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp26.jpg" alt="Day of Youth" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp27.jpg" alt="Sunbathing Underwater" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp28.jpg" alt="Untitled" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp41.jpg" alt="New Orleans Streetcar" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp49.jpg" alt="By The Wind of Chance" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp52.jpg" alt="Fishing on the Cloud" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp53.jpg" alt="Blue Lagoon" />
		<li><img src="http://www.spaceforaname.com/galleryview/img/photos/bp54.jpg" alt="Time" />
	</ul>



</body>
</html>
