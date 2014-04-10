<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>需求管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#case-tab").addClass("active");
			
			var businessTypeId = [];
			<c:forEach items="${businessType}" var="category">
				businessTypeId.push('${category}');
			</c:forEach>
			$("#cc1").combotree({ 
				onLoadSuccess:function(node){//数据加载成功触发 
					$("#cc1").combotree('setValues', businessTypeId);
				},
				onBeforeSelect:function(node){ 
					var tree = $(this).tree;
					var isLeaf = tree('isLeaf', node.target);
					console.log("isLeaf=" + isLeaf);
					return isLeaf;
				}
			
			});
			
			$('#mydepartment_id').combotree({
				onChange : function(node) {
					var url = '../account/api/search?departmentId=' + node;
					$('#myaccount_id').combobox('reload', url);
				}
			});
			
		});

	</script>

</head>
<body>
	<div class="form">
		<h1>需求管理</h1>
    <div class=" onefield" style="height:40px !important; text-align: right !important;padding-right: 10px;padding-top: 7px;margin-left:20px;background-color: white;">
			<form style="padding-left:10px;">
				<span  style="float:left;">
				 部&nbsp;&nbsp;&nbsp;门： <input name="search_department_id" id="mydepartment_id" style="width:150px;" value="${param.search_department_id }" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
				&nbsp; 拥有者：<input name="search_owner_id" id="myaccount_id" value="${param.search_owner_id }" style="width:150px;" class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'"> 
				&nbsp;策划类别：<input id="cc1" class="easyui-combotree" style="width:150px;" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false"  name="search_business_type" value="${param.search_business_type}" /> 
				<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:150px;margin-bottom: 0px;margin-left:10px;" placeholder="输入关键字搜索">
				<button type="submit" class="btn" id="search_btn_test"><i class="icon-search"></i></button>
				<button type="button" class="btn btn-success" onclick="location.href='${ctx}/case/add/'" style="margin-left: 30px;"><i class="icon-plus"></i>新建案例</button>
	   			 &nbsp; &nbsp;&nbsp; &nbsp;<tags:sort/>
				</span>
			</form>
	</div>

	<div style="padding:20px;">
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>案例名称</th>
			<th>所属部门</th>
			<th>拥有者</th>
			<th>策划类别</th>
			<th>时间</th>
			<th>客户人数</th>
			<th>案例地点</th>
			<th>案例状态</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${cases.content}" var="cases">
			<tr>
				<td><a href="${ctx}/case/detail/${cases.id}">${cases.title}</a></td>
				<td>${cases.department.name}</td> 
				<td>${cases.owner.name}</td> 
				<td>${cases.businessType.name}</td>
				<td><fmt:formatDate value="${cases.eventTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${cases.guestNum}</td>
				<td>${cases.space.space_name}</td>
				<td>${cases.status.name}</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>
	<tags:pagination page="${cases}" paginationSize="4"/>
	</div>
	</div>
	<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
	</div>
</body>
</html>