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
			<c:forEach items="${questions}" var="question" varStatus="status">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.count}：</span>
                      	${question.question}
                   </div>
                    <div class="accordion-inner" style="padding-left:55px">
						<c:if test="${question.questionType == '1'}">
							<c:forEach items="${question.splitOptions}" var="splitOption">
								<label class="radio">
									<input type="radio" name="questionOption" >
										${splitOption}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '2'}">
							<c:forEach items="${question.splitOptions}" var="splitOption">
								<label class="checkbox">
									<input type="checkbox" name="questionOption" >
										${splitOption}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '3'}">
							<textarea></textarea>
						</c:if>
                    </div>
			</c:forEach>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>