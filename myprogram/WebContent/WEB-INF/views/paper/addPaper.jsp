<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>调查问卷</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#paper-tab").addClass("active");
		});
		
		function addQuestions(result) {
			console.log("in callback function");
			console.log(result);
			console.log("你选择的问题的数目是：" + result.questions.length);
		}
	</script>

</head>
<body>
	<div class="form">
		<h1>新增问卷</h1>
		<div style="padding:20px;">
			<label class="span1" style="width:100px;font-weight: bold;line-height: 30px;">问卷名称:</label>
			<input type="text" name="title"  maxlength="64" class="span3 required" placeholder="0~64个字符" />
			<button type="button" class="btn" id="search_btn" onclick="questionPopupWindow({callback:addQuestions})">请点击此处选择问题</button>
			<!-- resource 选择模态对话框 -->
			<%@ include file="../components/questionPopupWindow.jsp"%>
		</div>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>