<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<!-- combotreee -->
		<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.lazyload.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script>
		$(document).ready(function() {
			$("#media-tab").addClass("active");
			//$('#cc').combotree({cascadeCheck:false});
			//$('#cc').combotree('setValue', '1-1-1');
			
			
			//var mynode=$('#cc').combotree('tree').tree('find','1-1-1');
			//console.log("begin print========mynode:");
			//console.log(mynode);
			//$('#cc').combotree('tree').tree('check',mynode.target);

			//$('#cc').combotree({ 
			//	onLoadSuccess:function(node){//数据加载成功触发 
			//		$('#cc').combotree('setValues', ['1-1-1','1-1-2']); 
			//	}
			//});

			
		});

		$(function() {          
		    $("img.lazy").lazyload({
		        event : "scroll",
				effect : "fadeIn",
				threshold : 0,
				effectspeed: 2000
		    });
		});
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
		<div class="span12">
			<form class="form-search form-inline" action="#">
			 	<label>类别</label> <!-- input type="text" name="search_categoryId"   class="input-small"  value="${param.search_categoryId}"--> 
			 	<!--select id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get'" multiple style="width:200px;" name="search_categoryId"></select-->
				<input id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get',required:false" style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="图片" <c:if test="${param.search_mediaType eq '图片'}">checked</c:if> >图片
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="视频" <c:if test="${param.search_mediaType eq '视频'}">checked</c:if>>视频
					</label>
					<label class="radio inline">
						<input type="radio" name="search_mediaType" value="音频" <c:if test="${param.search_mediaType eq '音频'}">checked</c:if>>音频
					</label>									


			   <mytag:PermssionTag functionId="F4-5"> <button type="submit" class="btn" id="search_btn">Search</button></mytag:PermssionTag>
			   <mytag:PermssionTag functionId="F4-2"> <a class="btn pull-right" href="${ctx}/media/upload">添加新资源</a></mytag:PermssionTag>
		    </form>
	    </div>
	</div>

	<div class="row">
		<div class="span12">
			<ul class="thumbnails">
				<c:forEach items="${medias.content}" var="media">
					<li class="span3">
						<!--a href="#" class="thumbnail"> <img src="${ctx}/plupload/files/small/${media.path}" alt=""-->
						 <div class="thumbnail">
						 	<img class="lazy" data-original="${ctx}/plupload/files/small/${media.path}" alt="" style="width:300px;height:200px;">
							<h5>${media.title}</h5>
							<p>${media.description}</p>
						</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="row">
	      <div id="affix_test"  class="span2" data-spy="affix" data-offset-top="200" style="margin-left:1250px !important;">
		 	<ul class="nav nav-list bs-docs-sidenav nav-stacked">
	          <li><a href="#" class="mynav">测试1</a></li>
	          <li><a href="#" class="mynav">测试2</a></li>
	          <li><a href="#" class="mynav">测试3</a></li>
	          <li><a href="#" class="mynav">测试4</a></li>
	        </ul>
		  </div>
		</div>

	</div>




	<tags:pagination page="${medias}" paginationSize="4"/>


</body>
</html>
