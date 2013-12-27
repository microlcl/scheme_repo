<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>修改场地</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<script type="text/javascript">
	function clearNoNum(obj)
	{
	    //先把非数字的都替换掉，除了数字和.
	    obj.value = obj.value.replace(/[^\d.]/g,"");
	}
	$(document).ready(function() {
		$("#holderForm").validate();
	});
	var row_count = 0;
	function add() {
		row_count=$("#spacesSize").val();
		var tableHolder = $('#tableHolder');
		var rowHolder= $("<tr></tr>");
		var tdHolder = $("<td></td>");
		
		var tableTemp = $("<table></table>");
		var row = $("<tr></tr>");
		var row1 = $("<tr></tr>");
		var row2 = $("<tr></tr>");
		var td = $("<td align='center' width='100'></td>");
		var td1 = $("<td></td>");
		var td2 = $("<td align='right'></td>");
		var td3 = $("<td align='right'></td>");
		var td4 = $("<td align='right'></td>");
		var td5 = $("<td></td>");
		var td6 = $("<td></td>");
		var td7 = $("<td align='right'></td>");
		var td8 = $("<td align='right'></td>");
		var td9 = $("<td align='right'></td>");
		var td10 = $("<td></td>");
		var td11 = $("<td></td>");
		td.append('		<input type="checkbox" name="count" id="count"/>');
		td1.append('	        会场名称：<input type="text"  name="spaces['+row_count+'].space_name" class="input-large required" maxlength="32" />');
		td2.append('	       会场所在楼层：<input type="text"  name="spaces['+row_count+'].floor" class="input-small" maxlength="3" onkeyup="clearNoNum(this)"/>');
		td3.append('		容纳人数：<input type="text"  name="spaces['+row_count+'].volume" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>');
		td4.append('		楼层空间高度：<input type="text" id="hall_height " name="spaces['+row_count+'].hall_height" class="input-small" maxlength="2" onkeyup="clearNoNum(this)"/>');
		
		td5.append('&nbsp;		 ');
		td6.append('		&nbsp;舞&nbsp;台&nbsp;长：&nbsp;<input type="text"  name="spaces['+row_count+'].stage_length" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>');
		td7.append('		舞台宽：<input type="text"  name="spaces['+row_count+'].stage_width" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>');
		td8.append('		舞台高：<input type="text"  name="spaces['+row_count+'].stage_height" class="input-small" maxlength="2" onkeyup="clearNoNum(this)"/>');
		td9.append('		舞台性质：<input type="text" name="spaces['+row_count+'].attribute_id" class="input-small" maxlength="10" onkeyup="clearNoNum(this)"/>');
		
		td10.append('&nbsp;		 ');
		td11.append('		&nbsp;&nbsp;描&nbsp;&nbsp;述&nbsp;：&nbsp;&nbsp;<textarea  name="spaces['+row_count+'].description" class="input-large" maxlength="64" ></textarea>');
		row.append(td);
		row.append(td1);
		row.append(td2);
		row.append(td3);
		row.append(td4);
		row1.append(td5);
		row1.append(td6);
		row1.append(td7);
		row1.append(td8);
		row1.append(td9);
		row2.append(td10);
		row2.append(td11);
		tableTemp.append(row);
		tableTemp.append(row1);
		tableTemp.append(row2);
		
		tdHolder.append(tableTemp);
		rowHolder.append(tdHolder);
		tableHolder.append(rowHolder);
		row_count++;
}
	function del() {
		 $("#count:checked").each(function(){
			  $(this).parent().parent().parent().remove();
		});
	}
	</script>
</head>

