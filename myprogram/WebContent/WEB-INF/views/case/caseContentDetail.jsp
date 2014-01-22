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
				<div class="input-append date form_date" >
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
			<label class="control-label" for="space_id">地点：</label>
			<div class="pull-right">
				<input type="text" class="span4" id="space_id" placeholder="">
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
	<div class="accordion-group">
		<div class="accordion-heading">

				<a class="accordion-toggle" data-toggle="collapse"
				href="#stakeholders">				
					新娘： 戴安娜
			</a> 

		</div>
		<div id="stakeholders" class="accordion-body collapse">
			<div class="accordion-inner">
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_character">身份：</label>
						<div class="controls">
							<input name="customer.character" id="customer_character"
								class="span4 easyui-combotree"
								data-options="url:'${ctx}/category/api/getChildren/getCharacterType',method:'get',required:false"
								value="1-0-3-1">
						</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_name">姓名：</label>
						<div class="pull-right">
							<input type="text" class="span4" id="customer_name" value="戴安娜" placeholder="姓名">
						</div>
					</div>
				</div>			
					
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_job">工作：</label>
						<div class="controls">
							<input name="customer.job" id="customer_job" type="text"
								class="span4">
						</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_phone">电话：</label>
						<div class="pull-right">
							<input type="text" class="span4" id="customer_phone" placeholder="电话">
						</div>
					</div>
				</div>
	
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse"
			 href="#stakeholder1s">新郎：张三</a>
		</div>
		<div id="stakeholder1s" class="accordion-body collapse">
			<div class="accordion-inner">新郎详细信息</div>
		</div>
	</div>	
</div>