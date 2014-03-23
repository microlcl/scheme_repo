<%@ page contentType="text/html;charset=UTF-8"%>
	<div  style="padding:20px 20px 20px 20px; text-align: center;">
		<button type="button" class="btn btn-warning" onclick="location.href='${ctx}/task/add?caseId=${mycase.id}'">增加任务</button>
	</div>
	<table class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>任务描述</th>
			<th>状态</th>
			<th>拥有者</th>
			<th>创建时间</th>
			<th>优先度</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${mycase.tasks}" var="task">
			<tr>
				<td><a href="${ctx}/task/update?id=${task.id}">${task.summary}</a></td>
				<td>${task.status.name}&nbsp;</td>
				<td>${task.owner.name}</td> 
				<td><fmt:formatDate value="${task.createdTimestamp}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${task.priority.name}</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>