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

<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script>
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
		td.append($('<div class="span2"><img id="1" src="${ctx}/plupload/files/small/bp11.jpg" alt=""><input type="hidden" name="picture" value="11"></div>'));
		//td.append($('<input id="cc" class="easyui-combotree" data-options="url:\'${ctx}/category/api/getAll/M1-5\',method:\'get\',required:false" style="width: 200px;" name="search_categoryId_2" value="${param.search_categoryId}" />'));
		
		var td2 = $("<td></td>");
		//td2.append($("<div class='span2'></div><img id='1' src='${ctx}/plupload/files/small/bp11.jpg' alt=''><input type='hidden' name='pid_2' value='11'>"));
		td2.append($('<div style="margin-top:25px;" ><div style="margin-bottom:5px;"><label class="control-label" style="width:40px;padding-right:10px" onclick="topwin()">类别:</label><input id="test'+row_count+'" class="easyui-combotree"  style="width: 200px;" name="searchCategoryId" /><input type="checkbox" name="count"/></div></div>'));
		row.append(td);
		row.append(td2);
		table1.append(row);
		$('#test'+row_count).combotree({
			url:'${ctx}/category/api/getAll/M1-5',
			required: false,
			valueField: 'id',
			textField: 'text',
			method:'get'
		});
		//$('#count')[0].value=row_count;
		row_count++;
	}
	function del() {
		 $("input:checked").each(function(){
			  $(this).parent().parent().parent().parent().remove();
			 });
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
				<small>增加产品</small>
			</legend>

			<div class="all_photo_edit">
			    <div>
					<table class="table table-striped" id="table1">
						<tbody>
							<tr>
								<td>
									<div class="span2">
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">名称:</label>
										<input type="text" name="title"  maxlength="20" placeholder="0~20个字符" />
									</div>
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">描述:</label>
										<textarea  class="single_photo_textarea "
										name="description"
										 maxlength="100" placeholder="0~100个字符" /></textarea>
									</div>
									<div class="control-group" style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px">价格:</label>
										<input type="text" name="price"  maxlength="20" placeholder="" onkeyup="clearNoNum(this)"/>
									</div>
									<input type="button" value="添加类别" onclick="addNew();">
								  	<input type="button" value="删除类别" onclick="del();"> 
								</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="span2">
									<img id="1" src="${ctx}/plupload/files/small/bp12.jpg" alt="">
									<input type="hidden" name="picture" value="12">
							<!-- 		<input type="hidden" id="count" name="row_count" value="0"> -->
									</div>
								</td>
								<td>
								<div style="margin-top:25px;" >
									<div style="margin-bottom:5px;">
										<label class="control-label" style="width:40px;padding-right:10px" >类别:</label>
										<input id="cc" class="easyui-combotree"
											data-options="url:'${ctx}/category/api/getAll/M1-5',method:'get',required:false"
											style="width: 200px;" name="searchCategoryId"
											value="${param.search_categoryId}" />
											<input type="checkbox" name="count"/>
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
<button type="button" data-toggle="modal" data-target="#resourceModalWindow" data-backdrop="true">资源</button>
<!-- resource 选择模态对话框 -->
<div id="resourceModalWindow" class="modal hide fade">
   <div class="modal-header">
	   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	   <h3>资源选择窗口</h3>
	</div>
	<div class="modal-body">
	   <%@ include file="resourcePopupWindow.jsp"%>
	</div>
	<div class="modal-footer">
	   <a href="#" class="btn">关闭</a>
	   <a href="#" class="btn btn-primary">确定</a>
   </div>
</div>
</body>
</html>
