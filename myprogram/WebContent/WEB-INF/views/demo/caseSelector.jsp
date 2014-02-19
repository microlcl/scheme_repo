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
		
		function addCase(result){
           var temp = result.cases[0].title;           
		   $("#caseTitle").val(temp);

        }
	</script>
	


</head>

<body>
	<h1>案例选择测试</h1>
	<div class="control-group">	
			<span class="formlabel span2 control-label">案例名称：</span>
			<div class="input-append">
			<input type="text" class="required" id="caseTitle" name="caseTitle"  style="width:186px" class="input-large " maxlength="64" placeholder="案例名称" readonly/>
			<button type="button" class="btn"  onclick="casePopupWindow({callback:addCase})">选择案例</button>
			<input type="hidden" name="caseid" id="caseid" >
			</div>
	</div>		
	<!-- resource 选择模态对话框 -->
 <%@ include file="../components/casePopupWindow.jsp"%>
</body>
</html>