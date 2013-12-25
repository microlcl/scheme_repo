<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
<title>问题管理</title>
</head>
<body>
<div class="form" style="padding:20px;">
	<h1>问题管理</h1>
	<div class="row">
		<div class="span">
			<form class="form-search" action="#">
				<input type="text" name="search_keyword" value="" style="width:600px">
				<button type="submit" class="btn" id="search_btn">搜索</button>
			</form>
		</div>
		<tags:sort/>
	</div>
	
	<div id="questions" class="accordion">
		<c:forEach items="${questions.content}" var="question" varStatus="status">
			<div class="accordion-group">
                  <div class="accordion-heading">
                    <a href="#collapseOne" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle" style="display:inline-block">
                      	${question.question}
                    </a>
                    </div>
                  <div class="accordion-body collapse in" id="collapseOne">
                    <div class="accordion-inner">
						${question.questionOptions}
                    </div>
                  </div>
		</c:forEach>
	</div>
	
	
	<tags:pagination page="${questions}" paginationSize="4"/>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>