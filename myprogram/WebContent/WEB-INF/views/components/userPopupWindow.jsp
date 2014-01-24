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
					<label>部门：</label> 
					<input id="departmentId" name="search_departmentId" class="easyui-combotree" multiple  data-options="url:'${ctx}/department/api/get',method:'get',required:false" style="width:200px;">	
						
			</form>
		</div>
		
		<div class="accordion" style="border-color: transparent" id="myaccordion"></div>

		<div id="loadMore" class="pagination pagination-centered">
			<button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
		</div>
		<!-- 模态对话框end -->
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal" aria-hidden="true"">关闭</a> 
		<a href="#" class="btn btn-primary"	data-dismiss="modal" aria-hidden="true" onclick="getSelectedValue()">确定</a>
	</div>
</div>

<!-- 生成选项的JS模板 -->
<div style="display:none" id="mytemplate">
<div class="accordion-group">
	<div class="accordion-heading">
	<ul class="inline">
			<li><input id="myq_{id}" value="{id}" type="checkbox" name="selectedQuestions"/> </li>
			<li>{id}: {name}</li>
</ul>
	</div>
</div>
</div>




<script>
	var currentPage = 0;

	//调用者输入参数
	var parameters = {};

	function search() {
		currentPage = 0;
		$('#myaccordion').empty();
		loadMore();
		return false;
	}

	function userPopupWindow(obj) {
		parameters = obj;
		$('#userModalWindow').modal({
			backdrop : false,
		});
		loadMore();

	}

	function loadMore() {
		var nextPage = currentPage + 1;
		console.log("next pageNum:" + nextPage);
		$.ajax({
			url : '${ctx}/account/api/searchUser',
			type : 'get',
			data : {
				page : nextPage,
				search_departmentId:$('#departmentId').combotree('getValues')
			},

			success : function(resp) {
				currentPage++;
				if (resp.lastPage) {
					$('#loadMore').hide();
				} else {
					$('#loadMore').show();
				}
				$.each(resp.content, function(i, user) {
					var mytemp = $('#mytemplate').html();
					var myvalue = nano(mytemp,user);

					$('#myaccordion').append(myvalue);
					$('#myq_' + user.id).data('user', user);
				});
			}
		});

	}
	function buildOptions(obj){
		$('#myaccordion').append(obj.id);
		$('#myaccordion').append(obj.name);
	}
	function getSelectedValue() {
		var result = {};
		result.parameters = parameters;
		result.questions = [];
		var selectedQuestions = $('input:checkbox[name="selectedQuestions"]:checked');
		$.each(selectedQuestions, function(i, question) {
			var mydata = $('#' + question.id).data('question');
			result.questions.push(mydata);
		});
		parameters.callback(result);
			
	}
</script>
