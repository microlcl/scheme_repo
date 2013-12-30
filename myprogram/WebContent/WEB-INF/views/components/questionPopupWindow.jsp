<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />


<!-- combotreee -->
<!-- link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css"-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<script src="${ctx}/static/nano/nano.js"
	type="text/javascript"></script>

<style>
</style>
<div id="questionModalWindow" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4>问题选择</h4>
	</div>
	<div class="modal-body">
		<!-- 模态对话框begin -->
		<div class="search-panel">
			<form class="form-search form-inline" action="#">
				<div>
					<input type="text" id='searchKeyword' name="search_keyword"
						style="width: 60%" value="${param.search_keyword}">
					<button type="button" class="btn" id="search_btn"
						onclick="search()">Search</button>
				</div>
			</form>
		</div>

		<div class="accordion" id="myaccordion"></div>

		<div id="loadMore" class="pagination pagination-centered">
			<button class="btn btn-link" type="button" onclick="loadMore()">加载更多...</button>
		</div>
		<!-- 模态对话框end -->
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal" aria-hidden="true"
			onclick="stopAudio()">关闭</a> <a href="#" class="btn btn-primary"
			data-dismiss="modal" aria-hidden="true" onclick="getSelectedValue()">确定</a>
	</div>
</div>

<!-- 生成选项的JS模板 -->
<div style="display:none" id="mytemplate">
<div class="accordion-group">
	<div class="accordion-heading">
	  	<label class="checkbox inline">	
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#myaccordion" href="#collapse_{id}"><input value="{id}" type="checkbox" name="selectedQuestions"/>Q{id}: {question}</a>
	  	</label>		
	</div>
	<div id="collapse_{id}" class="accordion-body collapse">
		<div class="accordion-inner">{options}</div>
	</div>
</div>
</div>


<script>
	var currentPage = 0;

	//调用者输入参数
	var parameters = {};

	var callback;

	function search() {
		console.log('in search');
		currentPage = 0;
		$('#myaccordion').empty();
		loadMore();
		return false;
	}

	//{targetMedia: this,mediaType:picture, callback: setMedia}
	//function resourcePopupWindow(media, mediaType) {
	function questionPopupWindow(obj) {
		console.log("in resourcePopupWindow");

		$('#questionModalWindow').modal({
			backdrop : false,
		});
		loadMore();
		//callback = obj.callback;

	}

	function loadMore() {
		var nextPage = currentPage + 1;
		console.log("next pageNum:" + nextPage);
		$.ajax({
			url : '${ctx}/question/api/search',
			type : 'get',
			data : {
				page : nextPage,
				search_keyword : $('#searchKeyword').val()
			},

			success : function(resp) {
				currentPage++;
				console.log('in success function, currentPage = ' + currentPage);
				console.log(resp);
				if (resp.lastPage) {
					$('#loadMore').hide();
				} else {
					$('#loadMore').show();
				}
				$.each(resp.content, function(i, question) {
					console.log(i + '===' + question.id);
					var mytemp = $('#mytemplate').html();
					var options = buildOptions(question);
					console.log("options===" + options);
					question.options = options;
					var myvalue = nano(mytemp,question);
					console.log(myvalue);

					$('#myaccordion').append(myvalue);
				});
			}
		});

	}
	
	function buildOptions(question) {
		var result = '';
		var questionType = question.questionType;
		var radioBoxTemp = '<label class="radio"><input type="radio" name="questionOption" >{option}</label>';
		var checkBoxTemp = '<label class="checkbox"><input type="checkbox" name="questionOption" >{option}</label>';

		$.each(question.splitOptions, function(i,option){
			console.log(option);
			var data = {};
			data.option = option;
			if (questionType == 1) {
				result = result + nano(radioBoxTemp, data);
			}
			else if (questionType == 2) {
				result = result + nano(checkBoxTemp, data);
			} else {};
		});
		
		return result;

	}
</script>
