<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>方案管理系统:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
<!-- link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" /-->
<link href="${ctx}/static/styles/default.min.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>
<style>
	body {
    	background: none repeat scroll 0 0 #F2F2F2 !important;
	}
</style>

<sitemesh:head/>
</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="row">
		<%@ include file="/WEB-INF/layouts/left.jsp"%>
			<div id="main" class="span10">
				<sitemesh:body />
			</div>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
	<!-- plupload和bootstrap.min.js有冲突，所以加载上传组件时，把这个js排除掉 -->
	<% if(request.getRequestURI().indexOf("media/upload") > 0||request.getRequestURI().indexOf("task/add") > 0||request.getRequestURI().indexOf("task/update") > 0){%>
	<%}else{ %>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
	<%} %>
</body>
</html>