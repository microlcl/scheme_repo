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
<div id="caseModalWindow" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4>案例选择</h4>
	</div>
	<div class="modal-body">
		<!-- 模态对话框begin -->
		<div class="search-panel">
			<form class="form-search form-inline" action="#">
						<div class="input-append">
						<label>关键字：</label> 
					    <input class="span3" id="searchKeyword" type="text">
					    <button class="btn" style="border-radius:0px 4px 4px 0" type="button" onclick="search()" id="search_btn">Go!</button>
						</div>
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
			<li><input id="myc_{id}" value="{id}:{title}" type="radio" name="selectedCases"/> </li>
			<li><a class="accordion-toggle" data-toggle="collapse" data-parent="#myaccordion" href="#collapse_{id}">{id}:{title}</a></li>
</ul>
	</div>
	<div id="collapse_{id}" class="accordion-body collapse">

		<label style="margin-left: 50px; ">拥有人：{owner.name}&nbsp;&nbsp;&nbsp;描述：{description}</label>
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

	function casePopupWindow(obj) {
		parameters = obj;
		$('#caseModalWindow').modal({
			backdrop : false,
		});
		loadMore();

	}

	function loadMore() {
		var nextPage = currentPage + 1;
		console.log("next pageNum:" + nextPage);
		$.ajax({
			url : '${ctx}/case/api/search',
			type : 'get',
			data : {
			page : nextPage,
			search_keyword : $('#searchKeyword').val(),
			},

			success : function(resp) {
				currentPage++;
				if (resp.lastPage) {
					$('#loadMore').hide();
				} else {
					$('#loadMore').show();
				}
				$.each(resp.content, function(i, cases) {
					var mytemp = $('#mytemplate').html();
					var myvalue = nano(mytemp,cases);
					$('#myaccordion').append(myvalue);
					$('#myc_' + cases.id).data('cases', cases);
				});
			}
		});

	}
	
	
	function getSelectedValue() {

//		parameters.callback($('input:radio[name="selectedCases"]:checked'));
		var result = {};

		result.cases = [];
		var selectedQuestions = $('input:radio[name="selectedCases"]:checked');
		$.each(selectedQuestions, function(i, cases) {
			var mydata = $('#' + cases.id).data('cases');
			result.cases.push(mydata);
		});
		parameters.callback(result);
				
	}
</script>