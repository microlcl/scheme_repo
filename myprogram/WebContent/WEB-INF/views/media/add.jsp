<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用户注册</title>
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
</body>
</html>
