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
				$("#updateProduct").attr("action", "${ctx}/product/update");
				$("#updateProduct").submit();
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
				if(confirm('确定删除吗')){
					$("#updateProduct").attr("action", "${ctx}/product/delete");
					$("#updateProduct").submit();
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
						console.log(i + "===" + product.medias[0].path);
						var img;
						if($("input:checkbox[name='bigPic']").is(':checked') == true)
							img = '<li class="span3"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.medias[0].path+'" src="${ctx}/plupload/files/small/'+product.medias[0].path+'" alt="" style="width:300px;height:200px; " id="'+product.id+'"><h5>' + product.title+'</h5><p>'+product.description+'</p><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
						else
							img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+product.medias[0].path+'" src="${ctx}/plupload/files/small/'+product.medias[0].path+'" alt="" style="width:200px;height:120px; " id="'+product.id+'"><h5>' + product.title+'</h5><p>'+product.description+'</p><div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;"><input class="photoCheck" type="checkbox" value="'+product.id+'" name="checkbox" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';

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
		function chooseOne(cb){  
	         //先取得同name的chekcBox的集合物件  
	         var obj = document.getElementsByName("productId");  
	         for (i=0; i<obj.length; i++){  
	             //判斷obj集合中的i元素是否為cb，若否則表示未被點選  
	             if (obj[i]!=cb) obj[i].checked = false;  
	             //若是 但原先未被勾選 則變成勾選；反之 則變為未勾選  
	             //else  obj[i].checked = cb.checked;  
	             //若要至少勾選一個的話，則把上面那行else拿掉，換用下面那行  
	             else obj[i].checked = true;  
	         }  
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
<div class="alert hide" id="warning-block">
  	   <strong>注意! </strong>请至少选中一个多媒体！
</div>
	<h1>产品管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span10">
			<form class="form-search form-inline" action="#">
				<div class="row">
					<div class="span12">
						<label>类别</label>
						<!-- input type="text" name="search_categoryId"   class="input-small"  value="${param.search_categoryId}"-->
						<!--select id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll',method:'get'" multiple style="width:200px;" name="search_categoryId"></select-->
						<input id="cc" class="easyui-combotree"
							data-options="url:'${ctx}/category/api/getAll/M1-5',method:'get',required:false"
							style="width: 200px;" name="search_categoryId"
							value="${param.search_categoryId}" />
						<mytag:PermssionTag functionId="F4-5">
							<button type="submit" class="btn" id="search_btn">Search</button>
						</mytag:PermssionTag>
						<label class="checkbox inline">									
			   	 		  <input id="bigPic" name="bigPic" type="checkbox" />大图模式
			 		    </label>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<form id="updateProduct" action="">
	<div class="row">
		<div id="prodcutSet" class="span9 well">
			<ul id="thumbnailContainer" class="thumbnails">
				<c:forEach items="${products.content}" var="product">
					<li class="span2">
						<!--a href="#" class="thumbnail"> <img src="${ctx}/plupload/files/small/${media.path}" alt=""-->
						 <div class="thumbnail photoBox"  style="z-index:1;position:relative;">
						 <mytag:PermssionTag functionId="F5-2"><a href="${ctx}/product/view?productId=${product.id}">
						 	<img class="lazy" data-original="${ctx}/plupload/files/small/${product.media.path}" alt="" style="width:200px;height:120px;"></a></mytag:PermssionTag>
							<h5>${product.title}</h5>
							<p>${product.description}</p>
							<div class="check" style="z-index:2; position: absolute;left:0; top:0;display:none;">
								<input class="photoCheck" value="${product.id}" type="checkbox" name="productId" style="margin-left: 10px;margin-top:10px;" onClick="chooseOne(this);"/>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="row">
	      <div id="affix_test"  class="span2" data-spy="affix" data-offset-top="200" style="margin-left:1000px !important;">
		 	<ul class="nav nav-list bs-docs-sidenav nav-stacked">
		 		<li><mytag:PermssionTag functionId="F5-2"><a href="#" id="view" class="mynav">查看产品</a></mytag:PermssionTag></li>
	          <li><mytag:PermssionTag functionId="F5-2"><a href="${ctx}/product/add/" >增加产品</a></mytag:PermssionTag></li>
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


</body>
</html>
