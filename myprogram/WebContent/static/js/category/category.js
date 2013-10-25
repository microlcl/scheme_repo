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
		$.ajax({
			url : './api/create',
			type: 'post',
			data:{
				id:'111',
				name:'lcl',
				comment:'my comment'
			},
			success : function(resp) {
				console.log('in success function');
				console.log(resp);
			}
		});
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