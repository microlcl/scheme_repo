<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>资源上传</title>

<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css"
	type="text/css" />
<!-- combotreee -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script>
	$(document).ready(function() {
		//聚焦第一个输入框 
		//$("#loginName").focus();
	});
</script>
</head>

<body>


	<form id="inputForm" action="${ctx}/media/save" method="post"
		class="form-horizontal">
		<fieldset>
			<legend>
				<small>资源上传</small>
			</legend>
			<div class="alert alert-block">
				<h4>提示：</h4>
				你已经上传了多媒体资源，请在此填写必要信息进行描述
			</div>

			<table class="table table-bordered table-condensed table-hover">
				<thead class="success">
					<tr>
						<th>文件</th>
						<th>类别</th>
						<th>标题</th>
						<th>简介</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mediaList}" var="media" varStatus="status">
						<tr>
							<td><img src="${ctx}/plupload/files/small/${media.path}" alt=""><input type="hidden"
								name="medias[${status.index}].path" value="${media.path}" /></td>
							<td><select class="easyui-combotree"
								data-options="url:'${ctx}/category/api/getAll',method:'get'"
								multiple name="medias[${status.index}].categoryId"></select></td>
							<td><input type="text" name="medias[${status.index}].title"
								value="${media.title}" /></td>
							<td><textarea type="text" class="input-large"
									name="medias[${status.index}].description"
									value="${media.description}" /></textarea></td>

						</tr>
					</c:forEach>


				</tbody>
			</table>

			<div class="control-group">
				<label for="description" class="control-label">默认简介:</label>
				<div class="controls">
					<textarea id="description" name="description" class="input-large"></textarea>
				</div>
			</div>

			<div class="control-group">
				<label for="cc" class="control-label">默认类别：</label>
				<div class="controls">
					<select id="cc" class="easyui-combotree"
						data-options="url:'${ctx}/category/api/getAll',method:'get'"
						multiple style="width: 200px;" name="categoryId"></select>
				</div>
			</div>

			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit"
					value="提交" />&nbsp; <input id="cancel_btn" class="btn"
					type="button" value="返回" onclick="history.back()" />
			</div>
		</fieldset>
	</form>

</body>
</html>
