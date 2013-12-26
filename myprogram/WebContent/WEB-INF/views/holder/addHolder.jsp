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
	$(document).ready(function() {
		$("#holderForm").validate();
	});
	var row_count = 0;
	function add() {
		var tableHolder = $('#tableHolder');
		var row = $("<tr></tr>");
		var td = $("<td></td>");
td.append('<div class="control-group">');
td.append('		<input type="checkbox" name="count" />');
td.append('	        会场名称：<input type="text"  name="spaces['+row_count+'].space_name" class="input-large required" maxlength="32" />');
td.append('</div>');
td.append('</div>');
td.append('<div class="control-group">');
td.append('	       会场所在楼层：<input type="text"  name="spaces['+row_count+'].floor" class="input-large" maxlength="64" />');
td.append('		容纳人数：<input type="text"  name="spaces['+row_count+'].volume" class="input-large" maxlength="32" />');
td.append('</div>');
td.append('<div class="control-group">');
td.append('		楼层空间高度：<input type="text" id="hall_height " name="spaces['+row_count+'].hall_height" class="input-large" maxlength="64" />');
td.append('		舞台长：<input type="text"  name="spaces['+row_count+'].stage_length" class="input-large" maxlength="32" />');
td.append('</div>');
td.append('<div class="control-group">');
td.append('		舞台宽：<input type="text"  name="spaces['+row_count+'].stage_width" class="input-large" maxlength="64" />');
td.append('		舞台高：<input type="text"  name="spaces['+row_count+'].stage_height" class="input-large" maxlength="32" />');
td.append('</div>');
td.append('<div class="control-group">');
td.append('		舞台性质：<input type="text" name="spaces['+row_count+'].attribute_id" class="input-large" maxlength="64" />');
td.append('		描述：<input type="text"  name="spaces['+row_count+'].description" class="input-large" maxlength="32" />');
td.append('</div>');
td.append('</div>');
td.append('</div>');
row.append(td);
tableHolder.append(row);
row_count++;
	}
	function del() {
		 $("input:checked").each(function(){
			  $(this).parent().remove();
		});
	}
	</script>
</head>

<body>
	<form id="holderForm" action="${ctx}/holder/save" method="post" class="form-horizontal" class="form-inline">
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
					<textarea  id="description" name="description"   class="input-large" maxlength="64"/></textarea>
				</div>
			</div>
			<div class="control-group">
				<input type="button" value="添加会场" onclick="add();">
				<input type="button" value="删除会场" onclick="del();"> 
			</div>
			<table id="tableHolder">
			<tr>
				<td>
				</td>
			</tr>
			</table>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
			
		</div>
	</form>
</body>
</html>