<body>
	<form id="holderForm" action="${ctx}/holder/doUpdate" method="post" class="form-horizontal" class="form-inline">
		<div class="form">
			<h1>场馆管理</h1>
			<div class="control-group">
				<label for="holder_name" class="control-label formlabel">场地名称：</label>
				<div class="controls">
					<input type="hidden" id="id" name="id" value="${holder.id}">
					<input type="text" id="holder_name" name="holder_name" value="${holder.holder_name}" class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="address" class="control-label formlabel">场地地址：</label>
				<div class="controls">
					<input type="text" id="address" name="address" value="${holder.address}" class="input-large required" maxlength="64" />
				</div>
			</div>	
			<div class="control-group">
				<label for="address" class="control-label formlabel">星级：</label>
				<div class="controls">
					<input type="radio"  name="level"   class="required" value="5" <c:if test="${holder.level==5}">checked</c:if>/>五星级
					<input type="radio"  name="level"   class="required" value="4" <c:if test="${holder.level==4}">checked</c:if>/>四星级
					<input type="radio"  name="level"   class="required" value="3" <c:if test="${holder.level==3}">checked</c:if>/>三星级
					<input type="radio"  name="level"   class="required" value="0" <c:if test="${holder.level==0}">checked</c:if>/>其他
				</div>
			</div>	
			<div class="control-group">
				<label for="contact" class="control-label formlabel">联系人名称：</label>
				<div class="controls">
					<input type="text" id="contact" name="contact" value="${holder.contact}"  class="input-large required" maxlength="64"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="phone" class="control-label formlabel">联系电话：</label>
				<div class="controls">
					<input type="text" id="phone" name="phone" value="${holder.phone}"  class="input-large required" maxlength="64" onkeyup="clearNoNum(this)"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label formlabel">场地描述：</label>
				<div class="controls">
					<textarea  id="description" name="description"  class="input-large" maxlength="256"/>${holder.description}</textarea>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="button" value="添加会场" class="btn btn-info" onclick="add();">
					<input type="button" value="删除会场" class="btn btn-info" onclick="del();"> 
				</div>
			</div>
			<table id="tableHolder">
			<tr>
				<td>
					<c:forEach items="${holder.spaces}" var="space" varStatus="status">
						<table>
							<tr>
								<td align='center' width='100'>
									<input type="checkbox" name="count" id="count"/>
								</td>
								<td>
									会场名称：<input type="text"  name="spaces[${status.index}].space_name" value="${space.space_name}" class="input-large required" maxlength="32" />
								</td>
								<td align='right'>
									会场所在楼层：<input type="text"  name="spaces[${status.index}].floor" value="${space.floor}" class="input-small" maxlength="3" onkeyup="clearNoNum(this)"/>
								</td>
								<td align='right'>
									容纳人数：<input type="text"  name="spaces[${status.index}].volume" value="${space.volume}" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>
								</td>
								<td align='right'>
									楼层空间高度：<input type="text" id="hall_height " name="spaces[${status.index}].hall_height" value="${space.hall_height}" class="input-small" maxlength="2" onkeyup="clearNoNum(this)"/>
								</td>
							</tr>
							<tr>
								<td align='center' width='100'>
									&nbsp;
								</td>
								<td>
									&nbsp;舞&nbsp;台&nbsp;长：&nbsp;<input type="text"  name="spaces[${status.index}].stage_length" value="${space.stage_length}" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>
								</td>
								<td align='right'>
									舞台宽：<input type="text"  name="spaces[${status.index}].stage_width" value="${space.stage_width}" class="input-small" maxlength="5" onkeyup="clearNoNum(this)"/>
								</td>
								<td align='right'>
									舞台高：<input type="text"  name="spaces[${status.index}].stage_height" value="${space.stage_height}" class="input-small" maxlength="2" onkeyup="clearNoNum(this)"/>
								</td>
								<td align='right'>
									舞台性质：<input type="text" name="spaces[${status.index}].attribute_id" value="${space.attribute_id}" class="input-small" maxlength="10" onkeyup="clearNoNum(this)"/>
								</td>
							</tr>
							<tr>
								<td align='center' width='100'>
									&nbsp;
								</td>
								<td>
									&nbsp;&nbsp;描&nbsp;&nbsp;述&nbsp;：&nbsp;&nbsp;<textarea  name="spaces[${status.index}].description" class="input-large" maxlength="64" >${space.description}</textarea>
								</td>
							</tr>
						</table>
					</c:forEach>
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
