<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>修改问卷</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/nano/nano.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#paper-tab").addClass("active");
			
			var businessTypeId = ['${selectpaper.businessType.id}'];
			$("#cc2").combotree({ 
				onLoadSuccess:function(node){//数据加载成功触发 
					$("#cc2").combotree('setValues', businessTypeId);
				}
			});
		});
		
		
		function addQuestions(result) {
			console.log("in callback function");
			console.log(result);
			console.log("你选择的问题的数目是：" + result.questions.length);
			$.each(result.questions, function(i,question){
				console.log("你选择的问题的id是："+question.id);
				if($('#myq1_'+question.id).length > 0) {
					return true;
				}
				console.log("你选择的问题"+i+"是：" + question.question);
				var mytemp = $('#mytemplate1').html();
				var options = buildOptions(question);
				question.options = options;
				var myvalue = nano(mytemp,question);

				$('#myaccordion1').append(myvalue);
				$('#myq1_' + question.id).data('question', question);

			} );
			$("input[name='selectedQuestionsOnPage']").attr('checked',true);
			$('#selected_questions').show();
		}
		function buildOptions(question) {
			var result = '';
			var questionType = question.questionType;
			var radioBoxTemp = '<label class="radio"><input type="radio" name="questionOption" >{option}</label>';
			var checkBoxTemp = '<label class="checkbox"><input type="checkbox" name="questionOption" >{option}</label>';

			$.each(question.splitOptions, function(i,option){
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

</head>
<body>
	<div class="form">
		<h1>修改问卷</h1>
		<div style="padding:20px;">
			<form id="questionsForm" action="${ctx}/paper/save"  method="post">
				<label class="span3 control-label" style="width: 40%;font-weight: bold;line-height: 30px;text-align: right; padding-right: 20px;">问卷名称:</label>
				<input type="text" name="paperTitle"  maxlength="64" class="span3 required" placeholder="0~64个字符" style="margin-right:200px;" value="${selectpaper.paperName}"/>
				<label class="span3 control-label" style="width: 40%;font-weight: bold;line-height: 30px;text-align: right; padding-right: 20px;">问卷类型:</label>
				<input id="cc2" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-7',method:'get',required:false" style="width:200px;margin-right:200px !important;" name="search_categoryId" value="${param.search_categoryId}"/></br>
				<button id="select_questions_button" style="height: 40px !important;width: 180px !important; margin-top: 10px;" type="button" class="btn btn-warning" id="search_btn" onclick="questionPopupWindow({callback:addQuestions})">请点击此处选择问题</button>
				<div id="selected_questions" style="">
					<label style="width: 100%;font-weight: bold;line-height: 30px;text-align: left; padding-left: 20px;">您所选择的问题如下:</label>
					<div class="accordion" style="border-color: transparent;  width: 80%; margin-left: 100px;"  id="myaccordion1">
						<c:forEach items="${questions}" var="question" varStatus="status">
							<div class="accordion-group">
			                  	<div class="accordion-heading">
			                  		<ul class="inline">
										<li><input id="myq1_${question.id}" value="${question.id}" type="checkbox" name="selectedQuestionsOnPage"/> </li>
										<li><a class="accordion-toggle" data-toggle="collapse" data-parent="#myaccordion1" href="#collapse_${question.id}">Q${question.id}: ${question.question}</a></li>
			                      	</ul>
			                   	</div>
							</div>
							<div id="collapse_${question.id}" class="accordion-body collapse">
			                    <div class="accordion-inner" style="padding-left:55px">
									<c:if test="${question.questionType == '1'}">
										<c:forEach items="${question.splitOptions}" var="splitOption">
											<label class="radio">
												<input type="radio" name="questionOption" >
													${splitOption}
											</label>
										</c:forEach>
									</c:if>
									<c:if test="${question.questionType == '2'}">
										<c:forEach items="${question.splitOptions}" var="splitOption">
											<label class="checkbox">
												<input type="checkbox" name="questionOption" >
													${splitOption}
											</label>
										</c:forEach>
									</c:if>
									<c:if test="${question.questionType == '3'}">
										<textarea></textarea>
									</c:if>
			                    </div>
							</div>
					</c:forEach>
					</div>
				</div>
			</form>
		</div>
		<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
			<input id="submit_btn" class="btn btn-warning" type="submit" value="提交" onclick="$('#questionsForm').submit();" />&nbsp;	
			<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
		</div>
	</div>
	<!-- resource 选择模态对话框 -->
	<%@ include file="../components/questionPopupWindow.jsp"%>
	<!-- 生成选项的JS模板 -->
	<div style="display:none" id="mytemplate1">
		<div class="accordion-group">
			<div class="accordion-heading">
				<ul class="inline">
						<li><input id="myq1_{id}" value="{id}" type="checkbox" name="selectedQuestionsOnPage"/> </li>
						<li><a class="accordion-toggle" data-toggle="collapse" data-parent="#myaccordion1" href="#collapse_{id}">Q{id}: {question}</a></li>
				</ul>
			</div>
			<div id="collapse_{id}" class="accordion-body collapse">
				<div class="accordion-inner"> <div style="padding:0px 0px 0px 34px">{options}</div></div>
			</div>
		</div>
	</div>
</body>
</html>