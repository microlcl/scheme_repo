<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<%	org.springframework.data.domain.Page pageObj = (org.springframework.data.domain.Page)request.getAttribute("products"); %>
<head>
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">

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
			$("#product-tab").addClass("active");
			check();

			$("#update").click(function(){
				if($("input:checkbox[name='productId']").is(':checked') == false){
					$("#warning-block_1").show();
					$("#warning-block_2").hide();
				}
				else if($("input[name='productId']:checked").length > 1){
					$("#warning-block_2").show();
					$("#warning-block_1").hide();
				}else{
					$("#updateProduct").attr("action", "${ctx}/product/update");
					$("#updateProduct").submit();
				}
			});
			$("#view").click(function(){
				if(($("input:checkbox[name='productId']").is(':checked') == false)){
					$("#warning-block").show();
				}else{
					//var temp=$("input[name='productId'][checked]");
					//var temp=$("#productId").attr("value");
					//alert(temp.length);
					$("#updateProduct").attr("action", "${ctx}/product/view");
					$("#updateProduct").submit();
				}
			});
			$("#delete").click(function(){
				if(($("input:checkbox[name='productId']").is(':checked') == false)){
					$("#warning-block").show();
				}else{
					if(confirm('确定删除吗')){
						$("#updateProduct").attr("action", "${ctx}/product/delete");
						$("#updateProduct").submit();
					}
				}
			});
			
			$("#bigPic").click(function(){
				if($("input:checkbox[name='bigPic']").is(':checked') == true){
				//	$('#productSet').removeClass("span9");
				//	$('#productSet').addClass("span10");
					$('#thumbnailContainer li').removeClass("span2");
					$('#thumbnailContainer li').addClass("span3");
					$('#thumbnailContainer img').height("200px");
					$('#thumbnailContainer img').width("300px");
				}
				else{
				//	$('#productSet').removeClass("span10");
				//	$('#productSet').addClass("span9");
					$('#thumbnailContainer li').removeClass("span3");
					$('#thumbnailContainer li').addClass("span2");
					$('#thumbnailContainer img').height("120px");
					$('#thumbnailContainer img').width("200px");
				}
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
					$.each(resp.content, function(i, product){
						console.log(i + "===" + product.media.path);
						var img;
						if($("input:checkbox[name='bigPic']").is(':checked') == true){
							if(product.description != null || product.description != "")
								img = '<li class="span3"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><a href="${ctx}/product/view?productId='+product.id+'"title="'+product.description+'"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.media.path+'" src="${ctx}/plupload/files/small/'+product.media.path+'" alt="" style="width:300px;height:200px; " id="'+product.id+'"><div class="description">'+product.description+'</a></div><div class="p-price"><strong>￥'+product.price+'</strong></div><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
							else
								img = '<li class="span3"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><a href="${ctx}/product/view?productId='+product.id+'"title="'+product.description+'"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.media.path+'" src="${ctx}/plupload/files/small/'+product.media.path+'" alt="" style="width:300px;height:200px; " id="'+product.id+'"><div class="description">'+product.title+'</a></div><div class="p-price"><strong>￥'+product.price+'</strong></div><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
						}
						else{
							if(product.description != null || product.description != "")
								img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><a href="${ctx}/product/view?productId='+product.id+'"title="'+product.description+'"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.media.path+'" src="${ctx}/plupload/files/small/'+product.media.path+'" alt="" style="width:200px;height:120px; " id="'+product.id+'"><div class="description">'+product.description+'</a></div><div class="p-price"><strong>￥'+product.price+'</strong></div><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
							else
								img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><a href="${ctx}/product/view?productId='+product.id+'"title="'+product.description+'"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.media.path+'" src="${ctx}/plupload/files/small/'+product.media.path+'" alt="" style="width:200px;height:120px; " id="'+product.id+'"><div class="description">'+product.title+'</a></div><div class="p-price"><strong>￥'+product.price+'</strong></div><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
						}

						$('#thumbnailContainer').append(img);
					    $("#"+product.id).lazyload({
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
		
		function vailFloatNumberPerfect(evnt,obj){
			 evnt=evnt||window.event;
			 var keyCode=window.event?evnt.keyCode:evnt.which;

			 if((obj.value.length==0 || obj.value.indexOf(".")!=-1) && keyCode==46) return false;
			 return keyCode>=48&&keyCode<=57||keyCode==46||keyCode==8;
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

.description {
	height: 3em;
    word-wrap: break-word;
    word-break: break-all;
    overflow: hidden;
}

.thumbnail:hover {
	border: 1px solid #7EC0EE;
}
.thumbnails a {
    color: #666666;
    text-decoration: none;
}
.thumbnails a:hover, a:active {
    color: #E4393C;
    text-decoration: underline;
}

.p-price{
	height: 20px;
    overflow: hidden;
    color: #E4393C;
    font-size: 14px;
    font-family: verdana;
}
</style>
	
			
</head>

<body>
<div class="form" style="padding:20px;">
<div class="alert hide" id="warning-block_1">
  	   <strong>注意! </strong>请选择要修改的产品！
</div>
<div class="alert hide" id="warning-block_2">
  	   <strong>注意! </strong>只能选择一个产品进行修改！
</div>
	<h1>产品管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="search-panel onefield">
		<div class="span10">
			<form class="form-search form-inline" action="#">
				<div>
				   <input type="text" name="search_keyword" value="${param.search_keyword}" style="width:600px">			   
				   <mytag:PermssionTag functionId="F4-5"> <button type="submit" class="btn" id="search_btn">搜索</button></mytag:PermssionTag>
				   <label class="checkbox inline" style="margin-left:80px">									
				   	   <input id="bigPic" name="bigPic" type="checkbox" />大图模式
				   </label>
			   </div>
				<div style="padding-top:15px">
			 		<label>类别：</label> <!-- input type="text" name="search_categoryId"   class="input-small"  value="${param.search_categoryId}"--> 
			 		<!--select id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get'" multiple style="width:200px;" name="search_categoryId"></select-->
					<input id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-5',method:'get',required:false" multiple style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>				
					<label style="padding-left:10px">价格<b>¥</b>：</label> 
					<input name="search_price_1" type="text" value="${param.search_price_1}" style="width:50px;height:20px" placeholder="￥" maxlength="6" onpaste="return !clipboardData.getData('text').match(/\D/)" onkeypress="return vailFloatNumberPerfect(event,this)" />
					<label>-</label>
					<input name="search_price_2" type="text" value="${param.search_price_2}" style="width:50px;height:20px" placeholder="￥" maxlength="6" onpaste="return !clipboardData.getData('text').match(/\D/)" onkeypress="return vailFloatNumberPerfect(event,this)" />
				</div>

			   <button id="test" class="btn btn-link" type="button" onclick="check()" style="display:none;">TEST...</button>
		    </form>
	    </div>
	</div>
	
	<form id="updateProduct" action="">
	<div class="row">
		<div id="prodcutSet" class="span9 picture-panel">
			<ul id="thumbnailContainer" class="thumbnails">
				<c:forEach items="${products.content}" var="product">
					<li class="span2">
						<!--a href="#" class="thumbnail"> <img src="${ctx}/plupload/files/small/${media.path}" alt=""-->
						 <div class="thumbnail photoBox"  style="z-index:1;position:relative;">
						 <mytag:PermssionTag functionId="F5-5"><a href="${ctx}/product/view?productId=${product.id}">
						 	<img class="lazy" data-original="${ctx}/plupload/files/small/${product.media.path}" alt="" style="width:200px;height:120px;"></a></mytag:PermssionTag>
							<div class="description">
								<a href="${ctx}/product/view?productId=${product.id}" title="${product.description}">
									<c:if test="${not empty product.description}">${product.description}</c:if>
									<c:if test="${empty product.description}">${product.title}</c:if>
								</a>
							</div>
							<div class="p-price">
								<strong>￥${product.price}</strong>
							</div>
							<div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;">
								<input class="photoCheck" value="${product.id}" type="checkbox" name="productId" style="margin-left: 10px;margin-top:10px;"/>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="row">
	      <div id="affix_test"  class="span2" data-spy="affix" data-offset-top="200" style="margin-left:1000px !important;">
		 	<ul class="nav nav-list bs-docs-sidenav nav-stacked">
	          <li><mytag:PermssionTag functionId="F5-2"><a href="${ctx}/product/add/" class="mynav">新增</a></mytag:PermssionTag></li>
	          <li><mytag:PermssionTag functionId="F5-3"><a href="#" id="update" class="mynav">修改</a></mytag:PermssionTag></li>
	          <li><mytag:PermssionTag functionId="F5-4"><a href="#" id="delete" class="mynav">删除</a></mytag:PermssionTag></li>
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

    <script type="text/javascript">
		var categoryIds = [];
		<c:forEach items="${searchParams.categoryId}" var="category">
			categoryIds.push('${category}');
		</c:forEach>
		$("#cc").combotree({ 
			onLoadSuccess:function(node){//数据加载成功触发 
				$("#cc").combotree('setValues', categoryIds);
			}
		});
	</script>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
</div>
</body>
</html>
