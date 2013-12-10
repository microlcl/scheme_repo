<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<%	org.springframework.data.domain.Page pageObj = (org.springframework.data.domain.Page)request.getAttribute("medias"); %>
<head>
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.lazyload.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/audioplayer.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery/audioplayer.css">
<script>
		var currentPage = <%=pageObj.getNumber() + 1%>
		function check() {
			$('.photoBox').mouseover(function(){
				console.log('Mouse is on this image');
				$(this).children('.check').show();
				console.log($(this).children('.check').children('.photoCheck').prop('checked'));
			});
			
			$('.photoBox').mouseout(function(){
								
				if($(this).children('.check').children('.photoCheck').prop('checked')==true){										
					$(this).children('.check').show();
				}else
				{
					$(this).children('.check').hide();
				}
															
			});
		}

		function lazyImgShow(obj){
			var _this = $(obj);
			imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
		}
		
		function imgShow(outerdiv, innerdiv, bigimg, _this){
			var src = _this.attr("src");
			var bigImgSrc = src.replace("/small/","/large/");
			$(bigimg).attr("src", bigImgSrc);
			
			$("<img/>").attr("src", bigImgSrc).load(function(){
				var windowW = $(window).width();
				var windowH = $(window).height();
				var realWidth = this.width;
				var realHeight = this.height;
				var imgWidth, imgHeight;
				var scale = 0.8;
				
				if(realHeight>windowH*scale) {
					imgHeight = windowH*scale;
					imgWidth = imgHeight/realHeight*realWidth;
					if(imgWidth>windowW*scale) {
						imgWidth = windowW*scale;
					}
				} else if(realWidth>windowW*scale) {
					imgWidth = windowW*scale;
					imgHeight = imgWidth/realWidth*realHeight;
				} else {
					imgWidth = realWidth;
					imgHeight = realHeight;
				}
				$(bigimg).css("width",imgWidth);
				
				var w = (windowW-imgWidth)/2;
				var h = (windowH-imgHeight)/2;
				$(innerdiv).css({"top":h, "left":w});
				$(outerdiv).fadeIn("fast");
			});
			
			$(outerdiv).click(function(){
				$(this).fadeOut("fast");
			});
		}

		$(document).ready(function() {
			$("#media-tab").addClass("active");
			check();

			$("#update").click(function(){
				if($("input:checkbox[name='picture']").is(':checked') == false){
					$("#warning-block").show();
				}else{
						$("#updatePic").attr("action", "${ctx}/media/editPicture");
						$("#updatePic").submit();
				}
			});
			
			$("#delete").click(function(){
				if(($("input:checkbox[name='picture']").is(':checked') == false) && ($("input:checkbox[name='audio']").is(':checked') == false)){
					$("#warning-block").show();
				}else if ($("input:checkbox[name='picture']").is(':checked') == true){
						$("#updatePic").attr("action", "${ctx}/media/deletePicture");
						$("#updatePic").submit();
				}else {
					    $("#updatePic").attr("action", "${ctx}/media/deleteAudio");
					    $("#updatePic").submit();
				}
				

			});
			
			$("#bigPic").click(function(){
				if($("input:checkbox[name='bigPic']").is(':checked') == true){
			//		$('#pictureSet').removeClass("span9");
			//		$('#pictureSet').addClass("span10");
					$('#thumbnailContainer li').removeClass("span2");
					$('#thumbnailContainer li').addClass("span3");
					$('#thumbnailContainer img').height("200px");
					$('#thumbnailContainer img').width("300px");
					$('#thumbnailContainer span').width("270px");
				}
				else{
			//		$('#pictureSet').removeClass("span10");
			//		$('#pictureSet').addClass("span9");
					$('#thumbnailContainer li').removeClass("span3");
					$('#thumbnailContainer li').addClass("span2");
					$('#thumbnailContainer img').height("120px");
					$('#thumbnailContainer img').width("200px");
					$('#thumbnailContainer span').width("170px");
				}
			});
			
			$("img.lazy").click(function(){
				var _this = $(this);
				imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
			});
		});
		$(function() {          
		    $("img.lazy").lazyload({
		        event : "scroll",
				effect : "fadeIn",
				threshold : 0,
				effectspeed: 2000
		    });
		});

		function loadMore() {
			var nextPage = currentPage + 1;
			console.log("next pageNum:" + nextPage);
			var queryString = '<%=request.getQueryString()%>';
			console.log(queryString);
			$.ajax({
				url : './api/search?' + queryString,
				type: 'get',
				data:{
					page:nextPage
				},
				success : function(resp) {
					currentPage++;
					console.log('in success function, currentPage = ' + currentPage);
					console.log(resp);
					if (resp.lastPage) {
						console.log("it's the last page");
						$('#loadMore').hide();
					}
					$.each(resp.content, function(i, media){
						console.log(i + "===" + media.path);
						var img;
						if($("input:checkbox[name='bigPic']").is(':checked') == true)
							img = '<li class="span3"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="" onclick="lazyImgShow(this)"  style="width: 300px; height: 200px; cursor: pointer;" id="'+media.id+'"><span style="width:270px">' + media.description+'</span><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+media.id+'" name="picture" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
						else
							img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="" onclick="lazyImgShow(this)"  style="width: 200px; height: 120px; cursor: pointer;" id="'+media.id+'"><span>' + media.description+'</span><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+media.id+'" name="picture" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';

						$('#thumbnailContainer').append(img);
					    $("#"+media.id).lazyload({
					        event : "scroll",
							effect : "fadeIn",
							threshold : 0,
							effectspeed: 2000
					    });
						
					});
				}
		});
			setTimeout(function(){
				$('#test').click();
			},3000);
			
		}
		$( 'audio' ).audioPlayer(
				{
				    classPrefix: 'player', // default value: 'audioplayer'
				    strPlay: 'Play', // default value: 'Play'
				    strPause: 'Pause', // default value: 'Pause'
				    strVolume: 'Volume', // default value: 'Volume'
				});		
		function testaudio(path){
				var audiopath= "${ctx}/plupload/audio/" + path;
				$("#audioplayer").attr("src", audiopath);
		}

