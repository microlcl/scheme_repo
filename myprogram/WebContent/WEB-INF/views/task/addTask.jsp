<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>任务管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/styles/form.css">


</head>

<body>
	<div class="form">
		<h1>增加任务</h1>
		<div style="padding: 20px;">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#detail" data-toggle="tab">任务详细信息</a></li>
					<li><a href="#other" data-toggle="tab">附属内容</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="detail">
						 <%@ include file="detail.jsp"%>
					</div>
					<div class="tab-pane" id="other">
						<%@ include file="other.jsp"%>
					</div>
								
				</div>
			</div>
		</div>
		<div class="form-actions">
			<input id="cancel_btn" class="btn" type="button" value="保存" />
		</div>
	</div>

</body>
</html>
