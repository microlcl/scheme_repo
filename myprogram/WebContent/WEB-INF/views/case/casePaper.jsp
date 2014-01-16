<%@ page contentType="text/html;charset=UTF-8"%>

<div class="row">
	<div class="span">
		<div class="form-search" style="padding: 0px 0 20px 2px;">
			<label for="paperList">调查问卷：</label> 
				<input name="paperList" id="case_owner"
				class="span4 easyui-combobox"
				data-options="url:'${ctx}/paper/api/search?businessType=${mycase.businessType.id}',method:'get',valueField:'id',textField:'paperName'" value=${mycase.paper.id}>

		</div>
	</div>
</div>
<div>
				<c:forEach items="${mycase.paper.questions}" var="question" varStatus="status">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.count}：</span>
                      	${question.question}-----${question.id}<c:if test="${question.trashed == 'T'}"><span style="color:#FF0000">(此问题已被删除)</span></c:if>
                   </div>
                    <div class="accordion-inner" style="padding-left:55px">
						<c:if test="${question.questionType == '1'}">
							<c:forEach items="${question.options}" var="myoption">
								<label class="radio">
									<input type="radio" name="questionOption" >
										${myoption.content}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '2'}">
							<c:forEach items="${question.options}" var="myoption">
								<label class="checkbox">
									<input type="checkbox" name="questionOption" >
										${myoption.content}
								</label>
							</c:forEach>
						</c:if>
						<c:if test="${question.questionType == '3'}">
							<textarea>${question.questionOptions}</textarea>
						</c:if>
                    </div>
			</c:forEach>

</div>

