<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/holder/css/holder.css">
	<title>场地管理</title>
	<script>
		$(document).ready(function() {
			$("#space-tab").addClass("active");
			selectCheckPayStats("${param.search_level}");
		});
		
		  function selectCheckPayStats(value)
		   {
		    //获得下拉列表的id
		    var select = document.getElementById("sellevel");
		    //获得下拉列表的所有option
		    var options = select.options;
		    //循环获得对应的节点
		    for(var i=0;i<options.length;i++)
		    {
		     //获得节点的值和后台传来的值进行比较
		     if (options[i].value == value)
		     {
		      //如果当前节点与后台传来的值一致，则将当前节点设置为选中状态，并跳出循环
		      options[i].selected = true;
		      break;
		     }
		    }
		   }
	</script>
</head>
<body>
<div class="form" style="padding:20px;">
	<h1>场地管理</h1>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<div class="row">
		<div class="span">
		  	<form class="form-search" action="#">
			 	<label>会场名称：</label> <input type="text" name="search_space_name"   class="input-small"  value="${param.search_space_name }" style="width:205px;"> 
			 	<label style="margin-left: 2cm;">场地名称：</label> <input type="text" name="search_holder_name"   class="input-small"  value="${param.search_holder_name }" style="width:205px;"> 
			 	<div style="padding-top:10px">
				<label>星级：</label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<select name="search_level" id="sellevel" >
				<option value=""></option>
				<option value="5">五星级</option>
				<option value="4">四星级</option>
				<option value="3">三星级</option>
				</select>
			    <label style="margin-left: 2cm;">关键字：</label>
			    &nbsp;&nbsp;
			    <input type="text" name="search_keyword" class="input-small" value="${param.search_keyword}" style="width:205px;">
			    <button type="submit" class="btn" id="search_btn" style="margin-left: 25px;" >搜索</button>			  
			    <a href="${ctx}/holder/add/" style="margin-left: 2cm;">创建新场地</a>
			    </div>
		    </form>
	    </div>
	    <tags:sort/>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>会场名称</th>
			<th>容纳人数</th>
			<th>所属场地</th>
			<th>星级</th>
			<th>场地地址</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${spaces.content}" var="space">
			<tr>
				<td>${space.space_name}</td>
				<td>${space.volume}</td>
				<td>${space.holders.holder_name}&nbsp;</td>
				<td>
				<c:if test="${space.holders.level == '1'}">
					<p  alt="一星级" title="一星级" class="h_xj1"/>
				</c:if>
				<c:if test="${space.holders.level == '2'}">
					<p  alt="二星级" title="二星级" class="h_xj2"/>
				</c:if>
				<c:if test="${space.holders.level == '3'}">
					<p  alt="三星级" title="三星级" class="h_xj3"/>
				</c:if>
				<c:if test="${space.holders.level == '4'}">
					<p  alt="四星级" title="四星级" class="h_xj4"/>
				</c:if>
				<c:if test="${space.holders.level == '5'}">
					<p  alt="五星级" title="五星级" class="h_xj5"/>
				</c:if>
				</td>
				<td>${space.holders.address}</td>
				<td>
					<a href="${ctx}/holder/show/holderInfo/${space.id}" id="info-${space.id}"><i class="icon-pencil"></i> 查看</a>
					<a href='${ctx}/holder/update?id=${space.holders.id}' id='editLink-${space.holders.id}'><i class='icon-edit'></i> 修改/删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<tags:pagination page="${spaces}" paginationSize="4"/>
</div>
<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;">
</div>
</body>
</html>