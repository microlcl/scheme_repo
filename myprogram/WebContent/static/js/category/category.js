var editingId;

function showBtn(value) {
	var btn = '<a href="javascript:void(0)"  onclick="save()">保存</a>'
	return btn;
}

function onContextMenu(e, row) {
	//只允许没有编辑行的情况下出现右键菜单，避免多行编辑。
	if (editingId) 
		return;
	e.preventDefault();
	$(this).treegrid('select', row.id);
	$('#mm').menu('show', {
		left : e.pageX,
		top : e.pageY
	});
}

function edit() {
	if (editingId != undefined) {
		$('#tg').treegrid('select', editingId);
		return;
	}
	var row = $('#tg').treegrid('getSelected');
	if (row) {
		editingId = row.id;
		console.log("editingId=" + editingId);
		$('#tg').treegrid('beginEdit', editingId);
	}
}

function save() {
	if (editingId != undefined) {
		var t = $('#tg');
//		var node = t.treegrid('getSelected');
		var node = t.treegrid('find', editingId);
		t.treegrid('endEdit', editingId);
		console.log('in save(), node.id=' + node.id);
		$.ajax({
			url : './api/save',
			type: 'post',
			data:{
				id:node.id,
				pid:node._parentId,
				name:node.name,
				trashed:node.trashed,
				comment:node.comment
			},
			success : function(resp) {
				console.log('in success function');
				console.log(resp);
				
				editingId = undefined;
				t.treegrid('reloadFooter');
			}
		});
	}
	
}

function append() {
	var node = $('#tg').treegrid('getSelected');
	//get id from server side
	$.ajax({
		url : './api/subId/'+node.id,
		type: 'post',
		success : function(resp) {
			console.log('in success function');
			console.log(resp);
			generateSonNode(node.id,resp);
		}
	});

}

function generateSonNode(pid,sonId) {
	var d2 = new Date();
	d2.setMonth(d2.getMonth() + 1);
	
	console.log("in generateSonNode():");
	console.log('pid=' + pid + ',sonID=' + sonId);

	$('#tg').treegrid('append', {
		parent : pid,
		data : [ {
			id : sonId,			
			name : '',
			trashed : 'F',
			createdDate : $.fn.datebox.defaults.formatter(d2),
			comment : ''
		} ]
	})
	editingId = sonId;
	$('#tg').treegrid('select', editingId);
	$('#tg').treegrid('beginEdit', editingId);
}
function removeIt() {
	var node = $('#tg').treegrid('getSelected');
	if (node) {
		children = $('#tg').treegrid('getChildren', node.id);
		console.log('children.length=' + children.length);
		if (children.length > 0) {
			$.messager.alert('Message','请先删除其子节点');
			return;
		}
		$.messager.confirm('Confirm','你确定要删除这个节点吗?',function(r){
			if (r){
				$.ajax({
					url : './api/delete/'+ node.id,
					type: 'delete',
					success : function(resp) {
						console.log('Delete node success:node.id = ' + node.id);
						$('#tg').treegrid('remove', node.id);
						
						editingId = undefined;
						t.treegrid('reloadFooter');
					}
				});	
			}
			});	
	
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