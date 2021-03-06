<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#accountSelector-tab").addClass("active");

		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#mydepartment_id').combotree({
			onChange : function(node) {
				var url = '../account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
	});
</script>

</head>

<body>

	<h1>员工选择</h1>

	<div class="row">
		<div class="span">
			<label>部门：</label><input name="mydepartment_id" id="mydepartment_id"
				class="easyui-combotree"
				data-options="url:'${ctx}/department/api/get',method:'get',required:false">
			<label>员工：</label><input name="myaccount_id" id="myaccount_id"
				class="easyui-combobox"
				data-options="method:'get',valueField:'id',textField:'name'">

		</div>
		<tags:sort />
	</div>
	</div>


</body>
</html>
