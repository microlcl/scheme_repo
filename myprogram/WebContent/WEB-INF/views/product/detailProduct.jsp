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
function changePicture(obj) {
	var a=obj.value;
	var b = document.getElementById(a).value;
	$("#img1").attr("src","${ctx}/plupload/files/small/"+b+""); 
}

function changeAtt(t) {
    t.lastChild.checked='checked';
    for (var i = 0; i<t.parentNode.childNodes.length;i++) {
            if (t.parentNode.childNodes[i].className == 'cattsel') {
                t.parentNode.childNodes[i].className = '';
            }
        }
    t.className = "cattsel";
	//changePicture(t);
}

	//var c =$("#picture").attr("value");
	function $(obj) {
		return document.getElementById(obj);
	}
	function $img(url) {
		return "<img src='" + url + "' onclick='changeborder(this)' />";
	}
	function changeborder(obj) {
		for ( var j = 0; j < $("imgList").getElementsByTagName("li").length; j++) {
			$("imgList").getElementsByTagName("li")
			[j].getElementsByTagName("img")[0].style.borderColor = "#cccccc";
		}
		obj.style.borderColor = "red";
		$("bImg").innerHTML = $img(obj.src);
	}
	window.onload = function() {
		if ($("bImg").innerHTML == "") {
			$("bImg").innerHTML = $img("${ctx}/plupload/files/small/${product.media.path}");
			//$("imgList").getElementsByTagName("li")[0].getElementsByTagName("img")[0].style.borderColor = "red";
		}

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
	    /*--------------颜色选择器CSS添加-------------*/

    .catt{width:100%;height:auto;overflow:hidden;padding-bottom:5px;}

    .catt a{border: #c8c9cd 1px solid;  text-align: center; background-color: #fff; margin-left:5px;margin-top:6px;padding-left: 10px;padding-right: 10px;display: block; white-space: nowrap; color: #000; text-decoration: none;float:left;}

    .catt a:hover {border:#ff6701 2px solid; margin: -1px; margin-left:4px;margin-top:5px;}

    .catt a:focus {outline-style:none;}

    .catt .cattsel {border:#ff6701 2px solid; margin: -1px;background: url("${ctx}/plupload/files/small/test.png") no-repeat bottom right; margin-left:4px;margin-top:5px;}

    .catt .cattsel a:hover {border: #ff6701 2px solid;margin:-1px;background: url("${ctx}/plupload/files/small/test.png") no-repeat bottom right;}
	
        #imgList li img{ 
            width:50px; 
            height:50px; 
            border:1px solid #cccccc; 
        } 
        ul li{ 
        text-align:left;
            list-style:none; 
            float:left; 
            margin-left:10px; 
            cursor:pointer; 
        } 
        .rborder{ 
            border:1px solid yellow; 
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
									<div>
									<!-- 
									<a  onclick="changeAtt(this)" href="javascript:;"  >-->
									 <div id="bImg"></div> 
									<ul id="imgList">
										<c:forEach items="${product.categorys}" var="categorytemp">
										<!-- 	<input type="button" value="${categorytemp.name}" name="a" onclick="changePicture(this);" > 
										<input type="text" value="${categorytemp.media.path}" name="picture" onclick="changePicture(this);" > -->
										<!--	<img id="goods_img" src="${ctx}/plupload/files/small/${categorytemp.media.path}" alt="" style="width:50px; height:50px;border:1px solid #cccccc;"> -->
											<li><img id="goods_img" src="${ctx}/plupload/files/small/${categorytemp.media.path}" alt=""  onclick='changeborder(this)'> </li>
										</c:forEach>
        							</ul> 
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
										<input type="text" name="title" value="${product.title }" maxlength="20" placeholder="0~20个字符" readonly="readonly"/>
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">描述:</label>
										<textarea  class="single_photo_textarea " readonly="readonly"
										name="description" 
										 maxlength="100" placeholder="0~100个字符" />${product.description }</textarea>
									</div>
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">价格:</label>
										<input type="text" name="price"  maxlength="20" placeholder="" value="${product.price }" readonly="readonly"/>
									</div>
									<div class="catt">
									<c:forEach items="${categorys}" var="categoryParent">
										<div class="control-group" style="margin-bottom:5px;">
											<label class="control-label" style="width:40px;padding-right:10px">${categoryParent.name}:</label>
											<c:forEach items="${product.categorys}" var="category">
											<c:if test="${categoryParent.id==category.pid}">
									<!-- 		<input type="button" value="${category.name}" name="a" onclick="changePicture(this);" > -->
    

    <!-- {foreach from=$spec.values item=value key=key} -->

      <a {if $key eq 0}class="cattsel" {/if} onclick="changeAtt(this)" href="javascript:;" name="ccb" >${category.name}<input style="display:none" id="a" type="radio" name="spec_{$spec_key}" value="${category.name}" {if $key eq 0}checked{/if} /></a>

    <!-- {/foreach} -->

   
								 			<input type="hidden" id="${category.name}" value="${category.media.path}"> 
								 			</c:if>
											</c:forEach>
										</div>
									</c:forEach>
									 </div>
								</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>	
<!-- 
			<div class="form-actions" style="padding-left:410px">
				<input id="submit_btn" class="btn btn-primary" type="submit"
					value="提交" />&nbsp; <input id="cancel_btn" class="btn"
					type="button" value="返回" onclick="history.back()" />
			</div>
			 -->
		</fieldset>
	</form>
	
</div>
</body>
</html>