</script>
<style>
.affix {
  top: 50px;
}
.affix-top {
  top: 240px;
  position:absolute;
}
.affix-bottom {
  bottom: 40px;
  position:absolute;
}

#affix_test {
	background-color:#FAFAFA;
	border: 1px solid #D4D4D4;
	border-radius: 6px 6px 6px 6px;
	margin: 30px 0 0;
	list-style: none outside none;
}

.mynav {
	border: 1px solid #E5E5E5;
    display: block;
    margin: 0 0 -1px;
    padding: 8px 14px;
    line-height: 30px !important;
    width:100%;
}

li a {cursor: pointer; }

{
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.thumbnails span {
    bottom: 0;
    color: #FFFFFF;
    display: block;
    font: bold 12px/30px Verdana,Arial;
    left: 0;
    opacity: 0.6;
    position: absolute;
    text-align: center;
    width: 170px;
}

.picture-panel {
    background: url("${ctx}/static/bootstrap/2.3.2/img/picturepanel.jpg") repeat scroll 0 0 #F7F7F7;
    border: 1px solid #E3E3E3;
    border-radius: 4px 4px 4px 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
    margin-bottom: 20px;
    min-height: 20px;
    padding: 19px;
}

.search-panel {
    border: 1px solid #E3E3E3;
    border-radius: 4px 4px 4px 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05) inset;
    margin-bottom: 10px;
    padding: 19px;
    width: 870px;
    height: 70px;
}
</style>
	
			
</head>

