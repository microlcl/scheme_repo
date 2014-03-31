<%@ page contentType="text/html;charset=UTF-8"%>
	<div  style="padding:20px 20px 20px 20px; text-align: center;">
		<button type="button" class="btn btn-warning" onclick="location.href='${ctx}/scheme/add?caseId=${mycase.id}'">增加方案</button>
	</div>
	<table class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>序号</th>
			<th>方案名称</th>
			<th>创建者</th>
			<th>修改时间</th>
			<th>描述</th>
			<th>状态</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${mycase.schemes}" var="scheme">
			<tr>
				<td><a href="${ctx}/scheme/update?id=${scheme.id}">${scheme.id}</a></td>
				<td>${scheme.name}</td>
				<td>${scheme.creator.name}</td> 
				<td><fmt:formatDate value="${scheme.modificationTimestamp}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${scheme.comment}</td>
				<td>${scheme.status}</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>