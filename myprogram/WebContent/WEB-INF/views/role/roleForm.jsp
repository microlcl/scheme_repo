<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>角色管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>

<body>
	<form id="roleForm" action="${ctx}/role/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${role.id}"/>
		<fieldset>
			<legend><small>角色权限管理</small></legend>
			<div class="control-group">
				<label for="name" class="control-label">角色名：</label>
				<div class="controls">
					<p type="text" id="rolename" name="rolename"/> ${role.name}</p>
				</div>
			</div>	
			
			
			<div class="control-group">
				<label for="description" class="control-label">角色描述：</label>
				<div class="controls">
					<input type="text" id="address" name="description"  value="${role.description}" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="function" class="control-label">当前权限:</label>
				<div class="controls"></div>
			</div>		
				
			<c:forEach items="${moduleList}" var="module">
			<div class="control-group">
				<label for="function" class="control-label"><c:forEach items="${module.modules}" var="parentmodule">${parentmodule.name}-></c:forEach>&nbsp;${module.name}</label>
				<div class="controls">
				<c:forEach items="${module.functions}" var="module_function" >
						<label class="checkbox inline">
							<input type="checkbox" name="function" id="function-${module_function.id}" <c:forEach items="${role.functions}" var="role_function"><c:if test="${module_function.id==role_function.id}">checked</c:if></c:forEach>>${module_function.name}</input>
						</label>
				</c:forEach>
				</div>
			</div>						
			</c:forEach>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
	$(document).ready(function() {
			//聚焦第一个输入框
			$("#rolename").focus();
			 
	});
	</script>
</body>
</html>
