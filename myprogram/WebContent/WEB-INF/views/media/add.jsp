<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户注册</title>
	<script src="${ctx}/static/jQuery-File-Upload-9.1.0/js/vendor/jquery.ui.widget.js"></script>
	<script src="${ctx}/static/jQuery-File-Upload-9.1.0/js/jquery.iframe-transport.js"></script>
	<script src="${ctx}/static/jQuery-File-Upload-9.1.0/js/jquery.fileupload.js"></script>
	<script src="${ctx}/static/jQuery-File-Upload-9.1.0/css/jquery.fileupload-ui.css"></script>
	<link href="${ctx}/static/styles/dropzone.css" type="text/css" rel="stylesheet" />
	
	<script src="${ctx}/static/js/media/myuploadfunction.js"></script>
	<script/>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
		});
	</script>
</head>

<body>
	<form id="inputForm" action="${ctx}/account/register" method="post" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<legend><small>资源上传</small></legend>
			<div class="control-group">
				<label for="mediaTitle" class="control-label">名称:</label>
				<div class="controls">
					<input type="text" id="mediaTitle" name="title" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="description" class="control-label">简介:</label>
				<div class="controls">
					<textarea id="description" name="description" class="input-large"></textarea>
				</div>
			</div>

			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	
	<div style="width:500px;padding:20px">
 
    <input id="fileupload" type="file" name="files[]" data-url="${ctx}/controller/upload" multiple>
 
    <div id="dropzone">Drop files here</div>
 
    <div id="progress">
        <div style="width: 0%;"></div>
    </div>
 
    <table id="uploaded-files">
        <tr>
            <th>File Name</th>
            <th>File Size</th>
            <th>File Type</th>
            <th>Download</th>
        </tr>
    </table>
 
</div>
</body>
</html>
