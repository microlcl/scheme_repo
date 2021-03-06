<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>资源上传</title>

<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css"
	type="text/css" />
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	$("#inputForm").validate({

	});
});
$( 'audio' ).audioPlayer(
		{
		    classPrefix: 'player', // default value: 'audioplayer'
		    strPlay: 'Play', // default value: 'Play'
		    strPause: 'Pause', // default value: 'Pause'
		    strVolume: 'Volume', // default value: 'Volume'
});		
</script>

<style type="text/css">
	.all_photo_edit {
		width: 800px;
		padding-left:100px;
	}
	.single_photo_textarea {
		width: 206px; 
		height: 60px; 
		max-width: 230px; 
		max-height: 100px; 
	}
	.all_photo_textarea {
		width: 526px;
		height: 64px;
		max-width: 526px;
		max-height: 64px;
	}
</style>
</head>

<body>
<div class="form span10">

	<form id="inputForm" action="${ctx}/media/save" method="post" class="form-horizontal">
		<h1  style="padding:20px; padding-left:0px !important;">资源上传</h1>
		<div class="alert alert-block"  style="margin-left:20px !important;">
			<h4>提示：</h4>
			你已经上传了多媒体资源，请在此填写必要信息进行描述
		</div>
		<div class="all_photo_edit"  style="margin-left:20px !important;">
			<div>
				<h4>
					统一添加资源信息
				</h4>
				<div class="control-group" style="float:left;margin-bottom:0px">
					<label for="title" class="control-label">名称:</label>
					<div class="controls">
						<input type="text" name="title"	value="${title}" maxlength="64" placeholder="0~64个字符"/>
					</div>
				</div>			
				<div class="control-group" style="margin-bottom:10px">
					<label for="cc" class="control-label" style="width:100px;padding-right:20px">类别：</label>
					<div class="controls">
						<select id="cc" class="easyui-combotree"
						data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get'"
						multiple style="width: 200px;" name="categoryId"></select>
					</div>
				</div> 
				<div class="control-group">
					<label for="description" class="control-label">描述:</label>
					<div class="controls">
						<textarea id="description" name="description" class="all_photo_textarea" maxlength="128" placeholder="0~128个字符"></textarea>
					</div>
				</div>
				  
			</div>
		
		    <div>
				<table class="table table-striped">
					<tbody>
					<c:forEach items="${mediaList}" var="media" varStatus="status">
						<tr>
							<c:if test="${media.mediaType=='picture'}">
								<td>
									<div class="control-group">
										<img src="${ctx}/plupload/files/small/${media.path}" alt=""/>
										<input type="hidden" name="medias[${status.index}].path" value="${media.path}" />
									</div>
								</td>
							</c:if>
							<c:if test="${media.mediaType=='audio'}">
								<td>
									<div class="control-group" style="width:300px !important">
										<img src="${ctx}/plupload/files/small/audio.jpg" alt=""/>
										<audio src="${ctx}/plupload/audio/${media.path}" id="audioplayer" preload="auto" controls></audio>
									</div>
								</td>
							</c:if>
							<td>
							<div style="margin-top:25px;" >
								<div class="control-group" style="margin-bottom:5px;">
									<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
									<input type="text" name="medias[${status.index}].title" value="${media.title}" maxlength="64" placeholder="0~64个字符" class="required"/>
								</div>
								<c:if test="${media.mediaType=='audio'}">
									<label class="control-label" style="width:40px;padding-right:10px">歌手:</label>
									<input type="text" name="medias[${status.index}].author" value="${media.author}" maxlength="32" placeholder="歌手名字" class="required"/>
								</c:if>
								<div style="margin-bottom:5px;">
									<label for="mediaType" class="control-label" style="width:40px;padding-right:10px">类型:</label>
									<input type="text" id="mediaType" name="medias[${status.index}].mediaType"  value="${media.mediaType}" readonly/>
								</div>	
								<div style="margin-bottom:5px;">
									<label class="control-label" style="width:40px;padding-right:10px">类别:</label>
									<select class="easyui-combotree"
										data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get'"
										multiple name="medias[${status.index}].categoryIds"></select>
								</div>
								<div style="margin-bottom:5px;">
									<label class="control-label" style="width:40px;padding-right:10px">描述:</label>
									<textarea class="single_photo_textarea " name="medias[${status.index}].description" value="${media.description}"  placeholder="0~128个字符">${media.description}</textarea>
								</div>
							</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>	

		<div class="form-actions" style="padding-left:410px">
			<input id="submit_btn" class="btn btn-primary" type="submit"
				value="提交" />&nbsp; <input id="cancel_btn" class="btn"
				type="button" value="返回" onclick="history.back()" />
		</div>
	</form>
	
</div>
</body>
</html>
