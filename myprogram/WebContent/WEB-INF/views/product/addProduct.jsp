<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>增加产品</title>

<link rel="stylesheet" href="${ctx}/static/styles/mystyle.css"
	type="text/css" />
<!-- combotreee -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/iCheck/skins/minimal/minimal.css">
<script src="${ctx}/static/iCheck/jquery.icheck.js"
	type="text/javascript"></script>
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script>
$(document).ready(function(){
	iCheckInit();
	$('input').on('ifChecked', function(event){
		setCurrentMediaType();
	});
	$("#inputForm").validate({
		messages: {
			price: {
				required: "请填写价格"
			},
			title: {
				required: "请填写名称"
			}
		}
	});
});
function iCheckInit(){
	$('input').iCheck({
		checkboxClass: 'icheckbox_minimal',
		radioClass: 'iradio_minimal',
	    increaseArea: '20%' // optional
	});
}

function setMedia(media, image) {
	console.log("in setMedia");
	console.log("media path: " + media.media.path);
	imageid = $(image).attr('id');
	console.log("In setMedia: the image id = " + imageid );
	$(image).attr('src', '${ctx}/plupload/files/small/' + media.media.path);
	if (imageid == 'prod_default_pic') {
		$('#prod_pic').attr('value', media.media.id);
	}else {
		var inputid = imageid.substring(14,16);
		console.log("In setMedia: the input id of the image = catagoryinput_"+inputid);
		$('#catagoryinput_'+inputid).attr('value', media.media.id);
	}
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
		var onclick = "resourcePopupWindow({mediaType:'picture',image: this,callback: setMedia})";
		//var onclick="alert(1)";
		td.append('<div class="span2"><img id="catagoryimage_' + row_count + '" onclick="'+ onclick +'" src="${ctx}/plupload/files/small/default_image.jpg" alt="" style="width: 150px;"><input id="catagoryinput_' + row_count + '" type="hidden" name="picture"></div>');
		//td.append($('<input id="cc" class="easyui-combotree" data-options="url:\'${ctx}/category/api/getAll/M1-5\',method:\'get\',required:false" style="width: 200px;" name="search_categoryId_2" value="${param.search_categoryId}" />'));
		
		var td2 = $("<td></td>");
		//td2.append($("<div class='span2'></div><img id='1' src='${ctx}/plupload/files/small/bp11.jpg' alt=''><input type='hidden' name='pid_2' value='11'>"));
		td2.append($('<div style="margin-top:25px;" ><div style="margin-bottom:5px;"><label class="control-label" style="width:50px;padding-right:10px" onclick="topwin()">类别:</label><input id="test'+row_count+'" class="easyui-combotree"  style="width: 200px;" name="searchCategoryId" /><div style="float:right;padding-top:4px"><input type="checkbox" name="count" /></div></div></div>'));
		row.append(td);
		row.append(td2);
		table1.append(row);
		$('#test'+row_count).combotree({
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
		iCheckInit();
		row_count++;
	}
	function del() {
		 $("input:checked").each(function(){
			  $(this).parent().parent().parent().parent().parent().parent().remove();
			 });
	}
	function check(){
		//验证默认图片是否选择
		var defaultPictureId = $("input[name=defaultPictureId]").val();
		if(defaultPictureId==null||defaultPictureId==""){
			$("#message").show();
			$("#message").html("请选择默认图片！");
			return;
		}
		//验证分类中的图片是否选择
		var j=0;
		var picture=new Array();
		$("input[name='picture']").each(function(){  
					picture[j]=$(this).val();
					j++;
		});
		
		for(var n=0;n<picture.length;n++){
			if(picture[n]==null||picture[n]==""){
				$("#message").show();
				$("#message").html("请选择图片！");
				return false;
			}  
		}
		//验证分类是否有重复。
		var items=new Array();
		var i=0;
		jQuery("input[name='searchCategoryId']").each(function(){
			items[i]=jQuery(this).val();
			i++;
		});
		if(items==null||items.length==0){
			$("#message").show();
			$("#message").html("请选择分类！");
			return false;
		}
		for(var m=0;m<items.length;m++){
			if(items[m]==""){
				$("#message").show();
				$("#message").html("请选择分类！");
				return;
			}
			for(var n=m+1;n<items.length;n++){
				if(items[m]==items[n]){
					$("#message").show();
					$("#message").html("有重复的分类，请修改分类后重新提交！");
					return;
				}
			}
		}
		$("#inputForm").submit();
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
			<div id="message" class="alert" style="display: none"><button data-dismiss="alert" class="close">×</button>&nbsp;</div>
			<legend>
				<small>增加产品</small>
			</legend>

			<div class="all_photo_edit">
			    <div>
					<table class="table table-striped" id="table1">
						<tbody>
							<tr>
								<td>
									<div class="span3">
										<img id="prod_default_pic" src="${ctx}/plupload/files/small/default_image.jpg"  alt="" onclick="resourcePopupWindow({mediaType:'picture',image: this,callback: setMedia})"/>
										<input id="prod_pic" type="hidden" name="defaultPictureId"/>	
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:50px;padding-right:10px">名称:</label>
										<input type="text" name="title"  maxlength="64" class="required" placeholder="0~64个字符" />
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:50px;padding-right:10px">描述:</label>
										<textarea  class="single_photo_textarea "
										name="description"
										 maxlength="128" placeholder="0~128个字符" /></textarea>
									</div>
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:50px;padding-right:10px">价格￥:</label>
										<input type="text" name="price"  maxlength="20" placeholder="" class="required" onkeyup="clearNoNum(this)"/>
									</div>
								</div>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input type="button" value="添加类别" class="btn btn-info" onclick="addNew();">
								  	<input type="button" value="删除类别" class="btn btn-info" onclick="del();"> 
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>	

			<div class="form-actions" style="padding-left:410px">
				<input id="submit_btn" class="btn btn-primary" type="button" onclick="check()"
					value="提交" />&nbsp; <input id="cancel_btn" class="btn"
					type="button" value="返回" onclick="history.back()" />
			</div>
		</fieldset>
	</form>
</div>

<!-- resource 选择模态对话框 -->
 <%@ include file="../components/resourcePopupWindow.jsp"%>
</body>
</html>
