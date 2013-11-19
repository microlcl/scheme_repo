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
	<form id="roleForm" action="${ctx}/role/doAdd" method="post" class="form-horizontal">
		<fieldset>
			<legend><small>创建新角色</small></legend>
			<div class="control-group">
				<label for="name" class="control-label">角色名：</label>
				<div class="controls">
					<input type="text" id="name" name="name"/> 
				</div>
			</div>	
			
			<div class="control-group">
				<label for="description" class="control-label">角色描述：</label>
				<div class="controls">
					<input type="text" id="description" name="description" class="input-large required" />
				</div>
			</div>
			<div class="control-group">
				<label for="function" class="control-label">当前权限：</label>
				<div class="controls">
				<br>
					<c:forEach items="${moduleList}" var="module">
					<div class="control-group">
					<!--有父节点的暂时停用 	<label for="function" class="control-label"><c:forEach items="${module.modules}" var="parentmodule">${parentmodule.name}-></c:forEach>&nbsp;${module.name}</label> -->
					<label for="function" class="control-label" style="width:100px;">${module.name}：</label>
						<c:forEach items="${module.functions}" var="module_function" >
								<label class="checkbox pull-left" style="margin-left:10px;width:80px;">
									<input type="checkbox" name="functionList" id="functionList" value="${module_function.id}" >${module_function.name}
								</label>
						</c:forEach>
					</div>						
					</c:forEach>	
				</div>
			</div>		
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
