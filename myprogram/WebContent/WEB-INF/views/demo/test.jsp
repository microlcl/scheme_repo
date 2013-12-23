<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery图片切换</title>
<meta name="description" content="jquery 图片滑动制作左右按钮控制图片上下滑动，通过点击滑动图片切换大图，点击查看按钮显示图片详细信息。" />
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:none;}
a{color:#000;text-decoration:none;}
.cr-nav span {
	background:transparent url(/myprogram/static/jquery-jscrollpane/images/nav.png) no-repeat top left !important ;
}

h2 {
	font-size: 30px !important;
    font-weight: bold !important;
    color: #FAA732 !important;
    margin-right: 20px;
}
</style>

<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-jscrollpane/style.css" />
<link type="text/css" href="${ctx}/static/jquery-jscrollpane/jquery.jscrollpane.css" rel="stylesheet" media="all" />

</head>
<body>
<div class="cr-container" id="cr-container">
	<div class="cr-content-wrapper" id="cr-content-wrapper">
		<div class="cr-content-container" id="content-1" style="display:block;">
			<img src="${ctx}/plupload/files/large/bp9.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.01</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-2">
			<img src="${ctx}/plupload/files/large/bp2.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.02</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
					<p>Eveen the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-3">
			<img src="${ctx}/plupload/files/large/bp3.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.03</p>
					<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-4">
			<img src="${ctx}/plupload/files/large/bp4.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span> <a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.04</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-5">
			<img src="${ctx}/plupload/files/large/bp5.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.05</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-6">
			<img src="${ctx}/plupload/files/large/bp6.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.06</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-7">
			<img src="${ctx}/plupload/files/large/bp7.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.07</p>
					<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by 
					the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
				</div>
			</div>
		</div>
		<div class="cr-content-container" id="content-8">
			<img src="${ctx}/plupload/files/large/bp8.jpg" class="cr-img"/>
			<div class="cr-content">
				<div class="cr-content-headline">
					<h2>产品展示</h2>
					<h3><span>产品描述...</span><a href="javascript:void(0);" class="cr-more-link">点击查看全部描述 →</a></h3>
				</div>
				<div class="cr-content-text">
					<p>NO.08</p>
					<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
					<p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn&#39;t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
					<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then</p>
				</div>
			</div>
		</div>
	</div>
	<div class="cr-thumbs">
		<div data-content="content-1" class="cr-selected">
			<img src="${ctx}/plupload/files/small/bp9.jpg" />
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-2">
			<img src="${ctx}/plupload/files/small/bp2.jpg" />
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-3">
			<img src="${ctx}/plupload/files/small/bp3.jpg" />
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-4">
			<img src="${ctx}/plupload/files/small/bp4.jpg"/>
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-5">
			<img src="${ctx}/plupload/files/small/bp5.jpg"/>
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-6">
			<img src="${ctx}/plupload/files/small/bp6.jpg"/>
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-7">
			<img src="${ctx}/plupload/files/small/bp7.jpg"/>
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
		<div data-content="content-8">
			<img src="${ctx}/plupload/files/small/bp8.jpg"/>
			<h4><a href="http://www.17sucai.com/">Title</a></h4>
		</div>
	</div>
</div><!-- cr-container -->
		
		
<!-- the jScrollPane script -->
<script type="text/javascript" src="${ctx}/static/jquery-jscrollpane/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-jscrollpane/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-jscrollpane/jquery.crotator.js"></script>
<script type="text/javascript">
$(window).load(function(){
	$('#cr-container').crotator();
});
</script>



</body>

</html>