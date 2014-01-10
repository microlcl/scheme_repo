<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css"  href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"	type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script>
	$(document).ready(function() {
		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#assigned_department').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#case_owner').combobox('reload', url);
			}
		});
		//时间控件
		$('.form_date').datetimepicker({
	        language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  true,
	        pickerPosition: "bottom-left",
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format: 'yyyy-mm-dd hh:ii'
    	});
	});
</script>



</head>

<body>
	<div class="form" style="padding:20px;">
		<h1>需求管理</h1>
		<div class="row">
			<div class="span">
				<div class="form-search" style="padding-left:20px;">
					<label for="case_title">概要：</label> 
					<input type="text" class="input-xxlarge" id="case_title" value="乔布斯的婚礼">

				</div>
			</div>
								<div class="pull-right">
						<input type="text" class="input-small" id="case_status" value="" placeholder="状态下拉栏">
					</div>
		</div>

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
