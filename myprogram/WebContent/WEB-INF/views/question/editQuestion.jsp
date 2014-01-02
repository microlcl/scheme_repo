<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/nano/nano.js" type="text/javascript"></script>
<title>修改问题</title>
<script type="text/javascript">
	$(document).ready(function(){
		if($('input[name="questionType"]:checked').val() == "3"){
			$("#options").hide();
		}
			
		$("input:radio[name='questionType']").click(
			function(){
				if($('input[name="questionType"]:checked').val() == "3")
					$("#options").hide();
				else
					$("#options").show();
			}
		);
	});
	function addOption(){
		var optionDiv = '<div class="control-group"><label for="option" class="control-label formlabel" style="color:red">*</label><div class="controls"><input type="text" name="splitOptions"  value="" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/><a href="javascript:void(0);" onclick="deleteOption(this)" title="删除"><span style="margin:0px 0px -11px 5px" class="iconImg iconImg_delete"></span></a></div></div>';
		$("#options").append(optionDiv);
	}
	
	function deleteOption(obj){
		var _this = $(obj);
		$(_this).parent().parent().remove();
	}
	
	function clearOptions(){
		$('input[name="splitOptions"]').val("");
	}
</script>

</head>
<body>
<form id="inputForm" action="${ctx}/question/updateQuestion" method="post" class="form-horizontal">
	<div class="form">
		<h1>问题管理</h1>
		<div class="control-group">
				<label for="questionType" class="control-label required formlabel">类型:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="questionType" value="1" checked>单选
					</label>
					<label class="radio inline">
						<input type="radio" name="questionType" value="2" >多选
					</label>
					<label class="radio inline">
						<input type="radio" name="questionType" value="3" >开放性问题
					</label>
				</div>
		</div>	
		<div class="control-group">
				<label for="business_type" class="control-label formlabel">类别:</label>
				<div class="controls">
					<input id="business_type" name="business_type" class="easyui-combotree" value="${question.business_type}" data-options="url:'${ctx}/category/api/getAll/M1-7',method:'get',required:false" style="width:200px;">
				</div>
		</div>
		<div class="control-group">
				<label for="question" class="control-label formlabel">标题:</label>
				<div class="controls">
					<input type="hidden" name="id" value="${question.id}">
					<input type="text" id="question" name="question"  value="${question.question}" style="width:600px"  maxlength="64"/>
				</div>
		</div>
		<div id="options">
			<c:forEach items="${question.splitOptions}" var="questionOption" varStatus="status">
			   <c:choose>
			     <c:when test="${status.index == 0}">
			  	   <div class="control-group">
						<label for="option" class="control-label formlabel">选项:</label>
						<div class="controls">
							<input type="text" name="splitOptions"  value="${questionOption}" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/>
							<a title="创建" onclick="addOption()" href="javascript:void(0);"><span class="iconImg iconImg_create" style="margin:0px 40px -11px 5px" ></span></a>
							<input type="button" onclick="clearOptions();" class="btn btn-info" value="清空全部选项">
						</div>
					</div>
			     </c:when>
			     <c:when test="${status.index == 1}">
					<div class="control-group">
						<label for="option" class="control-label formlabel" style="color:red">*</label>
						<div class="controls">
							<input type="text" name="splitOptions"  value="${questionOption}" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/>
						</div>
					</div>
			     </c:when>
			 	 <c:otherwise>
					<div class="control-group">
						<label for="option" class="control-label formlabel" style="color:red">*</label>
						<div class="controls">
							<input type="text" name="splitOptions"  value="${questionOption}" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/>
							<a href="javascript:void(0);" onclick="deleteOption(this)" title="删除"><span style="margin:0px 0px -11px 5px" class="iconImg iconImg_delete"></span></a>
						</div>
					</div>
			 	 </c:otherwise>
			  </c:choose>
			</c:forEach>
		</div>
		
		<div class="form-actions" style="padding-top:30px">
			<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
			<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
		</div>	
	</div>
</form>
</body>
</html>