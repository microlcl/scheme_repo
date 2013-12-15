<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>修改产品</title>

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

function setMedia(result) {
	var renderPicId = result.parameter.renderPic.id;
	$('#'+renderPicId).attr('src', '${ctx}/plupload/files/small/' + result.media.path);
	if(renderPicId == "prod_default_pic" )
		$('#prod_pic').attr('value', result.media.id);
	else
		$('#prod_'+renderPicId).attr('value', result.media.id);		
}
function clearNoNum(obj)
{
    //先把非数字的都替换掉，除了数字和.
    obj.value = obj.value.replace(/[^\d.]/g,"");
    //必须保证第一个为数字而不是.
    obj.value = obj.value.replace(/^\./g,"");
    //保证只有出现一个.而没有多个.
    obj.value = obj.value.replace(/\.{2,}/g,".");
    //保证.只出现一次，而不能出现两次以上
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    if(obj.value.indexOf(".")>-1){
   		obj.value = obj.value.substring(0,obj.value.indexOf(".")+3);
    }
}

	var row_count = 1;

	function addNew() {
		var table1 = $('#table1');
//		var firstTr = table1.find('tbody>tr:first');
		var row = $("<tr></tr>");
		var td = $("<td></td>");
		//td.append($('<input type="checkbox" name="count" value="New"><b>CheckBox'+row_count+');
		//td.append($('<div class="span2"></div><img id="1" src="${ctx}/plupload/files/small/bp11.jpg" alt=""><input type="hidden" name="picture'+row_count+'" value="11">'));
		//var onclick = 'resourcePopupWindow({targetMedia: this,mediaType:"picture",callback: setMedia})';
		var onclick = "resourcePopupWindow({mediaType:'picture', callback: setMedia, renderPic:addPic_"+row_count+"})";
		//var onclick="alert(1)";
		td.append('<div class="span2"><img id="addPic_'+row_count+'" onclick="'+ onclick +'" src="${ctx}/plupload/files/small/default_image.jpg" alt="" style="height:120px;width:150px"><input id="prod_addPic_'+row_count+'" type="hidden" name="picture" value=""></div>');
		//td.append($('<input id="cc" class="easyui-combotree" data-options="url:\'${ctx}/category/api/getAll/M1-5\',method:\'get\',required:false" style="width: 200px;" name="search_categoryId_2" value="${param.search_categoryId}" />'));
		
		var td2 = $("<td></td>");
		//td2.append($("<div class='span2'></div><img id='1' src='${ctx}/plupload/files/small/bp11.jpg' alt=''><input type='hidden' name='pid_2' value='11'>"));
		td2.append($('<div style="margin-top:25px;" ><div style="margin-bottom:5px;"><label class="control-label" style="width:40px;padding-right:10px" onclick="topwin()">类别:</label><input id="addc_'+row_count+'" class="easyui-combotree"  style="width: 200px;" name="searchCategoryId" /><input type="checkbox" name="count"/></div></div>'));
		row.append(td);
		row.append(td2);
		table1.append(row);
		$('#addc_'+row_count).combotree({
			url:'${ctx}/category/api/getAll/M1-5',
			required: false,
			valueField: 'id',
			textField: 'text',
			method:'get',
			//只能选择叶子节点：
			onBeforeSelect : function(node){ 
				var tree = $(this).tree;
				var isLeaf = tree('isLeaf', node.target);
				console.log("isLeaf=" + isLeaf);
				return isLeaf;
			}
		});
		//$('#count')[0].value=row_count;
		row_count++;
	}
	function del() {
		 $("input:checked").each(function(){
			  $(this).parent().parent().parent().parent().remove();
			 });
	}
	
	function test() {
		var mydata = $('#1').data();
		console.log(mydata);
	
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
	<form id="inputForm" action="${ctx}/product/updateProduct" method="post"
		class="form-horizontal">
		<fieldset>
			<legend>
				<small>修改产品</small>
			</legend>

			<div class="all_photo_edit">
			    <div>
					<table class="table table-striped" id="table1">
						<tbody>
							<tr>
								<td>
									<div class="span3">
										<img id="prod_default_pic" src="${ctx}/plupload/files/small/default_image.jpg" alt="" onclick="resourcePopupWindow({mediaType:'picture', callback: setMedia, renderPic:prod_default_pic})"/>
										<input id="prod_pic" type="hidden" name=default_picture_id />	
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
										<input type="text" name="title" value="${product.title }" maxlength="20" placeholder="0~20个字符" />
										<input type="hidden" name="id" value="${product.id }">
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
									<input type="button" value="添加类别" onclick="addNew();">
								  	<input type="button" value="删除类别" onclick="del();"> 
								</div>
								</td>
							</tr>
						<c:forEach items="${product.categorys }" var="category" varStatus="status">
							<tr>
								<td>
									<div class="span2">
										<img id="pic_${status.index }" src="${ctx}/plupload/files/small/${category.media.path}" onclick="resourcePopupWindow({mediaType:'picture', callback: setMedia, renderPic:pic_${status.index }})" alt="" style="height:120px;width:150px">
										<input id="prod_pic_${status.index }" type="hidden" name="picture" value="${category.media.id}">
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px" >类别:</label>
										<input id="cc" class="easyui-combotree"
											data-options="url:'${ctx}/category/api/getAll/M1-5',method:'get',required:false,onBeforeSelect : function(node){ var tree = $(this).tree;var isLeaf = tree('isLeaf', node.target);return isLeaf;}"
											style="width: 200px;" name="searchCategoryId"
											value="${category.name}" />
										<input type="checkbox" name="count"/>
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
		</fieldset>
	</form>
</div>

<input type="button" value="mytest" onclick="test();">
<!-- resource 选择模态对话框 -->
 <%@ include file="resourcePopupWindow.jsp"%>
</body>
</html>
