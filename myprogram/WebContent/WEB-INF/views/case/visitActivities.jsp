<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
<!--
 function updateVisitActivity() {
 	var mySelectedVisitId = $('input[name="myVisitActivityId"]:checked').val();
 	console.log('mySelectedVisitId' + mySelectedVisitId);
 	if(!mySelectedVisitId) {
 		alert("请选择一个到访记录");
 		return;
 	}
 	location.href="${ctx}/visit/update/" + mySelectedVisitId;
 }
//-->
</script>
		<div  style="padding:20px 20px 20px 20px; text-align: center;">
			<button type="button" class="btn btn-warning" onclick="updateVisitActivity()">增加到访记录</button>
		</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th>访问ID</th>
					<th>时间</th>
					<th>访问类别</th>					
					<th>前台接待</th>
					<th>跟单者</th>
					<th>备注</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${mycase.visitActivities}" var="visit">
					<c:if test="${visit.visitType.id == '1-0-4-0'}">
						<tr>
							<td>
								<label class="radio">
									<input type="radio" name="myVisitActivityId" value="${visit.id}">
										${visit.id}
								</label>
							</td>
							<td><fmt:formatDate value="${visit.visitTime}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>${visit.visitType.name}</td>
							<td>${visit.recipient.id}</td>
							<td>${visit.operator.id}</td>
							<td>${visit.comment}</td>
						</tr>
					</c:if>	
				</c:forEach>
				</tbody>		
			</table>