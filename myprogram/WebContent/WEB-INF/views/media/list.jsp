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
		});
		
		$(function(){
			$('#myGallery').galleryView({
			transition_speed: 1000, 		//INT - duration of panel/frame transition (in milliseconds)
			transition_interval: 4000, 		//INT - delay between panel/frame transitions (in milliseconds)
			easing: 'swing', 				//STRING - easing method to use for animations (jQuery provides 'swing' or 'linear', more available with jQuery UI or Easing plugin)
			show_panels: true, 				//BOOLEAN - flag to show or hide panel portion of gallery
			show_panel_nav: false, 			//BOOLEAN - flag to show or hide panel navigation buttons
			enable_overlays: true, 			//BOOLEAN - flag to show or hide panel overlays
			
			panel_width: 650, 				//INT - width of gallery panel (in pixels)
			panel_height: 500, 				//INT - height of gallery panel (in pixels)
			panel_animation: 'slide', 		//STRING - animation method for panel transitions (crossfade,fade,slide,none)
			panel_scale: 'crop', 			//STRING - cropping option for panel images (crop = scale image and fit to aspect ratio determined by panel_width and panel_height, fit = scale image and preserve original aspect ratio)
			overlay_position: 'bottom', 	//STRING - position of panel overlay (bottom, top)
			pan_images: true,				//BOOLEAN - flag to allow user to grab/drag oversized images within gallery
			pan_style: 'drag',				//STRING - panning method (drag = user clicks and drags image to pan, track = image automatically pans based on mouse position
			pan_smoothness: 15,				//INT - determines smoothness of tracking pan animation (higher number = smoother)
			start_frame: 1, 				//INT - index of panel/frame to show first when gallery loads
			show_filmstrip: true, 			//BOOLEAN - flag to show or hide filmstrip portion of gallery
			show_filmstrip_nav: true, 		//BOOLEAN - flag indicating whether to display navigation buttons
			enable_slideshow: false,			//BOOLEAN - flag indicating whether to display slideshow play/pause button
			autoplay: false,				//BOOLEAN - flag to start slideshow on gallery load
			show_captions: true, 			//BOOLEAN - flag to show or hide frame captions	
			filmstrip_size: 3, 				//INT - number of frames to show in filmstrip-only gallery
			filmstrip_style: 'scroll', 		//STRING - type of filmstrip to use (scroll = display one line of frames, scroll filmstrip if necessary, showall = display multiple rows of frames if necessary)
			filmstrip_position: 'bottom', 	//STRING - position of filmstrip within gallery (bottom, top, left, right)
			frame_width: 164, 				//INT - width of filmstrip frames (in pixels)
			frame_height: 80, 				//INT - width of filmstrip frames (in pixels)
			frame_opacity: 0.5, 			//FLOAT - transparency of non-active frames (1.0 = opaque, 0.0 = transparent)
			frame_scale: 'crop', 			//STRING - cropping option for filmstrip images (same as above)
			frame_gap: 5, 					//INT - spacing between frames within filmstrip (in pixels)
			show_infobar: true,				//BOOLEAN - flag to show or hide infobar
			infobar_opacity: 1				//FLOAT - transparency for info bar
		});
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
						<img data-frame="${ctx}/plupload/files/small/${media.path}" src="${ctx}/plupload/files/large/${media.path}" title="Test Title" data-description="${media.description}" />
				</c:forEach>

			</ul>
		</div>
		<div class="span1"><h5>修改<h5></div>

	</div>



	<tags:pagination page="${medias}" paginationSize="4"/>
					<c:forEach items="${medias.content}" var="media">
						${ctx}/plupload/files/small/${media.path} <br/>
				</c:forEach>

</body>
</html>