<body>
	<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
		<div id="innerdiv" style="position:absolute;">
			<img id="bigimg" style="border:5px solid #fff;" src="" />
		</div>
	</div>
	<div class="alert hide" id="warning-block">
  	   <strong>注意! </strong>请至少选中一个多媒体！
	</div>
	<h1>资源管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="search-panel">
		<div class="span10">
			<form class="form-search form-inline" action="#">
				<div>
				   <input type="text" name="search_keyword" value="${param.search_keyword}" style="width:600px">			   
				   <mytag:PermssionTag functionId="F4-5"> <button type="submit" class="btn" id="search_btn">Search</button></mytag:PermssionTag>
				   <label class="checkbox inline" style="margin-left:80px">									
				   	   <input id="bigPic" name="bigPic" type="checkbox" />大图模式
				   </label>
			   </div>
				<div style="padding-top:15px">
			 		<label>类别</label> <!-- input type="text" name="search_categoryId"   class="input-small"  value="${param.search_categoryId}"--> 
			 		<!--select id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get'" multiple style="width:200px;" name="search_categoryId"></select-->
					<input id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get',required:false" style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="picture" <c:if test="${param.search_mediaType eq 'picture'}">checked</c:if> >图片
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="video" <c:if test="${param.search_mediaType eq 'video'}">checked</c:if>>视频
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="audio" <c:if test="${param.search_mediaType eq 'audio'}">checked</c:if>>音频
					</label>
					<label class="checkbox inline" style="margin-left:20px">									
			   			我的资源<input value="${user.id}" type="checkbox" <c:if test="${!empty param.search_userId}">checked</c:if> name="search_userId"/>
			   		</label>
					
				</div>

			   <button id="test" class="btn btn-link" type="button" onclick="check()" style="display:none;">TEST...</button>
		    </form>
	    </div>
	</div>

	<form id="updatePic" action="">
	<div class="row">
		<c:if test="${param.search_mediaType eq 'picture'}">
			<div id="pictureSet" class="span9 picture-panel">
				<ul id="thumbnailContainer" class="thumbnails">
					<c:forEach items="${medias.content}" var="media">
							<li class="span2">
								 <div class="thumbnail photoBox"  style="z-index:1;position:relative;">
								 	
								 		<img class="lazy" data-original="${ctx}/plupload/files/small/${media.path}" alt="" style="width: 200px; height: 120px; cursor: pointer;" id="${media.id}">
									
									<span>${media.description}</span>
									<div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;">
										<input class="photoCheck" value="${media.id}" type="checkbox" name="picture" style="margin-left: 10px;margin-top:10px;"/>
									</div>
								</div>
							</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<c:if test="${param.search_mediaType eq 'audio'}">
			<div style="text-align:center;margin-left:30px;">
				
				<table id="audioTable" class="table table-striped table-bordered table-condensed" style="width:80% !important;">
					<tbody>
					<c:forEach items="${medias.content}" var="media" varStatus="status">
						
						<c:if test="${status.count%3==1}">
							<tr><td style="line-height: 30px;"><input class="audioCheck" value="${media.id}" type="checkbox" name="audio" style="margin-left: 10px;"/>&nbsp;&nbsp;${media.title}&nbsp;-&nbsp;${media.author}<a onclick="testaudio('${media.path}');" style="float:right; padding-right:5px;cursor: pointer;"><i class='icon-play'></i></a></td>
						</c:if>
						<c:if test="${status.count%3==2}">
							<td style="line-height: 30px;"><input class="audioCheck" value="${media.id}" type="checkbox" name="audio" style="margin-left: 10px;"/>&nbsp;&nbsp;${media.title}&nbsp;-&nbsp;${media.author}<a onclick="testaudio('${media.path}');" style="float:right; padding-right:5px;cursor: pointer;"><i class='icon-play'></i></a></td>
						</c:if>
						<c:if test="${status.count%3==0}">
							<td style="line-height: 30px;"><input class="audioCheck" value="${media.id}" type="checkbox" name="audio" style="margin-left: 10px;"/>&nbsp;&nbsp;${media.title}&nbsp;-&nbsp;${media.author}<a onclick="testaudio('${media.path}');" style="float:right; padding-right:5px;cursor: pointer;"><i class='icon-play'></i></a></td><tr>
						</c:if>
						
					</c:forEach>
					</tbody>		
				</table>
				
			</div>
			<div class="span8 offset3">
				<audio id="audioplayer" preload="auto" controls autoplay></audio>
			</div>
		</c:if> 
		<div class="row">
	      <div id="affix_test"  class="span2" data-spy="affix" data-offset-top="200" style="margin-left:1000px !important;">
		 	<ul class="nav nav-list bs-docs-sidenav nav-stacked">
		 	  <mytag:PermssionTag functionId="F4-2"><li><a href="${ctx}/media/upload" id="addMedio" class="mynav">增加</a></li></mytag:PermssionTag>
	          <li><a href="#" id="update" class="mynav">修改</a></li>
	          <li><a href="#" id="delete" class="mynav">删除</a></li>
	        </ul>
	      
		  </div>
		</div>
	</div>
	</form>	
		<%if (pageObj.hasNextPage()) {%>

	<div id="loadMore" class="pagination pagination-centered">
	    <button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
    </div>
    <% }%>
</body>
</html>
