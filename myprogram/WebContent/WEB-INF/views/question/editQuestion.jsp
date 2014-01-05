<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/nano/nano.js" type="text/javascript"></script>
<title>修改问题</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#question-tab").addClass("active");
		
		if($('input[name="questionType"]:checked').val() == "3"){
			$("#options").hide();
		}
			
		$("input:radio[name='questionType']").click(
			function(){
				if($('input[name="questionType"]:checked').val() == "3")
					$("#options").hide();
				else
					$("#options").show();
			}
		);
		
		$("input[name='question']").blur(
				function(){
					if ($(this).val() == ""){
						$("#question_error").show();
					}else
						$("#question_error").hide();
				}
		);
		
		$("#inputForm").submit(function(){
			var result = true;
			if ($("input[name='question']").val() == ""){
				$("#question_error").show();
				result = false;
			}
			if($('input[name="questionType"]:checked').val() != "3"){
				if($("input[name='splitOptions']").length < 2){
					$("#option_error").html('<span class="error">至少填写两个选项!</span>');
					$("#option_error").show();
					result = false;
				}else{
					$("input[name='splitOptions']").each(function(){
						if($(this).val() == ""){
							$("#option_error").html('<span class="error">请填完所有选项!</span>');
							$("#option_error").show();
							result = false;
						}
				    });
				}
			}

			return result;
		});
	});

	function addOption(){
		var optionDiv = '<div class="control-group"><label for="option" class="control-label formlabel" style="color:red">*</label><div class="controls"><input type="text" name="splitOptions" onblur="checkOptions()"  value="" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/>'
						+' <a href="javascript:void(0);" onclick="deleteOption(this)" title="删除"><span style="margin:0px 0px -11px 5px" class="iconImg iconImg_delete"></span></a></div></div>';
		$("#options").append(optionDiv);
	}
	
	function deleteOption(obj){
		var _this = $(obj);
		$(_this).parent().parent().remove();
	}
	
	function clearOptions(){
		$('input[name="splitOptions"]').val("");
	}
	
	function checkOptions(){
		var allValue= true;
		$("input[name='splitOptions']").each(function(){
			if($(this).val() == ""){
				allValue = false;
			}
	    });
		
		if(allValue){
			$("#option_error").hide();
		}
		else{
			$("#option_error").html('<span class="error">请填完所有选项!</span>');
			$("#option_error").show();
		}
	}
</script>

</head>
<body>
<form id="inputForm" action="${ctx}/question/updateQuestion" method="post" class="form-horizontal">
	<div class="form">
		<h1>问题管理</h1>
		<div class="control-group">
				<label for="questionType" class="control-label required formlabel">类型:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="questionType" value="1" checked>单选
					</label>
					<label class="radio inline">
						<input type="radio" name="questionType" value="2" >多选
					</label>
					<label class="radio inline">
						<input type="radio" name="questionType" value="3" >开放性问题
					</label>
				</div>
		</div>	
		<div class="control-group">
				<label for="business_type" class="control-label formlabel">类别:</label>
				<div class="controls">
					<input id="business_type" name="business_type" class="easyui-combotree" value="${question.business_type}" data-options="url:'${ctx}/category/api/getAll/M1-7',method:'get',required:false" style="width:200px;">
				</div>
		</div>
		<div class="control-group">
				<label for="question" class="control-label formlabel">标题:</label>
				<div class="controls">
					<input type="hidden" name="id" value="${question.id}">
					<input type="text" id="question" name="question"  value="${question.question}" style="width:600px"  maxlength="256"/>
					<span id="question_error" class="error" style="display:none">请填写标题!</span>
				</div>
		</div>
		<div id="options">
			<div class="control-group">
				<label for="option" class="control-label formlabel">选项:</label>
				<div class="controls">
					<input type="button" onclick="clearOptions();" class="btn btn-info" value="清空全部选项" style="margin-right: 50px;">
					<a title="创建" onclick="addOption()" href="javascript:void(0);"><span class="iconImg iconImg_create" style="margin:0px 0px -11px" ></span></a>
				</div>
			</div>
			<c:forEach items="${question.splitOptions}" var="questionOption" varStatus="status">
				<div class="control-group">
					<label for="option" class="control-label formlabel" style="color:red">*</label>
					<div class="controls">
						<input type="text" name="splitOptions" onblur="checkOptions()"  value="${questionOption}" style="width:400px" placeholder="至少填写两个选项"  maxlength="64"/>
						<a href="javascript:void(0);" onclick="deleteOption(this)" title="删除"><span style="margin:0px 0px -11px 5px" class="iconImg iconImg_delete"></span></a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="option_error" style="padding-left:170px;display:none"></div>
		
		<div class="form-actions" style="padding-top:30px">
			<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
			<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
		</div>	
	</div>
</form>
</body>
</html>