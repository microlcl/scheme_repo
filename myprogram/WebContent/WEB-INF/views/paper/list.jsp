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
	<div class="form">
		<h1>调查问卷</h1>
		<div class=" onefield" style="height:40px !important; text-align: right !important;padding-right: 10px;padding-top: 7px;margin-left:20px;background-color: white;">
			<form style="padding-left:10px;">
				<span  style="float:left;">
					问卷状态：
					<input id="cc1" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-8',method:'get',required:false" multiple style="width:200px;" name="search_categoryId" value="${param.search_categoryId}" />
					&nbsp;&nbsp;&nbsp;&nbsp;问卷类型：
					<input id="cc2" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-7',method:'get',required:false" multiple style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>
				</span>
				<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:150px;margin-bottom: 0px;margin-left:10px;" placeholder="输入关键字搜索">
				<button type="submit" class="btn" id="search_btn_test"><i class="icon-search"></i></button>
			</form>
		</div>
		<div  style="padding:20px;">
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th>问卷名称</th>
					<th>问卷类型</th>
					<th>问卷状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${papers.content}" var="paper">
					<tr>
						<td>${paper.paperName}&nbsp;</td>
						<td>${paper.businessType.name}&nbsp;</td>
						<td>${paper.status.name}&nbsp;</td>
						<td>
							<a href="${ctx}/paper/show/${paper.id}" id="editLink-${paper.id}"><i class="icon-folder-open"></i> 查看</a>&nbsp;&nbsp;
							<a href="${ctx}/paper/edit/${paper.id}" id="editLink-${paper.id}"><i class="icon-edit"></i> 修改</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>		
			</table>
			<tags:pagination page="${papers}" paginationSize="4"/>
		</div>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>