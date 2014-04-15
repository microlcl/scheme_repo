<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>环节</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="form">
		<h1>环节</h1>
		<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
		</c:if>
  		<div class=" onefield" style="height:40px !important; text-align: right !important;padding-right: 10px;padding-top: 7px;margin-left:20px;background-color: white;">
			<form style="padding-left:10px;">
				<span  style="float:left;">
					环节名称：
					<input id="cc1" type="text"  name="search_name" style="width:150px;margin-bottom: 0px;margin-left:10px;" >
					&nbsp;&nbsp;&nbsp;&nbsp;环节类型：
					<input id="cc2" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false" style="width:200px;" name="search_categoryId" value="${param.search_categoryId}"/>
					<button type="button" class="btn btn-success" onclick="location.href='${ctx}/procedure/add/'" style="margin-left: 20px;"><i class="icon-plus" style="margin-right: 5px;"></i>新建环节</button>
				</span>
				<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:150px;margin-bottom: 0px;margin-left:10px;" placeholder="输入关键字搜索">
				<button type="submit" class="btn" id="search_btn_test"><i class="icon-search"></i></button>
			</form>
		</div>   
		<div  style="padding:20px;">
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th>环节名称</th>
					<th>环节类型</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${procedures.content}" var="procedure">
					<tr>
						<td>${procedure.name}&nbsp;</td>
						<td>${procedure.businessType.name}&nbsp;</td>
						<td>
							<a href="${ctx}/procedure/edit/${procedure.id}" id="editLink-${procedure.id}"><i class="icon-edit"></i> 修改</a>&nbsp;&nbsp;
							<a href="${ctx}/procedure/delete/${procedure.id}" id="deleteLink-${procedure.id}"><i class="icon-remove"></i>删除</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>		
			</table>
			<tags:pagination page="${procedures}" paginationSize="4"/>
		</div>		
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>