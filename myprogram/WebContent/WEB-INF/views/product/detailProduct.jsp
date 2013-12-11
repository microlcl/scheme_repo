<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>产品详细信息</title>

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
function topwin(){
	window.showModalDialog("${ctx}/product/list","","dialogWidth:300px;dialogHeight:300px;scroll:no;status:no");
}
function changePicture(obj) {
	//alert("${ctx}/plupload/files/small/bp12.jpg");
	var a=obj.value;
	var b = document.getElementById(a).value;
//	alert(document.getElementsById("a").value);
//	var b=document.getElementByName("a").value;
//	alert(document.getElementById(b).value);
//	alert($("#a")[0].value);
	$("#img1").attr("src","${ctx}/plupload/files/small/"+b+""); 
	//document.getElementById("img1").src = "${ctx}/plupload/files/small/bp12.jpg";
}
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
<div>

	<form id="inputForm" action="${ctx}/product/doAdd" method="post"
		class="form-horizontal">
		<fieldset>
			<legend>
				<small>查看产品</small>
			</legend>

			<div class="all_photo_edit">
				
			    <div>
					<table class="table table-striped">
						<tbody>
							<tr>
								<td>
									<div class="control-group">
									<img id="img1" src="${ctx}/plupload/files/small/${product.media.path}" alt="">
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
										<input type="text" name="title" value="${product.title }" maxlength="20" placeholder="0~20个字符" />
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">描述:</label>
										<textarea  class="single_photo_textarea "
										name="description" 
										 maxlength="100" placeholder="0~100个字符" />${product.description }</textarea>
									</div>
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">价格:</label>
										<input type="text" name="price"  maxlength="20" placeholder="" value="${product.price }"/>
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">类别:</label>
										<c:forEach items="${product.categorys}" var="category">
										<input type="button" value="${category.name}" name="a" onclick="changePicture(this);">
								 		<input type="hidden" id="${category.name}" value="${category.media.path}"> 
										</c:forEach>
									</div>
								</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>	

			<div class="form-actions" style="padding-left:410px">
				<input id="submit_btn" class="btn btn-primary" type="submit"
					value="提交" />&nbsp; <input id="cancel_btn" class="btn"
					type="button" value="返回" onclick="history.back()" />
			</div>
		</fieldset>
	</form>
	
</div>
</body>
</html>
