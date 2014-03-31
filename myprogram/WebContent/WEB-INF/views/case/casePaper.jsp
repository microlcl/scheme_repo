<%@ page contentType="text/html;charset=UTF-8"%>

<div class="row">
	<div class="span">
		<div class="form-search" style="padding: 0px 0 20px 2px;">
			<label for="paperList">调查问卷：</label> 			
				<input id="case_owner"
				class="span4 easyui-combobox" name="paper.id"
				data-options="url:'${ctx}/paper/api/search?businessType=${mycase.businessType.id}',method:'get',valueField:'id',textField:'paperName'" value="${mycase.paper.id}" <c:if test="${mycase.answered == true}">readonly</c:if>>
		   <input id="reset_answer" class="btn" type="button" style="margin-left: 60px;" value="重置答案" onclick="ResetAnswer();"/>
		</div>
	</div>
</div>
<div>
				<c:forEach items="${mycase.paper.questions}" var="question" varStatus="status">
                  <div class="accordion-heading">
                  	<span style="padding-left:8px">Q${status.count}：</span>
                      	${question.question}<c:if test="${question.trashed == 'T'}"><span style="color:#FF0000">(此问题已被删除)</span></c:if>
                      	<input type="hidden" name="paper.questions[${status.index}].id" value="${question.id}">
                      	<input type="hidden" name="quest" value="paper.questions[${status.index}].questionOptions">
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
							<textarea name="paper.questions[${status.index}].questionOptions" id="paper.questions[${status.index}].questionOptions">${question.questionOptions}</textarea>
						</c:if>
                    </div>
			</c:forEach>

</div>
<script type="text/javascript">
 function ResetAnswer(){
 	var quests=document.getElementsByName("quest");      
    var questnum=quests.length;
    for(var i=0;i<questnum;i++){                        
   	 	var questid=quests[i].getAttribute("value");  
    	var options=document.getElementsByName(questid);                       
    	var optionnum=options.length;
    	if( optionnum == 1)
    	    document.getElementById(questid).value ="";
    	for(var j=0;j<optionnum;j++){                   
       		if(options[j].checked){
    		  options[j].checked = false;
     		}
    	}   	
 	}
 }
</script>
