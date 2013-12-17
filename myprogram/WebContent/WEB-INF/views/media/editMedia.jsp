<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>资源修改</title>

<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css" type="text/css" />
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		//聚焦第一个输入框 
		//$("#loginName").focus();

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
<div class="form">

	<form id="inputForm" action="${ctx}/media/update" method="post"
		class="form-horizontal">
				<h1>修改资源信息</h1>

			<div class="all_photo_edit">
				
			    <div>
					<table class="table table-striped">
						<tbody>
						<c:forEach items="${mediaList}" var="media" varStatus="status">
							<tr>
								<td style="display:none">
									<input type="text" name="medias[${status.index}].id" value="${media.id}"/>
									<input type="text" name="medias[${status.index}].mediaType" value="${media.mediaType}"/>
								</td>
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
										<div class="control-group">
											<img src="${ctx}/plupload/files/small/audio.jpg" alt=""/>
										</div>
									</td>
								</c:if>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
										<input type="text" name="medias[${status.index}].title" value="${media.title}" maxlength="64" placeholder="0~64个字符" />
									</div>
									<c:if test="${media.mediaType=='audio'}">
										<label class="control-label" style="width:40px;padding-right:10px">歌手:</label>
										<input type="text" name="medias[${status.index}].author" value="${media.author}" maxlength="32" placeholder="歌手名字" />
									</c:if>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">类别:</label>
										<select id="cc_${status.index}" class="easyui-combotree"
											data-options="url:'${ctx}/category/api/getAll/M1-4',method:'get'"
											multiple name="medias[${status.index}].categoryIds" ></select>
									<script type="text/javascript">
										//var selectId = 'cc_${status.index}';
										var categoryIds_${status.index} = [];
										<c:forEach items="${media.categorys}" var="category" varStatus="ctgStatus">
											var categoryId = '${category.id}';
											categoryIds_${status.index}.push(categoryId);
										</c:forEach>
										$("#cc_${status.index}").combotree({ 
											onLoadSuccess:function(node){//数据加载成功触发 
												$("#cc_${status.index}").combotree('setValues', categoryIds_${status.index});
											}
										});
									</script>
																				
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">描述:</label>
										<input type="text" class="single_photo_textarea "
										name="medias[${status.index}].description"
										value="${media.description}" maxlength="128" placeholder="0~128个字符" /></input>
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
