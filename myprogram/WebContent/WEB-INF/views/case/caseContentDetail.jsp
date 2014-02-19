<%@ page contentType="text/html;charset=UTF-8"%>
<style>
.form-horizontal .control-label {
    float: left;
    padding-top: 5px;
    text-align: left;
    width: 100px;
}

.form-horizontal .controls {
    margin-left: 100px;
}
</style>
<div class="form-horizontal">
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="business_type">策划类别：</label>
			<div class="controls">
				<input name="businessType.id" id="business_type"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/category/api/getChildren/getBusinessType',method:'get',required:false" value="${mycase.businessType.id}">
			</div>
		</div>
		<div class="control-group pull-right">
			<label class="control-label" for="event_time">举行时间：</label>
			<div class="pull-right">
				<!--input type="text" class="span4" id="event_time" placeholder=""-->
				<div id="eventTime_div" class="input-append date form_date" >
                    <input size="16" type="text" name="eventTime" id="event_time" style="width:302px" value="<fmt:formatDate value='${mycase.eventTime}' pattern='yyyy-MM-dd HH:mm'/>" readonly>
                    <span class="add-on"><i class="icon-remove"></i></span>
					<span class="add-on"><i class="icon-th"></i></span>
                </div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span pull-left">
			<label class="control-label" for="guest_num">宾客人数：</label>
			<div class="controls">
				<input type="text" class="span4" id="guest_num" name="guestNum" value="${mycase.guestNum}">
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="space_value">地点：</label>
			<div class="pull-right">
				<input onclick="spacePopupWindow({callback:addSpaces,target:'space_id',showid:'space_value'})" type="text" class="span4" id="space_value" value="${mycase.space.holders.holder_name} - ${mycase.space.space_name}" placeholder="" readonly>
				<input type="hidden" id="space_id" name="space.id"  value="${mycase.space.id}">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span5 pull-left">
			<label class="control-label" for="assigned_department">所属部门：</label>
			<div class="controls">
				<input name="department.id" id="assigned_department"
				class="span4 easyui-combotree"
				data-options="url:'${ctx}/department/api/get',method:'get',required:false" value=${mycase.department.id}>
			</div>
		</div>
		<div class="control-group span pull-right">
			<label class="control-label" for="created_timestamp">创建时间：</label>
			<div class="pull-right">
				<input type="text" class="span4" id="created_timestamp" placeholder="" value="<fmt:formatDate value='${mycase.createdTimestamp}' pattern='yyyy-MM-dd hh:mm'/>" readonly>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span5 pull-left">
			<label class="control-label" for="case_owner">责任人：</label>
			<div class="controls">
				<input id="case_owner"
				class="span4 easyui-combobox" name="owner.id"
				data-options="method:'get',valueField:'id',textField:'name'" value=${mycase.owner.id}>
			</div>
		</div>

	</div>	
	<div class="control-group">
			<label class="control-label" for="description">描述：</label>
			<div class="controls">
				<textarea rows="6" class="input-block-level" id="description" name="description" maxlength="1024">${mycase.description}</textarea>
			</div>
		</div>
	<div class="row" style="background: #EBEBEB">
		<div class="span">
			<div class="form-search" style="padding-left: 20px;">
				<label>主角</label>
			</div>
		</div>
		<div class="pull-right">
			<a href="#">增加</a>
		</div>
	</div>
	<c:forEach items="${mycase.statkeholders}" var="statkeholders" varStatus="status">
	<div class="accordion-group">
		<div class="accordion-heading">

				<a class="accordion-toggle" data-toggle="collapse"
				href="#stakeholders_${status.index}">				
					${statkeholders.character.name}： ${statkeholders.customer.customerName}
			</a> 

		</div>
		<div id="stakeholders_${status.index}" class="accordion-body collapse">
			<div class="accordion-inner">
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_character_${status.index}">身份：</label>
						<div class="controls">
							<input name="statkeholders[${status.index}].character.id" id="customer_character_${status.index}"
								class="span4 easyui-combotree"
								data-options="url:'${ctx}/category/api/getChildren/getCharacterType',method:'get',required:false"
								value="${statkeholders.character.id}">
						</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_name_${status.index}">姓名：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[${status.index}].customer.customerName" id="customer_name_${status.index}" value="${statkeholders.customer.customerName}" placeholder="姓名">
							<input type="hidden" name="statkeholders[${status.index}].customer.id"  value="${statkeholders.customer.id}">
						</div>
					</div>
				</div>			
					
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_job_${status.index}">工作：</label>
						<div class="controls">
							<input name="statkeholders[${status.index}].customer.job" id="customer_job_${status.index}" type="text"
								class="span4" value="${statkeholders.customer.job}">
						</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_birthday_${status.index}">生日：</label>
						<div class="pull-right">
							<div id="customer_birthday_div_${status.index}" class="input-append date form_date">
								<input size="16" type="text" name="statkeholders[${status.index}].customer.birthday" id="customer_birthday_${status.index}"
									style="width: 302px"
									value="<fmt:formatDate value='${statkeholders.customer.birthday}' pattern='yyyy-MM-dd'/>"
									readonly> <span class="add-on"><i
									class="icon-remove"></i></span> <span class="add-on"><i
									class="icon-th"></i></span>
							</div>
						</div>
					</div>					

				</div>
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_weixin_${status.index}">微信：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[${status.index}].customer.weixin" id="customer_weixin_${status.index}" placeholder="微信" value="${statkeholders.customer.weixin}">
						</div>
					</div>				
					<div class="control-group pull-right">
						<label class="control-label" for="customer_phone_${status.index}">电话：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[${status.index}].customer.customerPhone" id="customer_phone_${status.index}" placeholder="电话" value="${statkeholders.customer.customerPhone}">
						</div>
					</div>					

				</div>				
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_weibo_${status.index}">微博：</label>
						<div class="controls">
							<input name="statkeholders[${status.index}].customer.weibo" id="customer_weibo_${status.index}" type="text" placeholder="微博地址"
								class="span4" value="${statkeholders.customer.weibo}">
						</div>
					</div>
					<div class="control-group span pull-right">
						<label class="control-label" for="customer_qq_${status.index}">QQ：</label>
						<div class="controls">
							<input name="statkeholders[${status.index}].customer.qq" id="customer_qq_${status.index}" type="text" placeholder="QQ"
								class="span4" value="${statkeholders.customer.qq}">
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_favorite_${status.index}">爱好：</label>
						<div class="controls">
								<textarea rows="3" class="span4" id="customer_favorite_${status.index}" name="statkeholders[${status.index}].customer.favorite" maxlength="128">${statkeholders.customer.favorite}</textarea>
						</div>
					</div>
					<div class="control-group span pull-right">
						<label class="control-label" for="customer_description_${status.index}">备注：</label>
						<div class="controls">
							<textarea rows="3" class="span4" id="customer_description_${status.index}" name="statkeholders[${status.index}].description" maxlength="128">${statkeholders.description}</textarea>								
						</div>
					</div>
				</div>					
			</div>
		</div>
	</div>
	</c:forEach>
	
</div>