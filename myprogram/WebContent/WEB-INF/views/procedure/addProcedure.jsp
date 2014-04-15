<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>调查问卷</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/nano/nano.js" type="text/javascript"></script>
	<script>
		var position = 10;  //新增问题的起始position
		$(document).ready(function() {
			$("#paper-tab").addClass("active");
			$("#questionsForm").validate({
				rules: {
					name: {
						rangelength: [1,64]
					}
				},
				
				messages: {
					name: {
						required: "请填写问卷名称"
					}
				}
			});
			
			$('#cc2').combotree({
				url:'${ctx}/category/api/getAll/getBusinessType',
				required: false,
				valueField: 'id',
				textField: 'text',
				method:'get',
				//只能选择叶子节点：
				onBeforeSelect : function(node){ 
					var tree = $(this).tree;
					var isLeaf = tree('isLeaf', node.target);
					console.log("isLeaf=" + isLeaf);
					return isLeaf;
				}
			});
			
		});
						
		function submitForm(){
			console.log("========" + $("input[name='search_categoryId']").val());
			if ($("input[name='search_categoryId']").val() != "") {
				$('#procedureForm').submit();
			}else {
				$("#warning-block").show();
				$("#cc2").focus();
			}
		}
	</script>

</head>
<body>
	<div class="form">
		<h1>新增环节</h1>
		<div class="alert hide" id="warning-block">
	  	   <strong>注意! </strong>请选择环节类型。
		</div>
		<div style="padding:20px;">
			<form id="procedureForm" action="${ctx}/procedure/save" method="post">
				<label class="span3 control-label" style="width: 40%;font-weight: bold;line-height: 30px;text-align: right; padding-right: 20px;">环节名称:</label>
				<input type="text" name="name"  maxlength="64" class="span3 required" placeholder="0~64个字符" style="margin-right:100px;"/><br>
				<label class="span3 control-label" style="width: 40%;font-weight: bold;line-height: 30px;text-align: right; padding-right: 20px;">环节类型:</label>
				<input id="cc2" class="easyui-combobox" style="width:200px;margin-right:200px !important;" name="search_categoryId" value="${param.search_categoryId}" /><br>
				<input id="submit_btn" style="height: 40px !important;width: 120px !important; margin-top: 10px;" type="button" class="btn btn-warning" onclick="submitForm();" value="提交"/>&nbsp;	
				<input id="cancel_btn" style="height: 40px !important;width: 120px !important; margin-top: 10px;" type="button" class="btn" value="返回" onclick="history.back()"/>				
		</div>
	</div>
</body>
</html>