<%@ page contentType="text/html;charset=UTF-8"%>
		<div  style="padding:20px 20px 20px 20px; text-align: center;">
			<!--button id="first_visit" type="button" class="btn btn-warning" onclick="location.href='${ctx}/visit/add?caseId=${mycase.id}&visitType=1-0-4-0'">增加到访记录</button-->
			<button id="not_first_visit" type="button" class="btn btn-warning" onclick="location.href='${ctx}/visit/returnVisit?caseId=${mycase.id}&visitType=1-0-4-1&businessTypeId=${mycase.businessType.id}'">增加回访记录</button>
		</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th>访问ID</th>
					<th>时间</th>
					<th>访问类别</th>					
					<th>跟单者</th>
					<th>备注</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${mycase.visitActivities}" var="visit">
					<c:if test="${visit.visitType.id == '1-0-4-1'}">
						<tr>
							<td><a href="${ctx}/visit/update/${visit.id}">${visit.id}</a></td>
							<td><fmt:formatDate value="${visit.visitTime}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>${visit.visitType.name}</td>
							<td>${visit.operator.id}</td>
							<td>${visit.comment}</td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>		
			</table>