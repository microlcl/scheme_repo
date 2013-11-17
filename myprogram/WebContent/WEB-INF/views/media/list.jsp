<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
		<script type="text/javascript" language="javascript" src="${ctx}/static/carouFredSel-6.2.1/jquery.carouFredSel-6.2.1-packed.js"></script>

		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="${ctx}/static/carouFredSel-6.2.1/helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="${ctx}/static/carouFredSel-6.2.1/helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="${ctx}/static/carouFredSel-6.2.1/helper-plugins/jquery.transit.min.js"></script>
		<script type="text/javascript" language="javascript" src="${ctx}/static/carouFredSel-6.2.1/helper-plugins/jquery.ba-throttle-debounce.min.js"></script>
		
<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css" type="text/css" />
	<script>
		$(document).ready(function() {
			$("#media-tab").addClass("active");
		});
		
		$(function() {
			$("#foo1").carouFredSel({
				items		: 1,
				scroll		: {
					fx			: "crossfade"
				},
				auto		: false,
				pagination	: {
					container		: "#foo1_pag",
					anchorBuilder	: function( nr ) {
						var src = $("img", this).attr( "src" );
							src = src.replace( "/large/", "/small/");
						return '<img src="' + src + '" class="smallpic"' + '/>';
					}
				}
			});
});

	</script>
	
			<style type="text/css" media="all">
		.html_carousel {
	padding: 15px 0 15px 40px;
}
.html_carousel div.slide {
	position: relative;
}
.html_carousel div.slide div {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	display: none;
	position: absolute;
	bottom: 0;
}
.html_carousel div.slide h4 {
	font-size: 35px;
	padding: 30px 0 0 100px;
}
.html_carousel div.slide p {
	font-size: 16px;
	padding: 0 0 30px 100px;
}
.html_carousel div.slide h4, .html_carousel div.slide p {
	color: white;
	margin: 0;
}
div.thumbnails {
	text-align: center;
}
div.thumbnails img {
	cursor: pointer;
	border: 1px solid #ccc;
	background-color: white;
	padding: 9px;
	margin: 7px;
	display: inline-block;
}
div.thumbnails img:hover {
	background-color: #eee;
}
div.thumbnails img.selected {
	background-color: #ccc;
}
.clearfix {
	float: none;
	clear: both;
}

.smallpic {
	width: 100px;
	height: 100px;
}


		</style>
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
			
<div class="html_carousel">
<div class="thumbnails" id="foo1_pag"></div>
	<div id="foo1">
		<div class="slide">
			<img src="${ctx}/plupload/files/large/mypic2.jpg" alt="carousel 1" width="870" height="400" />
			<div style="display: block;">
				<h4>Infinity</h4>
				<p>A concept that in many fields refers to a quantity without bound or end.</p>
			</div>
		</div>
		<div class="slide">
			<img src="${ctx}/plupload/files/large/mypic1.jpg" alt="carousel 2" width="870" height="400" />
			<div style="display: block;">
				<h4>Circular journey</h4>
				<p>An excursion in which the final destination is the same as the starting point.</p>
			</div>
		</div>
		<div class="slide">
			<img src="${ctx}/plupload/files/large/mypic3.jpg" alt="carousel 3" width="870" height="400" />
			<div style="display: block;">
				<h4>jQuery</h4>
				<p>jQuery is a JavaScript library designed to simplify the client-side scripting.</p>
			</div>
		</div>
		<div class="slide">
			<img src="${ctx}/plupload/files/large/mypic4.jpg" alt="carousel 4" width="870" height="400" />
			<div style="display: block;">
				<h4>美女</h4>
				<p>jQuery is a JavaScript library designed to simplify the client-side scripting.</p>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	
</div>




</body>
</html>
