<%@ page contentType="text/html;charset=UTF-8"%>

<div>
				<div style="padding-bottom:8px;font-size:15px;color:red">本次回访采用的问卷：${visit.paper.paperName}</div>
				<input type="hidden" name="paper.id" id="paperId" value="${visit.paper.id}">
				<c:forEach items="${questions}" var="question" varStatus="status">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.count}：</span>
                      	${question.question}<c:if test="${question.trashed == 'T'}"><span style="color:#FF0000">(此问题已被删除)</span></c:if>
                      	<input type="hidden" name="paper.questions[${status.index}].id" value="${question.id}">
                   </div>
                    <div class="accordion-inner" style="padding-left:55px">
						<c:if test="${question.questionType == '1'}">
							<c:forEach items="${question.options}" var="myoption" varStatus="optionStatus">
								<label class="radio">
									<input type="radio" name="paper.questions[${status.index}].questionOptions" value="${optionStatus.count}" <c:if test="${myoption.checked==true }">checked=true</c:if>>
										${myoption.content}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '2'}">
							<c:forEach items="${question.options}" var="myoption" varStatus="optionStatus">
								<label class="checkbox">
									<input type="checkbox" name="paper.questions[${status.index}].questionOptions" value="${optionStatus.count}" <c:if test="${myoption.checked==true }">checked="true"</c:if>>
										${myoption.content}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '3'}">
							<textarea name="paper.questions[${status.index}].questionOptions">${question.questionOptions}</textarea>
						</c:if>
                    </div>
			</c:forEach>

</div>

