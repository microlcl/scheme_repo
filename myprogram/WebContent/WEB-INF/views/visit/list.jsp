<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>进店管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#visit-tab").addClass("active");
		});

	</script>

</head>
<body>
	<div class="form">
		<h1>进店管理</h1>
		<div class=" onefield" style="height:40px !important; text-align: right !important;padding-right: 10px;padding-top: 7px;margin-left:20px;background-color: white;">
			<form style="padding-left:10px;">
				<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:150px;margin-bottom: 0px;margin-left:10px;" placeholder="输入关键字搜索">
				<button type="submit" class="btn" id="search_btn_test"><i class="icon-search"></i></button>
			</form>
		</div>
		<div  style="padding:20px;">
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th>访问ID</th>
					<th>访问案例</th>
					<th>进店时间</th>
					<th>访问类型</th>
					<th>是否初次到访</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${visits.content}" var="visit">
					<tr>
						<td>${visit.id}&nbsp;</td>
						<td>${visit.thisCase.title}&nbsp;</td>
						<td>${visit.visitTime}&nbsp;</td>
						<td>${visit.businessType.name}&nbsp;</td>
						<td>
							<c:if test="${visit.isVisited=='T'}">否</c:if>
							<c:if test="${visit.isVisited=='F'}"><span style="color:#FF0000">是</span></c:if>
						</td>
						<td>
							<a href="${ctx}/paper/show/${visit.id}" id="showLink-${paper.id}"><i class="icon-folder-open"></i> 查看</a>&nbsp;&nbsp;
							<a href="${ctx}/paper/edit/${visit.id}" id="editLink-${paper.id}"><i class="icon-edit"></i> 修改</a>&nbsp;&nbsp;
							<a href="${ctx}/paper/delete/${visit.id}" id="deleteLink-${paper.id}"><i class="icon-remove"></i>删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>		
			</table>
		</div>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>