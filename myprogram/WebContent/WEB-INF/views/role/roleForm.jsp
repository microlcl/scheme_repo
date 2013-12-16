<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>角色管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>

<body>
	<form id="roleForm" action="${ctx}/role/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${role.id}"/>
		<div class="form">
			<h1>角色权限管理</h1>
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
				<div class="controls ">
				<br>
					<c:forEach items="${moduleList}" var="module">
					<div class="control-group onefield">
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
			<div class="form-actions" >
				<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
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
