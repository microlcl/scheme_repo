<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>角色管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<style>
		body {
			background: none repeat scroll 0 0 #F2F2F2 !important;
		}
		.form {
			margin-top: 10px;
			background: none repeat scroll 0 0 #F9F9F9 !important;
			-moz-border-bottom-colors: none;
		    -moz-border-left-colors: none;
		    -moz-border-right-colors: none;
		    -moz-border-top-colors: none;
		    border-color: #DADADA #DADADA -moz-use-text-color;
		    border-image: none;
		    border-style: solid solid none;
		    border-width: 1px 1px medium;
		}
		#test {
			color: #FAA732 !important;
			border-bottom: 1px dashed #E3E3E3 !important;
			margin-left:20px;
			margin-right:20px;
		}
		.form-actions {
			border-top: 0px !important;
		}
	</style>
</head>

<body>
	<form id="roleForm" action="${ctx}/role/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${role.id}"/>
		<div class="form">
			<h1 id="test">角色权限管理</h1>
			<div class="control-group">
				<label for="name" class="control-label" style="font-weight:bold;">角色名：</label>
				<div class="controls">
					<input type="text" id="name" name="name" value=" ${role.name}"/> 
				</div>
			</div>	
			
			
			<div class="control-group">
				<label for="description" class="control-label" style="font-weight:bold;">角色描述：</label>
				<div class="controls">
					<input type="text" id="description" name="description"  value="${role.description}" class="input-large required" />
				</div>
			</div>
			<div class="control-group">
				<label for="function" class="control-label" style="font-weight:bold;">当前权限：</label>
				<div class="controls">
				<br>
					<c:forEach items="${moduleList}" var="module">
					<div class="control-group" style="background-color:#fffbea;margin-right:20px;border: 1px solid #CCCCCC;border-radius: 4px 4px 4px 4px;">
					<!--有父节点的暂时停用 	<label for="function" class="control-label"><c:forEach items="${module.modules}" var="parentmodule">${parentmodule.name}-></c:forEach>&nbsp;${module.name}</label> -->
					<label for="function" class="control-label" style="width:100px;">${module.name}：</label>
						<c:forEach items="${module.functions}" var="module_function" >
								<label class="checkbox pull-left" style="margin-left:10px;width:80px;">
									<input type="checkbox" name="functionList" id="functionList" value="${module_function.id}" <c:forEach items="${role.functions}" var="role_function"><c:if test="${module_function.id==role_function.id}">checked</c:if></c:forEach>>${module_function.name}
								</label>
						</c:forEach>
					</div>						
					</c:forEach>	
				</div>
			</div>		
			<div class="form-actions" style="background: url('${ctx}/static/bootstrap/2.3.2/img/bom_cor.png') no-repeat scroll left bottom rgba(0, 0, 0, 0);">
				<input id="submit_btn" class="btn btn-warning" type="submit" value="提交" style="height: 40px;width: 130px;"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" style="height: 40px;width: 130px;" onclick="history.back()"/>
			</div>
		</div>
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
			//聚焦第一个输入框
			$("#rolename").focus();
			 
	});
	</script>
</body>
</html>
