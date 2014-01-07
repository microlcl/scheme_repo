<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/styles/form.css">


</head>

<body>
	<div class="form">
		<h1>需求管理</h1>
		<div style="padding: 20px;">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#caseDetail" data-toggle="tab">详细</a></li>
					<li><a href="#visitActivities" data-toggle="tab">到访/回访记录</a></li>
					<li><a href="#tasks" data-toggle="tab">相关任务</a></li>
					<li><a href="#subscribers" data-toggle="tab">相关人员</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="caseDetail">
						 <%@ include file="caseContentDetail.jsp"%>
					</div>
					<div class="tab-pane" id="visitActivities">
						<%@ include file="visitActivities.jsp"%>
					</div>
					<div class="tab-pane" id="tasks">
						<%@ include file="tasks.jsp"%>
					</div>	
					<div class="tab-pane" id="subscribers">
						<%@ include file="subscribers.jsp"%>
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
