<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" 
	href="${ctx}/static/styles/form.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<script src="${ctx}/static/js/category/category.js"
	type="text/javascript"></script>
<script>
		$(document).ready(function() {
			$("#category-tab").addClass("active");
		});
	</script>
</head>
<body>
<div class="form" style="padding:20px;">
	<h1>类别管理</h1>
	<div class="tree-info">
		<div class="tree-tip icon-tip"></div>
		<div>请在节点上单击右键进行维护。</div>
	</div>
	<div style="margin: 10px 0;"></div>
	<table id="tg" class="easyui-treegrid" title="类别管理"
		style="width: '100%'; height: 300px"
		data-options="
				iconCls: 'icon-ok',
				rownumbers: true,
				animate: true,
				collapsible: true,
				fitColumns: true,
				url:'${ctx}/category/api/search',
				method: 'get',
				idField: 'id',
				treeField: 'name',
				onContextMenu: onContextMenu,
				loadFilter: function(data){
				console.log('in load filter');
				console.log(data);
					if (data.rows){
						return data;
					} else {
						var newData={};
						newData.rows=data
						return data;
					}
				}
			">
		<thead>
			<tr>
				<th data-options="field:'name',width:180,editor:'text'">类别名称</th>
				<th data-options="field:'trashed',width:60,align:'right',formatter:formatTrashed,editor:{type:'checkbox',options:{on:'F',off:'T'}}">是否可用</th>
				<th data-options="field:'createdDate',width:80">修改时间</th>
				<th data-options="field:'comment',width:80,editor:'text'">备注</th>
				<th data-options="field:'id',width:80,formatter:showBtn">操作</th>
			</tr>
		</thead>
	</table>
	<div id="mm" class="easyui-menu" style="width: 120px;">
		<mytag:PermssionTag functionId="F1-4"><div onclick="edit()" data-options="iconCls:'icon-edit'">编辑</div></mytag:PermssionTag>
		<mytag:PermssionTag functionId="F1-3"><div onclick="append()" data-options="iconCls:'icon-add'">添加</div></mytag:PermssionTag>
		<mytag:PermssionTag functionId="F1-5"><div onclick="removeIt()" data-options="iconCls:'icon-remove'">移除</div></mytag:PermssionTag>
		<div class="menu-sep"></div>
		<mytag:PermssionTag functionId="F1-7"><div onclick="collapse()">折叠</div></mytag:PermssionTag>
		<mytag:PermssionTag functionId="F1-8"><div onclick="expand()">展开</div></mytag:PermssionTag>
	</div>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
	
</div>
</body>
</html>