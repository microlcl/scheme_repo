<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>访问细节</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<script>
		$(document).ready(function() {
			$("#visit-tab").addClass("active");
		});
	</script>

</head>
<body>
	<div class="form">
		<h1>用户信息</h1>
		<div style="padding: 20px;">
		 <div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#reVisit" data-toggle="tab">回访信息</a></li>
					<li><a href="#reVisitPaper" data-toggle="tab">回访调查问卷</a></li>
				</ul>
		<div class="tab-content">
		<div class="tab-pane active" id="reVisit">
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr>
					<td style="" class="formlabel span2">案例名称：</td>
					<td style="color:#A1A1A1">${visit.thisCase.title}</td>
				</tr>
				<tr>
					<td class="formlabel" >客户称呼：</td>
					<td style="color:#A1A1A1">${visit.customer.customerName}</td>
				</tr>
				<tr>
					<td class="formlabel" >访问类别：</td>
					<td style="color:#A1A1A1">${visit.visitType.name}</td>
				</tr>
				<tr>
					<td class="formlabel">回访时间：</td>
					<td style="color:#A1A1A1">${visit.visitTime}</td>
				</tr>
				<tr>
					<td class="formlabel">策划类别：</td>
					<td style="color:#A1A1A1">${visit.businessType.name}</td>
				</tr>
				<tr>
					<td class="formlabel">回访备注：</td>
					<td style="color:#A1A1A1">${visit.comment}</td>
				</tr>
				<tr>
					<td class="formlabel">案例时间：</td>
					<td style="color:#A1A1A1">${visit.thisCase.eventTime}</td>
				</tr>
				<tr>
					<td class="formlabel">客人人数：</td>
					<td style="color:#A1A1A1">${visit.thisCase.guestNum}</td>
				</tr>
				<tr>
					<td class="formlabel">会场简介：</td>
					<td style="color:#A1A1A1">${visit.thisCase.spaceTip}</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="tab-pane" id="reVisitPaper">
			<%@ include file="returnVisitPaper.jsp"%>
		</div>	
		</div>
		</div>
		</div>
			<div class="form-actions">
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
   </div>

</body>
</html>