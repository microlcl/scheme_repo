<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery.lazyload.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/audioplayer.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery/audioplayer.css">

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
	   <button type="button" onclick="stopAudio()" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	   <h4>资源选择</h4>
	</div>
	<div class="modal-body">
<!-- 模态对话框begin -->
	
	<form class="form-search form-inline" action="#">
	<label class="inline">类别
		<input id="categorySelector"  class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get',required:false" multiple name="search_categoryId" value="${param.search_categoryId}"/>
	</label>
		<label class="checkbox inline">									
   			我的资源<input id="resourceUserId" value="${user.id}" type="checkbox" name="search_userId"/>
   		</label>
	   <input type="text" id='searchKeyword' name="search_keyword"   class="input-small"  value="${param.search_keyword}">			   
	   <button type="button" class="btn" id="search_btn" onclick="search()">Search</button>
    </form>
	
	<div id="pictureDiv" class="well" style="display:none">
			<ul id="thumbnailContainer" class="thumbnails" style="margin-left: 20px">
			</ul>
	</div>
		<!-- audio begin-->
	<table id="audioTable" style="display:none" class="table table-striped table-bordered table-condensed">
	</table>
	<!-- audio end -->

	<div id="loadMore" class="pagination pagination-centered">
	    <button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
    </div>
 <!-- 模态对话框end --> 
	</div>
	<div class="modal-footer">
		<div id="audioPlayerDiv" class="span1" style="display:none">
			<audio id="audioplayer" preload="auto" controls autoplay></audio>
		</div>
	   <a href="#" class="btn" data-dismiss="modal" aria-hidden="true" onclick="stopAudio()">关闭</a>
	   <a href="#" class="btn btn-primary" data-dismiss="modal" aria-hidden="true" onclick="getSelectedValue()">确定</a>
   </div>
</div>
  
    
	<script>
		var currentPage = 0;		
		//var targetMedia;
		var mediaMap = {};
		//调用者输入参数
		var parameters = {};
		
		var callback;
		//var currentMediaType="audio";
		var currentMediaType="picture";
		
		var img;
		
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
			$('#audioTable').empty();
			if (currentMediaType == 'picture') {
				$('#pictureDiv').show();
				$('#audioTable').hide();
				//$('#audioPlayerDiv').hide();
			} else if (currentMediaType == 'audio') {
				$('#pictureDiv').hide();
				$('#audioTable').show();
				//$('#audioPlayerDiv').show();
			} else {
				console.log("Don't support this media type: " + currentMediaType);
			}
			loadMore();
			return false;
		}
		
		//{targetMedia: this,mediaType:picture, callback: setMedia}
		//function resourcePopupWindow(media, mediaType) {
		function resourcePopupWindow(obj) {
			mediaMap = {};
			parameters = obj;
			if (obj.mediaType) {
				currentMediaType = obj.mediaType;
			}
			console.log("currentMediatype = " + currentMediaType);
		    $('#resourceModalWindow').modal({
		    	backdrop:false,
		    });
		    
			search();
			//console.log("targetMedia=" + obj.targetMedia);
			//targetMedia = $('#' + obj.targetMedia);
			callback = obj.callback;
			img = obj.image;
			console.log("current image id = "+ $(img).attr('id'));
		}
		
		function getSelectedValue() {
			stopAudio();
			var selectedMedia = $('input:radio[name="myMedia"]:checked').val();
			console.log(mediaMap[selectedMedia]);
			//$(targetMedia).data(mediaMap[selectedMedia]);
			var result = {};
			result.parameter = parameters;
			result.media = mediaMap[selectedMedia];
			callback(result, img);			
		}

		function loadMore() {
			var nextPage = currentPage + 1;
			console.log("next pageNum:" + nextPage);
			$.ajax({
				url : '${ctx}/media/api/search?search_mediaType=' + currentMediaType,
				type: 'get',
				data:{
					page:nextPage,
					search_categoryId:$('#categorySelector').combotree('getValues'),
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
						mediaMap[media.id] = media;
						if (currentMediaType == 'picture') {
							handlePic(i, media);
						} else if (currentMediaType == 'audio') {
							handleAudio(i, media);
						} else {
							console.log("can't support the mediaType=" + currentMediaType);
						}
						
						
					});
				}
		});
		
	}
	
	function handleAudio(i, media) {
		console.log("in handleAudio");
		var mytable = $('#audioTable');
		var tr = $('<tr></tr>');
		var td = $('<td></td>');
		var audioFile = "'"+ media.path +"'";
		var myhtml = '<input class="audioCheck" value="'+ media.id+'" type="radio" name="myMedia" style="margin-left: 10px;"/>&nbsp;&nbsp;'+ media.title +'&nbsp;-&nbsp;myauthor<a onclick="testaudio('+ audioFile +');" style="float:right; padding-right:5px;cursor: pointer;"><i class="icon-play"></i></a>';
		td.append($(myhtml));
		tr.append(td);
		mytable.append(tr);
	}
	
	function handlePic(i, media) {
		console.log(i + "===" + media.path);
		var fname = "selectPic('radio_" + media.id +  "')";
		var img = '<li class="span2"><div class="thumbnail photoBox" style="z-index:1;position:relative;"><img onclick='+ fname +' class="lazy1" data-original="${ctx}/plupload/files/small/'+media.path+'" src="${ctx}/plupload/files/small/'+media.path+'" alt="'+ media.title+'" style="width:300px;height:200px; " id="'+media.id+'"><p>' + media.description+'</p><div class="check" style="z-index:2000; position: absolute;left:0; top:0;"><input type="radio" id="radio_'+ media.id +'" value="'+media.id+'" name="myMedia" style="margin-left: 10px;margin-top:10px;"/></div></div></a></li>';
		$('#thumbnailContainer').append(img);
	    $("#"+media.id).lazyload({
	        event : "scroll",
			effect : "fadeIn",
			threshold : 0,
			effectspeed: 2000
	    });
	}
	
	function testaudio(path){
		$('#audioPlayerDiv').show();
		var audiopath= "${ctx}/plupload/audio/" + path;
		$("#audioplayer").attr("src", audiopath);
	}
	
	function stopAudio() {
		if($("#audioplayer")) {
			console.log("stop the audio");
			//$("#audioplayer").stop();
			$("#audioPlayerDiv").hide();
			$("#audioplayer").attr("src", "");
		}
	}
	
		function selectPic(radioId) {
			console.log("in selectPic: id=" + radioId);
			//$('input:radio[name="mypicture"]:checked').attr('checked',false);
			//$('#' + radioId).attr('checked', 'checked');
			$('#' + radioId).click();
		}
	</script>
