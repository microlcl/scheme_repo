<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Popupwindow Test</title>
	<script>
		$(document).ready(function() {
			$("#popupwindow-tab").addClass("active");
		});
		
		function addQuestions(result) {
			console.log("in callback function");
			console.log(result);	
		}
	</script>
	


</head>

<body>
	<h1>Question Popupwindow Test</h1>
	<button type="button" class="btn" id="search_btn" onclick="questionPopupWindow({callback:addQuestions})">show question popupwindow</button>
	<!-- resource 选择模态对话框 -->
 <%@ include file="../components/questionPopupWindow.jsp"%>
</body>
</html>
