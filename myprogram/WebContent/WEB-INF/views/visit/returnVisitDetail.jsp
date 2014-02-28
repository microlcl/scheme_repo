<%@ page contentType="text/html;charset=UTF-8"%>
			<div style="padding:20px;">
				<div class="control-group">	
					<span class="formlabel span2 control-label">案例名称：</span>
					
					<input type="text" class="required" id="caseTitle" name="caseTitle"  style="width:186px" class="input-large " maxlength="64" placeholder="案例名称" value="${thisCase.title}" readonly>
			<!--  	<c:if test="${thisCase.id != null}">
						<button type="button" class="btn"  onclick="casePopupWindow({callback:addCase})">选择案例</button>
					</c:if>
			-->	
					<input type="hidden" name="caseid" id="caseid" >
					
				</div>		
			
				<div class="control-group">
					<span class="formlabel span2 control-label">访问类别：</span>
					<input type="hidden" name="visitCategory"  value="${visitType}" style="width:186px" readonly>
					<input type="text"  value="回访" style="width:186px" readonly>
				</div>
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">到访人数：</span>
					<input type="text" class="required" id="visitNumber" name="visitNumber" style="width:186px" class="input-large " maxlength="20" placeholder="请输入到访人数"/>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">到访时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id=customerVisitTime name="customerVisitTime" style="width:132px" readonly>
	                    <span class="add-on"><i class="icon-remove"></i></span>
						<span class="add-on"><i class="icon-th"></i></span>
	               </div>
	            </div>
	            
	            <div class="control-group" style="display:none">
					<span class="formlabel span2 control-label">策划类别：</span>
					<input type="text" name="businessType"  value="${businessTypeId}" style="width:186px">
				</div>
				
				<div class="control-group" style="display:none">
					<span class="formlabel span2 control-label">是否初次到访：</span>
					<input type="text" name="isVisited"  value="T" style="width:186px">
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">客户名字：</span>
					<input type="text" id="customerName" class="required" name="customerName" style="width:186px" class="input-large " maxlength="64" placeholder="客户姓名，xx先生/xx女士亦可"/>
				</div>		
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">到访备注：</span>
					<textarea id="comment" name="comment" style="width:186px" maxlength="256" class="input-large"></textarea>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">案例时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id="customerEventTime" name="customerEventTime" value="<fmt:formatDate value='${thisCase.eventTime}' pattern='yyyy-MM-dd HH:mm'/>" style="width:132px" readonly>
	                    <span class="add-on"><i class="icon-remove"></i></span>
						<span class="add-on"><i class="icon-th"></i></span>
	               </div>
	            </div>
	            
	           	<div class="control-group">
					<span class="formlabel span2 control-label">客人人数：</span>
					<input type="text" id="guestNumber" class="required" name="guestNumber" value="${thisCase.guestNum}" style="width:186px" class="input-large " maxlength="20" placeholder="请输入客人人数"/>
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">会场简介：</span>
					<textarea id="spaceTip" name="spaceTip"  style="width:186px" maxlength="256" class="input-large">${thisCase.spaceTip}</textarea>
				</div>
	            
			</div>