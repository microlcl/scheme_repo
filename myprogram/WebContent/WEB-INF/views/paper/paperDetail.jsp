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
	</script>

</head>
<body>
	<div class="form" style="padding:20px;">
		<h1>问卷细节</h1>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th>问题</th>
				<th>问卷类型</th>
				<th>问卷答案</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${questions}" var="question">
				<tr>
					<td>${question.question}&nbsp;</td>
					<td>${question.questionType}&nbsp;</td>
					<td>${question.questionOptions}&nbsp;</td>
				</tr>
			</c:forEach>
			</tbody>		
		</table>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>