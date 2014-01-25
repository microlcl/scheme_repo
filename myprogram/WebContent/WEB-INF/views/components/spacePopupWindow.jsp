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

<style type="text/css">
	.tdSpace {
		padding-left:100px;
	}
</style>
<div id="spaceModalWindow" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4>会场选择</h4>
	</div>
	<div class="modal-body">
		<!-- 模态对话框begin -->
		<div class="search-panel">
			<form class="form-search form-inline" action="#">
				<div>
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
		<ul class="inline" style="margin-bottom:0px">
			<li><input id="space_{id}" value="{id}" type="radio" name="selectedSpace"/> </li>
			<li><a class="accordion-toggle" data-toggle="collapse" data-parent="#myaccordion" href="#collapse_{id}">{id}: {space_name}</a></li>
		</ul>
	</div>
	<div id="collapse_{id}" class="accordion-body collapse">
	  <div class="accordion-inner" style="padding-left:55px">
		<table>
			<tbody>
				<tr>
					<td><strong>容纳人数：</strong></td>
					<td>{volume}人</td>
					<td class="tdSpace"><strong>所在楼层：</strong></td>
					<td>第{floor}层</td>
				</tr>
				<tr>
					<td><strong>楼层高：</strong></td>
					<td>{hall_height}米</td>
					<td class="tdSpace"><strong>舞台长：</strong></td>
					<td>{stage_length}米</td>
				</tr>
				<tr>
					<td><strong>舞台宽：</strong></td>
					<td>{stage_width}米</td>
					<td class="tdSpace"><strong>舞台高：</strong></td>
					<td>{stage_height}米</td>
				</tr>
				<tr>
					<td><strong>所属场地：</strong></td>
					<td colspan="3">{holders.holder_name}</td>
				</tr>
				<tr>
					<td><strong>所在地址：</strong></td>
					<td colspan="3">{holders.address}</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:right;padding-top:5px"><a href="${ctx}/holder/show/holderInfo/{id}" target="_blank">详细信息</a></td>
				</tr>
			</tbody>
		</table>
	  </div>
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

	function spacePopupWindow(obj) {
		parameters = obj;
		$('#spaceModalWindow').modal({
			backdrop : false,
		});
		loadMore();

	}

	function loadMore() {
		var nextPage = currentPage + 1;
		console.log("next pageNum:" + nextPage);
		$.ajax({
			url : '${ctx}/holder/api/search',
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
				$.each(resp.content, function(i, space) {
					var mytemp = $('#mytemplate').html();
					var myvalue = nano(mytemp,space);

					$('#myaccordion').append(myvalue);
					$('#myq_' + space.id).data('space', space);
				});
			}
		});

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
