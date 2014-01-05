<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
<!-- combotreee -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">

<title>问题管理</title>
</head>
<body>
<div class="form" >
	<h1>问题管理</h1>
	<div class="row" style="margin:20px;">
		<div class="span" style="border: 1px solid #CCCCCC;border-radius: 4px;padding:10px;margin-left:0px;background-color: #FFFBEA;">
			<form class="form-search" action="#" style="margin-bottom:0px;">
				<div>
					<input type="text" name="search_keyword" value="${param.search_keyword}" style="width:600px" maxlenght="256">
					<button type="submit" class="btn" id="search_btn">搜索</button>
				</div>
				<div style="padding-top:15px">
			 		<label>类别：</label> 
					<input id="cc" name="search_categoryId" class="easyui-combotree" value="${param.search_categoryId}" multiple data-options="url:'${ctx}/category/api/getAll/M1-7',method:'get',required:false" style="width:200px;">		
				</div>
			</form>
		</div>
		<a href="${ctx}/question/addQuestion/" style="padding: 5px; background-color: #DADADA;border-radius: 4px 4px 4px 4px;line-height: 30px; color:#000000;margin-left:100px;">
						<i class="icon-plus-sign"></i>&nbsp;新增问题
		</a>
		
		<tags:sort/>
	</div>
	<div style="padding:20px;">
	<div id="questions" class="accordion">
		<c:forEach items="${questions.content}" var="question" varStatus="status">
			<div class="accordion-group">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.index+1+(pageNumber-1)*5}：</span>
                    <a href="#collapse_${status.index+1+(pageNumber-1)*5}" data-parent="#questions" data-toggle="collapse" class="accordion-toggle" style="display: inline-block; word-wrap: break-word; width: 900px;">
                      	${question.question}
                    </a>
                    <span style="float: right; padding: 8px 20px;"><a href="${ctx}/question/editQuestion/question_${question.id}"><i class="icon-edit"></i>修改</a>&nbsp;<a href="javascript: if(confirm('确定删除吗')){location.href='${ctx}/question/deleteQuestion/question_${question.id}';}"><i class="icon-remove-circle"></i>删除</a></span>
                   </div>
                  <div class="accordion-body collapse" id="collapse_${status.index+1+(pageNumber-1)*5}">
                    <div class="accordion-inner" style="padding-left:55px">
						<c:if test="${question.questionType == '1'}">
							<c:forEach items="${question.splitOptions}" var="splitOption">
								<label class="radio">
									<input type="radio" name="questionOption" >
										${splitOption}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '2'}">
							<c:forEach items="${question.splitOptions}" var="splitOption">
								<label class="checkbox">
									<input type="checkbox" name="questionOption" >
										${splitOption}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '3'}">
							<textarea></textarea>
						</c:if>
                    </div>
                  </div>
            </div>
		</c:forEach>
	</div>
	<tags:pagination page="${questions}" paginationSize="4"/>
	</div>
    <script type="text/javascript">
 	   $(document).ready(function() {
			$("#question-tab").addClass("active");
 	   });
    
		var categoryIds = [];
		<c:forEach items="${categories}" var="category">
			categoryIds.push('${category}');
		</c:forEach>
		$("#cc").combotree({ 
			onLoadSuccess:function(node){//数据加载成功触发 
				$("#cc").combotree('setValues', categoryIds);
			}
		});
	</script>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>