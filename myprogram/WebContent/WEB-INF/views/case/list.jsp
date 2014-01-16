<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
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
		 <div class="row" style="margin:20px;">
		<div class="span" style="border: 1px solid #CCCCCC;border-radius: 4px;padding:10px;margin-left:0px;background-color: white;">
			<form class="form-search " action="#" style="margin-bottom:0px;">
			 	<label>部&nbsp;&nbsp;&nbsp;门：</label> <input name="search_department_id" id="mydepartment_id" value="${param.search_department_id }" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		 	    <label style="margin-left: 85px;">策划类别：</label> <input id="cc1" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false"  name="search_business_type" value="${param.search_business_type}" />
		 	    <div style="padding-top:10px">
		 	    <label>拥有者：</label> <input name="search_owner_id" id="myaccount_id" value="${param.search_owner_id }" class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'"> 
		 	    <label style="margin-left: 100px;">关键字：</label><input type="text" name="search_keyword" class="input-small" style="width:200px;" value="${param.search_keyword}">
                <button type="submit" class="btn" id="search_btn" style="margin-left: 15px;"><i class="icon-search"></i></button>
                </div>
	    </div>
	    <button type="button" class="btn btn-success" onclick="location.href='${ctx}/case/add/'" style="margin-left: 75px;margin-top:5px"><i class="icon-plus"></i>新建案例</button>
	    <tags:sort/>
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
				<td>${cases.eventTime}</td>
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