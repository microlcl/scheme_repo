<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	
		<style>
		body {
			background: none repeat scroll 0 0 #F2F2F2 !important;
		}
		.content {
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
			margin-right:20px;
		}
		.table td {
			border-top: 0;
			padding: 8px 5px;
		}
	</style>
</head>

<body>
	<div class="content">
		<h1 id="test">用户信息</h1>
		<div style="padding-left:50px;">
		<table class="table table-striped">
			<tbody>
				<tr>
					<td style="width:63px">用户名：</td>
					<td style="color:#A1A1A1">${infoUser.name}</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td style="color:#A1A1A1">${infoUser.sex}</td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td style="color:#A1A1A1">${infoUser.email}</td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td style="color:#A1A1A1">${infoUser.phoneNum}</td>
				</tr>
				<tr>
					<td>联系地址：</td>
					<td style="color:#A1A1A1">${infoUser.address}</td>
				</tr>
				<tr>
					<td>籍贯：</td>
					<td style="color:#A1A1A1">${infoUser.hometown}</td>
				</tr>
				<tr>
					<td>出身日期：</td>
					<td style="color:#A1A1A1"><fmt:formatDate value="${infoUser.birthday}" pattern="yyyy-MM-dd"/> </td>
				</tr>
				<tr>
					<td>目前情况：</td>
					<td style="color:#A1A1A1">${infoUser.status}</td>
				</tr>
				<tr>
					<td>所在部门：</td>
					<td style="color:#A1A1A1">${infoUser.department.name}</td>
				</tr>
				<tr>
					<td style="padding-top: 13px;">当前角色：</td>
					<td style="color:#A1A1A1">
					<div class="controls" style="width:500px">
					<c:forEach items="${infoUser.roles}" var="userRole">
						<label class="checkbox inline" style="width:80px;margin-left:0">
							<input type="checkbox" name="role" id="role" value="${userRole.id}" checked="true" disabled="true">${userRole.name}
						</label>
					</c:forEach>
					</div>
					</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td style="color:#A1A1A1">${infoUser.comment}</td>
				</tr>
			</tbody>
		</table>
		<div style="height:100px"></div>
		</div>
   </div>


	<script type="text/javascript">
	
	$("input[name='sex'][value=${infoUser.sex}]").prop("checked", true);
	$("input[name='status'][value=${infoUser.status}]").prop("checked", true);

	</script>
</body>
</html>
