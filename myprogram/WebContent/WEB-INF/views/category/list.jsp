<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>

</head>
<body>
	<h2>类别管理</h2>
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
				<th	data-options="field:'trashed',width:60,align:'right',editor:'text'">是否可用</th>
				<th data-options="field:'modified',width:80">修改时间</th>
				<th data-options="field:'comment',width:80,editor:'text'">备注</th>
				<th data-options="field:'id',width:80,formatter:showBtn">操作</th>
			</tr>
		</thead>
	</table>
	<div id="mm" class="easyui-menu" style="width: 120px;">
		<div onclick="edit()" data-options="iconCls:'icon-edit'">编辑</div>
		<div onclick="append()" data-options="iconCls:'icon-add'">添加</div>
		<div onclick="removeIt()" data-options="iconCls:'icon-remove'">移除</div>
		<div class="menu-sep"></div>
		<div onclick="collapse()">折叠</div>
		<div onclick="expand()">展开</div>
	</div>
	<script type="text/javascript">
		function showBtn(value) {
			var btn = '<a href="javascript:void(0)"  onclick="save()">保存</a>'
			return btn;
		}

		function onContextMenu(e, row) {
			e.preventDefault();
			$(this).treegrid('select', row.id);
			$('#mm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
		var editingId;
		function edit() {
			if (editingId != undefined) {
				$('#tg').treegrid('select', editingId);
				return;
			}
			var row = $('#tg').treegrid('getSelected');
			if (row) {
				editingId = row.id
				$('#tg').treegrid('beginEdit', editingId);
			}
		}

		function save() {
			if (editingId != undefined) {
				var t = $('#tg');
				t.treegrid('endEdit', editingId);
				editingId = undefined;
				t.treegrid('reloadFooter');
			}
		}

		var idIndex = 100;
		function append() {
			idIndex++;
			var d1 = new Date();
			var d2 = new Date();
			d2.setMonth(d2.getMonth() + 1);
			var node = $('#tg').treegrid('getSelected');
			$('#tg').treegrid('append', {
				parent : node.id,
				data : [ {
					id : idIndex,
					name : '类别' + idIndex,
					trashed : '是',
					modified : $.fn.datebox.defaults.formatter(d2),
					comment : '增加了一个新的类别'
				} ]
			})
		}
		function removeIt() {
			var node = $('#tg').treegrid('getSelected');
			if (node) {
				$('#tg').treegrid('remove', node.id);
			}
		}
		function collapse() {
			var node = $('#tg').treegrid('getSelected');
			if (node) {
				$('#tg').treegrid('collapse', node.id);
			}
		}
		function expand() {
			var node = $('#tg').treegrid('getSelected');
			if (node) {
				$('#tg').treegrid('expand', node.id);
			}
		}
	</script>
</body>
</html>