<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.lazyload.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">

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
.thumbnail:hover {
  border: 1px solid #7EC0EE;
  cursor: pointer;
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
<div id="resourceModalWindow" class="modal hide fade">
   <div class="modal-header">
	   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	   <h4>资源选择</h4>
	</div>
	<div class="modal-body">
<!-- 模态对话框begin -->
	
	<form class="form-search form-inline" action="#">
	<label class="inline">类别
		<input id="categorySelector"  class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get',required:false" name="search_categoryId" value="${param.search_categoryId}"/>
	</label>
		<label class="checkbox inline">									
   			我的资源<input id="resourceUserId" value="${user.id}" type="checkbox" name="search_userId"/>
   		</label>
	   <input type="text" id='searchKeyword' name="search_keyword"   class="input-small"  value="${param.search_keyword}">			   
	   <button type="button" class="btn" id="search_btn" onclick="search()">Search</button>
    </form>
	
	<div class="well">
			<ul id="thumbnailContainer" class="thumbnails" style="margin-left: 20px">
			</ul>
	</div>

	<div id="loadMore" class="pagination pagination-centered">
	    <button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
    </div>
 <!-- 模态对话框end --> 
	</div>
	<div class="modal-footer">
	   <a href="#" class="btn" data-dismiss="modal" aria-hidden="true">关闭</a>
	   <a href="#" class="btn btn-primary" data-dismiss="modal" aria-hidden="true" onclick="getSelectedValue()">确定</a>
   </div>
</div>
  
    
	<script>
		var currentPage = 0;		
		var targetImg;
		
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
			currentPage = 0;
			$('#thumbnailContainer').empty();
			loadMore();
			return false;
		}
		
		function resourcePopupWindow(img) {
			console.log("click the img");
		    $('#resourceModalWindow').modal({
		    	backdrop:false,
		    });
		    
			search();
			targetImg = img;
		}
		
		function getSelectedValue() {
			var pic = $('input:radio[name="mypicture"]:checked').val();
			
			if(pic) {
				console.log('selected: ' + pic);
				$(targetImg).attr('src', '${ctx}/plupload/files/small/' + pic);
			} 
		}

		function loadMore() {
			var nextPage = currentPage + 1;
			console.log("next pageNum:" + nextPage);
			$.ajax({
				url : '${ctx}/media/api/search?search_mediaType=picture',
				type: 'get',
				data:{
					page:nextPage,
					search_categoryId:$('#categorySelector').combotree('getValue'),
					search_keyword:$('#searchKeyword').val(),
					search_userId: $('#resourceUserId').is(':checked') ? $('#resourceUserId').val() : ''
				},
				success : function(resp) {
					currentPage++;
					console.log('in success function, currentPage = ' + currentPage);
					console.log(resp);
					if (resp.lastPage) {
						console.log("it's the last page");
						$('#loadMore').hide();
					} else {
						$('#loadMore').show();
					}
					$.each(resp.content, function(i, media){
						console.log(i + "===" + media.path);
						var fname = "selectPic('radio_" + media.id +  "')";
						var img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img onclick='+ fname +' class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="'+ media.title+'" style="width:300px;height:200px; " id="'+media.id+'"><p>' + media.description+'</p><div class="check" style="z-index:2000; position: absolute;left:0; top:0;"><input type="radio" id="radio_'+ media.id +'" value="'+media.path+'" name="mypicture" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
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
		
	}
	
		function selectPic(radioId) {
			console.log("in selectPic: id=" + radioId);
			//$('input:radio[name="mypicture"]:checked').attr('checked',false);
			//$('#' + radioId).attr('checked', 'checked');
			$('#' + radioId).click();
		}
	</script>
