<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<style>
		.combo {
			height: 28px !important;
			border-radius: 4px 4px 4px 4px !important;
		}
		
		.combo .combo-text {
			font-size: 14px !important;
		}
		
		
	</style>
</head>

<body>
	<form id="inputForm" action="${ctx}/account/show" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<fieldset>
			<legend><small>用户管理</small></legend>
			<div class="control-group">
				<label for="name" class="control-label">用户名</label>
				<div class="controls">
					<input type="text" id="name" name="name"  value="${user.name}" class="input-large required" rangelength="2,20"/>
				</div>
			</div>	
<!-- 			<div class="control-group">
				<label for="password" class="control-label">密码:</label>
				<div class="controls">
					<input type="password" id="password" name="password" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="confirmPassword" class="control-label">确认密码:</label>
				<div class="controls">
					<input type="password" id="confirmPassword" name="confirmPassword" class="input-large required" equalTo="#password"/>
				</div>
			</div>
 -->
			<div class="control-group">
				<label for="sex" class="control-label required">性别:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="sex" id="sex" value="男" >男
					</label>
					<label class="radio inline">
						<input type="radio" name="sex" id="sex" value="女" >女
					</label>
				</div>
			</div>	
            <div class="control-group">
  				  <label class="control-label" for="email">邮箱:</label>
  				  <div class="controls">
   				     <input type="email" id="email" name="email" required="" placeholder="test@example.com" class="span3">
                  </div>
            </div>	
			<div class="control-group">
				<label for="phoneNum" class="control-label">电话号码:</label>
				<div class="controls">
					<input type="text" id="phoneNum" name="phoneNum" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="address" class="control-label">联系地址:</label>
				<div class="controls">
					<input type="text" id="address" name="address" class="input-large required" minlength="3"/>
				</div>
			</div>			
		    <div class="control-group">
				<label for="hometown" class="control-label">家乡:</label>
				<div class="controls">
					<input type="text" id="hometown" name="hometown" class="input-large required" minlength="3"/>
				</div>
			</div>			
			<div class="control-group">
                <label for="birthday" class="control-label">出身日期:</label>
                <div class="input-append date form_date" style="margin-left:20px" >
                    <input size="16" type="text" id="birthday" name="birthday" style="width:160px" value="1980-01-01" readonly>
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>				
			<div class="control-group">
				<label for="status" class="control-label">目前情况:</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="status" id="status" value="在职" >在职
					</label>
					<label class="radio inline">
						<input type="radio" name="status" id="status" value="离职" >离职
					</label>
					<label class="radio inline">
						<input type="radio" name="status" id="status" value="停薪留职" >停薪留职
					</label>									
				</div>
			</div>	
			<div class="control-group">
				<label for="department_id" class="control-label">所在部门:</label>
				<div class="controls">
				    <input id="department_id" name="department.id" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
				</div>
			</div>	
	
			<div class="control-group">
				<label for="role" class="control-label required">当前角色:</label>
				<div class="controls">
					<c:forEach items="${allRoles}" var="allRole">
						<label class="checkbox inline">
							<input type="checkbox" name="role" id="role" value="${allRole.id}" <c:if test="${allRole.checked==true }">checked="true"</c:if> >${allRole.name}
						</label>
					</c:forEach>
				</div>
			</div>	
					
			<div class="control-group">
				<label for="comment" class="control-label">备注:</label>
				<div class="controls">
					<textarea id="comment" name="comment" class="input-large">${user.comment}</textarea>
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
		//	$('#cc').combotree('setValue', '销售部');

			 
	});
	$("input[name='sex'][value=${user.sex}]").prop("checked", true);
	//$('D1').combotree('setValue', '销售部');
	var roleList="";
	$("input[type='checkbox'][name='role']:checked").each(function(){
		roleList += this.value;
	//	${user.roles}.add(this.value);
	});

	function test(){
		
		 alert($('input[type="radio"][name="sex"]:checked').val());

	}
	</script>
</body>
</html>
