<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Popupwindow Test</title>
	<script>
		$(document).ready(function() {
			$("#spaceSelector-tab").addClass("active");
		});
		
		function addSpaces(result) {
			console.log("in callback function");
			console.log(result);	
		}
	</script>
	


</head>

<body>
	<h1>Case Popupwindow Test</h1>
	<button type="button" class="btn" id="sssearch_btn" onclick="spacePopupWindow({callback:addSpaces})">show space popupwindow</button>
	<!-- resource 选择模态对话框 -->
 <%@ include file="../components/spacePopupWindow.jsp"%>
</body>
</html>