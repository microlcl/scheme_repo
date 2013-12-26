<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>场地管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<script type="text/javascript">
	var row_count = 1;
	function add() {
var holderDiv = $('#holderDiv');
holderDiv.append('<div class="control-group">');
holderDiv.append('	        会场名称：<input type="text" id="holder.spaces.space_name" name="spaces.space_name" class="input-large required" maxlength="32" />');
holderDiv.append('	       会场所在楼层：<input type="text" id="holder.spaces.floor " name="holder.spaces.floor " class="input-large required" maxlength="64" />');
holderDiv.append('</div>');
holderDiv.append('</div>');
holderDiv.append('<div class="control-group">');
holderDiv.append('		容纳人数：<input type="text"  name="spaces.volume" class="input-large required" maxlength="32" />');
holderDiv.append('		楼层空间高度：<input type="text" id="hall_height " name="hall_height " class="input-large required" maxlength="64" />');
holderDiv.append('</div>');
holderDiv.append('<div class="control-group">');
holderDiv.append('		舞台长：<input type="text"  name="spaces.stage_length" class="input-large required" maxlength="32" />');
holderDiv.append('		舞台宽：<input type="text"  name="spaces.stage_width" class="input-large required" maxlength="64" />');
holderDiv.append('</div>');
holderDiv.append('<div class="control-group">');
holderDiv.append('		舞台高：<input type="text"  name="spaces.stage_height" class="input-large required" maxlength="32" />');
holderDiv.append('		舞台性质：<input type="text" name="spaces.attribute_id" class="input-large required" maxlength="64" />');
holderDiv.append('</div>');
holderDiv.append('<div class="control-group">');
holderDiv.append('		描述：<input type="text"  name="spaces.description" class="input-large required" maxlength="32" />');
holderDiv.append('</div>');
holderDiv.append('</div>');
	}
	function del() {
		 $("input:checked").each(function(){
			  $(this).parent().parent().parent().parent().parent().parent().remove();
			 });
	}
	</script>
</head>

<body>
	<form id="inputForm" action="${ctx}/holder/save" method="post" class="form-horizontal" class="form-inline">
		<div class="form">
			<h1>场馆管理</h1>
			<div class="control-group">
				<label for="holder_name" class="control-label formlabel">场地名称：</label>
				<div class="controls">
					<input type="text" id="holder_name" name="holder_name"   class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="address" class="control-label formlabel">场地地址：</label>
				<div class="controls">
					<input type="text" id="address" name="address"   class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="contact" class="control-label formlabel">联系人名称：</label>
				<div class="controls">
					<input type="text" id="contact" name="contact"   class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="phone" class="control-label formlabel">联系电话：</label>
				<div class="controls">
					<input type="text" id="phone" name="phone"   class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label formlabel">场地描述：</label>
				<div class="controls">
					<input type="text" id="description" name="description"   class="input-large required" maxlength="64"/>
				</div>
			</div>
			<div class="control-group">
				<input type="button" value="添加类别" onclick="add();">
				<input type="button" value="删除类别" onclick="del();"> 
			</div>
			<div class="control-group"  id="holderDiv">
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
			
		</div>
	</form>
</body>
</html>
