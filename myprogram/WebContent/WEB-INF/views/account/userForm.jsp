<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>

<body>
	<form id="inputForm" action="${ctx}/account/update" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<fieldset>
			<legend><small>用户管理</small></legend>
			<div class="control-group">
				<label for="username" class="control-label">用户名</label>
				<div class="controls">
					<input type="text" id="username" name="username"  value="${user.name}" class="input-large required" rangelength="2,20"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="plainPassword" class="control-label">密码:</label>
				<div class="controls">
					<input type="password" id="plainPassword" name="plainPassword" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="confirmPassword" class="control-label">确认密码:</label>
				<div class="controls">
					<input type="password" id="confirmPassword" name="confirmPassword" class="input-large required" equalTo="#plainPassword"/>
				</div>
			</div>
			<div class="control-group">
				<label for="sex" class="control-label">性别:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >男
					</label>
					<label class="radio inline">
						<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" >女
					</label>
				</div>
			</div>	
            <div class="control-group">
  				  <label class="control-label" for="inputIcon">邮箱:</label>
  				  <div class="controls">
   				     <input type="email" required="" placeholder="test@example.com" class="span3">
                  </div>
            </div>	
			<div class="control-group">
				<label for="phoneNumber" class="control-label">电话号码:</label>
				<div class="controls">
					<input type="text" id="phoneNumber" name="phoneNumber" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="userAddress" class="control-label">联系地址:</label>
				<div class="controls">
					<input type="text" id="userAddress" name="userAddress" class="input-large required" minlength="3"/>
				</div>
			</div>			
		    <div class="control-group">
				<label for="userHometown" class="control-label">家乡:</label>
				<div class="controls">
					<input type="text" id="userHometown" name="userHometown" class="input-large required" minlength="3"/>
				</div>
			</div>			
			<div class="control-group">
                <label class="control-label">出身日期:</label>
                <div class="input-append date form_date" style="margin-left:20px" >
                    <input size="16" type="text" style="width:160px" value="1980-01-01" readonly>
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>				
			<div class="control-group">
				<label for="userStatus" class="control-label">目前情况:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" >在职
					</label>
					<label class="radio inline">
						<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" >离职
					</label>
					<label class="radio inline">
						<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" >停薪留职
					</label>										
				</div>
			</div>				
			<div class="control-group">
				<label for="description" class="control-label">备注:</label>
				<div class="controls">
					<textarea id="description" name="description" class="input-large">${user.comment}</textarea>
				</div>
			</div>	
			
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  true,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
		format: 'yyyy-mm-dd'
    });
	$(document).ready(function() {
			//聚焦第一个输入框
			$("#username").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
	});
	</script>
</body>
</html>
