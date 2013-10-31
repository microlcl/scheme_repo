<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>综合演示用例</title>
	<script>
		$(document).ready(function() {
			$("#account-tab").addClass("active");
		});
	</script>
</head>

<body>
	<h1>帐号管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="offset4">
			<form class="form-search" action="#">
			 	<label>登录名：</label> <input type="text" name="search_id"   class="input-small"  value="${param.search_id}"> 
			    <label>邮件名：</label> <input type="text" name="search_email" class="input-small" value="${param.search_email}">
			    <button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	</div>	
			
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>登录名</th>
			<th>姓名</th>
			<th>电邮</th>
			<th>部门</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}&nbsp;</td>
				<td>${user.name}&nbsp;</td>
				<td>${user.email}&nbsp;</td>
				<td>${user.departmentId}&nbsp;</td>
				<td>${user.status}&nbsp;</td>
				<td>
						<a href="${ctx}/account/user/update/${user.id}" id="editLink-${user.id}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>	



<div class="pagination">
	<ul>
		<li><a href="?page=1&amp;sortType=auto&amp;">&lt;&lt;</a></li>
		<li><a href="?page=2&amp;sortType=auto&amp;">&lt;</a></li>	
		<li><a href="?page=1&amp;sortType=auto&amp;">1</a></li>
		<li><a href="?page=2&amp;sortType=auto&amp;">2</a></li>
		<li class="active"><a href="?page=3&amp;sortType=auto&amp;">3</a></li>
		<li><a href="?page=4&amp;sortType=auto&amp;">4</a></li>
		<li><a href="?page=5&amp;sortType=auto&amp;">5</a></li>
		<li><a href="?page=4&amp;sortType=auto&amp;">&gt;</a></li>
		<li><a href="?page=5&amp;sortType=auto&amp;">&gt;&gt;</a></li>
	</ul>
</div>
</body>
</html>
