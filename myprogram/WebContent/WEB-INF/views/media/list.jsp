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
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
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
		$(document).ready(function() {
			$("#media-tab").addClass("active");
			check();

			$("#update").click(function(){
				$("#updatePic").attr("action", "${ctx}/media/editPicture");
				$("#updatePic").submit();
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
						var img = '<li class="span3"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="" style="width:300px;height:200px; " id="'+media.id+'"><h5>' + media.title+'</h5><p>'+media.description+'</p><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+media.id+'" name="picture" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
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

</style>
	
			
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


			   <mytag:PermssionTag functionId="F4-5"> <button type="submit" class="btn" id="search_btn">Search</button></mytag:PermssionTag>
			   <mytag:PermssionTag functionId="F4-2"> <a class="btn pull-right" href="${ctx}/media/upload">添加新资源</a></mytag:PermssionTag>
			   <button id="test" class="btn btn-link" type="button" onclick="check()" style="display:none;">TEST...</button>
		    </form>
	    </div>
	</div>
	
	<form id="updatePic" action="">
	<div class="row">
		<div class="span10">
			<ul id="thumbnailContainer" class="thumbnails">
				<c:forEach items="${medias.content}" var="media">
					<c:if test="${media.mediaType eq 'picture'}">
						<li class="span3">
							 <div class="thumbnail photoBox"  style="z-index:1;position:relative;">
							 	<img class="lazy" data-original="${ctx}/plupload/files/small/${media.path}" alt="" style="width:300px;height:200px;" id="${media.id}">
								<h5>${media.title}</h5>
								<p>${media.description}</p>
								<div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;">
									<input class="photoCheck" value="${media.id}" type="checkbox" name="picture" style="margin-left: 10px;margin-top:10px;"/>
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${media.mediaType eq 'audio'}">
					
					</c:if>
				</c:forEach>
			</ul>
		</div>
		
		<div class="row">
	      <div id="affix_test"  class="span2" data-spy="affix" data-offset-top="200" style="margin-left:1000px !important;">
		 	<ul class="nav nav-list bs-docs-sidenav nav-stacked">
	          <li><a href="#" id="update" class="mynav">修改资源信息</a></li>
	          <li><a href="#" class="mynav">测试2</a></li>
	          <li><a href="#" class="mynav">测试3</a></li>
	          <li><a href="#" class="mynav">测试4</a></li>
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
