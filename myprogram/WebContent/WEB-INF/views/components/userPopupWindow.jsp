<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!-- combotreee -->
<!-- link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css"-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/mystyle.css">
<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/nano/nano.js" type="text/javascript"></script>

<style>
</style>
<div id="userModalWindow" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4>人员选择</h4>
	</div>
	<div class="modal-body">
		<!-- 模态对话框begin -->
		<div class="search-panel">
			<form class="form-search form-inline" action="#">
					部门：<input id="departmentId" name="search_departmentId" class="easyui-combotree"  data-options="url:'${ctx}/department/api/get',method:'get',required:false" style="width:200px;">	
					    id：<input type="text" id="search_id" name="search_id"   class="input-small"  value="${param.search_id}"> 
					    <button class="btn" style="border-radius:0px 4px 4px 0" type="button" onclick="searchUser()" id="search_user_btn">Go!</button>
			</form>
		</div>
		
		<div class="accordion" style="border-color: transparent" id="myuser"></div>

		<div id="loadMoreUser" class="pagination pagination-centered">
			<button class="btn btn-link" type="button" onclick="loadMoreUser()">加载更多...</button>
		</div>
		<!-- 模态对话框end -->
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">关闭</a> 
		<a href="#" class="btn btn-primary"	data-dismiss="modal" aria-hidden="true" onclick="getSelectedUser()">确定</a>
	</div>
</div>

<!-- 生成选项的JS模板 -->
<div style="display:none" id="myUserTemplate">
<div class="accordion-group">
	<div class="accordion-heading">
	<ul class="inline">
			<li><input id="myq_{id}" value="{id}:{name}" type="checkbox" name="selectedUser"/> </li>
			<li>{id}: {name}</li>
</ul>
	</div>
</div>
</div>




<script>
	var currentPage = 0;

	//调用者输入参数
	var parameters = {};

	function searchUser() {
		currentPage = 0;
		$('#myuser').empty();
		loadMoreUser();
		return false;
	}

	function userPopupWindow(obj) {
		parameters = obj;
		$('#userModalWindow').modal({
			backdrop : false,
		});
		loadMoreUser();

	}

	function loadMoreUser() {
		var nextPage = currentPage + 1;
		console.log("next pageNum:" + nextPage);
		$.ajax({
			url : '${ctx}/account/api/searchUser',
			type : 'get',
			data : {
				page : nextPage,
				search_department_id:$('#departmentId').combotree('getValue'),
				search_id:$('#search_id').val()
			},

			success : function(resp) {
				currentPage++;
				if (resp.lastPage) {
					$('#loadMoreUser').hide();
				} else {
					$('#loadMoreUser').show();
				}
				$.each(resp.content, function(i, user) {
					var mytemp = $('#myUserTemplate').html();
					var myvalue = nano(mytemp,user);

					$('#myuser').append(myvalue);
					$('#myq_' + user.id).data('user', user);
				});
			}
		});

	}
	function buildOptions(obj){
		$('#myuser').append(obj.id);
		$('#myuser').append(obj.name);
	}
	function getSelectedUser() {
		parameters.callback($('input:checkbox[name="selectedUser"]:checked'));
	}
</script>
