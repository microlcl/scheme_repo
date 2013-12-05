<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.lazyload.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script>
		var currentPage = 0;

		$(function() {          
		    $("img.lazy").lazyload({
		        event : "scroll",
				effect : "fadeIn",
				threshold : 0,
				effectspeed: 2000
		    });
		});
		
		function search() {
			console.log('in search');
			return false;
		}

		function loadMore() {
			var nextPage = currentPage + 1;
			console.log("next pageNum:" + nextPage);
			$.ajax({
				url : '${ctx}/media/api/search?search_mediaType=picture',
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
						var img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="" style="width:300px;height:200px; " id="'+media.id+'"><h5>' + media.title+'</h5><p>'+media.description+'</p><div class="check" style="z-index:2000; position: absolute;left:0; top:0;"><input class="photoCheck" type="checkbox" value="'+media.id+'" name="picture" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
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
	
	<form class="form-search form-inline" action="#">
	<label class="inline">类别
		<input id="cc" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get',required:false" style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>
	</label>
		<label class="checkbox inline">									
   			我的资源<input value="${user.id}" type="checkbox" <c:if test="${!empty param.search_userId}">checked</c:if> name="search_userId"/>
   		</label>
	   <input type="text" name="search_keyword"   class="input-small"  value="${param.search_keyword}">			   
	   <button type="button" class="btn" id="search_btn" onclick="search()">Search</button>
    </form>
	
	<div>
			<ul id="thumbnailContainer" class="thumbnails">
			</ul>
	</div>

	<div id="loadMore" class="pagination pagination-centered">
	    <button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
    </div>

