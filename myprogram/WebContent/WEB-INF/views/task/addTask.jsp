<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>任务管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/styles/form.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>

</head>

<body>
	<div class="form">
		<h1>增加任务</h1>
		<form id="taskForm" action="${ctx}/task/save" method="post" class="form-horizontal" >
		<div >
		<p style="padding-left:24px;"> 
		摘要：<input type="text" id="summary" name="summary"   maxlength="256" style="width: 60%"/>
		</p>
		</div>
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
			<input id="cancel_btn" class="btn" type="submit" value="保存" />
		</div>
	</form>
	</div>
</body>
</html>
