<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
</head>

<body>
	<form id="inputForm" action="${ctx}/account/show" method="post" class="form-horizontal">
		<fieldset>
			<legend><small>用户管理</small></legend>
			<div class="control-group">
				<label for="id" class="control-label">登录名：</label>
				<div class="controls">
					<input type="text" id="id" name="id"  value="${formUser.id}" class="input-large" readonly/>
				</div>
			</div>	
			<div class="control-group">
				<label for="name" class="control-label">用户名：</label>
				<div class="controls">
					<input type="text" id="name" name="name"  value="${formUser.name}" class="input-large required" rangelength="2,20"/>
				</div>
			</div>	

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
   				     <input type="email" id="email" name="email" required="" value="${formUser.email}" class="input-large">
                  </div>
            </div>	
			<div class="control-group">
				<label for="phoneNum" class="control-label">电话号码:</label>
				<div class="controls">
					<input type="text" id="phoneNum" name="phoneNum" class="input-large " value="${formUser.phoneNum}" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="address" class="control-label">联系地址:</label>
				<div class="controls">
					<input type="text" id="address" name="address" class="input-large " value="${formUser.address}" />
				</div>
			</div>			
		    <div class="control-group">
				<label for="hometown" class="control-label">籍贯:</label>
				<div class="controls">
					<input type="text" id="hometown" name="hometown" class="input-large " value="${formUser.hometown}" />
				</div>
			</div>			
			<div class="control-group">
                <label for="userBirthday" class="control-label">出身日期:</label>
                <div class="input-append date form_date" style="margin-left:20px" >
                    <input size="16" type="text" id="userBirthday" name="userBirthday" style="width:160px" value="<fmt:formatDate value='${formUser.birthday}' pattern='yyyy-MM-dd'/>" readonly>
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
				    <input id="department_id" name="department.id" value="${formUser.department.id}" class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
				</div>
			</div>	
	
			<div class="control-group">
				<label for="role" class="control-label required">当前角色:</label>
				<div class="controls" style="width:500px">
					<c:forEach items="${allRoles}" var="allRole">
						<label class="checkbox inline" style="margin-left:10px;width:80px;">
							<input type="checkbox" name="role" id="role" value="${allRole.id}" <c:if test="${allRole.checked==true }">checked="true"</c:if> >${allRole.name}
						</label>
					</c:forEach>
					<br>
				</div>
			</div>	
					
			<div class="control-group">
				<label for="comment" class="control-label">备注:</label>
				<div class="controls">
					<textarea id="comment" name="comment" class="input-large">${formUser.comment}</textarea>
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
			$("#formUsername").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					name: {
						rangelength: [2,10]
					},
					password: {
						required: true,
						rangelength: [5,20]
					},
					address: {
						rangelength: [5,50]
					},
					hometown: {
						rangelength: [2,10]
					},
					sex: {
                        required: function (element) {
                            return $("input:radio[name='sex']:checked").val() != "";
                        }
                    },
                    status: {
                    	required: function (element) {
                            return $("input:radio[name='status']:checked").val() != "";
                        }
                    },
                    role: {
                    	required: function (element) {
                            return $("input:checkbox[name='status']:checked").val() != "";
                        }
                    },
                    comment: {
                    	rangelength: [0,128]
                    }
				},
				messages: {
					name: {
						rangelength: jQuery.validator.format("用户名必须在 {0} 和 {1} 个字符之间")
					},
					password: {
						rangelength: jQuery.validator.format("密码长度必须在 {0} 和 {1} 个字符之间")
					},
					address: {
						rangelength: jQuery.validator.format("地址长度必须在 {0} 和 {1} 个字符之间")
					},
					hometown: {
						rangelength: jQuery.validator.format("籍贯长度必须在 {0} 和 {1} 个字符之间")
					},
					sex: {
                        required: "请选择性别!"
                    },
                    status: {
                    	required: "请选择当前情况!"
                    },
                    role: {
                    	required: "请选择至少一个角色!"
                    },
                    comment: {
                    	rangelength: jQuery.validator.format("备注必须在 {0} 和 {1} 个字符之间")
                    }
                   
				},
				errorElement: "span",
	//			success: function () {
                    //正确时的样式
    //                label.text(" ").removeClass("error");
    //              label.text("ss ").addClass("success");
    //        },
				errorPlacement: function (error, element) {
	                if(element.is(":radio")||element.is(":checkbox"))
                 	   error.appendTo(element.parent().parent());   
	                else
	                	error.insertAfter(element); 
               
        	    }
			});

			 
	});
	$("input[name='sex'][value=${formUser.sex}]").prop("checked", true);
	$("input[name='status'][value=${formUser.status}]").prop("checked", true);

	</script>
</body>
</html>
