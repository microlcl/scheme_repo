<%@ page contentType="text/html;charset=UTF-8"%>

<div class="row">
	<div class="span">
		<div class="form-search" style="padding: 0px 0 20px 2px;">
			<label for="paperList">调查问卷：</label> 
				<input name="paperList" id="case_owner"
				class="span4 easyui-combobox"
				data-options="method:'get',valueField:'id',textField:'name'" value=${mycase.owner.id}>

		</div>
	</div>
</div>
<div>
				<c:forEach items="${mycase.paper.questions}" var="question" varStatus="status">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.count}：</span>
                      	${question.question}<c:if test="${question.trashed == 'T'}"><span style="color:#FF0000">(此问题已被删除)</span></c:if>
                   </div>
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
			</c:forEach>

</div>
