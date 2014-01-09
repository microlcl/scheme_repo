<%@ page contentType="text/html;charset=UTF-8"%>
<div class="form-horizontal">
	<div class="row">
		<div class="control-group span5">
			<label class="control-label" for="business_type">策划类别：</label>
			<div class="controls">
				<input type="text" id="business_type">
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label" for="event_time">举行时间：</label>
			<div class="controls">
				<input type="password" id="event_time" placeholder="">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span5">
			<label class="control-label" for="guest_num">宾客人数：</label>
			<div class="controls">
				<input type="text" id="guest_num">
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label" for="space_id">地点：</label>
			<div class="controls">
				<input type="password" id="space_id" placeholder="">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="control-group span5">
			<label class="control-label" for="assigned_department">所属部门：</label>
			<div class="controls">
				<input name="assignedDepartment" id="assigned_department"
				class="easyui-combotree"
				data-options="url:'${ctx}/department/api/get',method:'get',required:false">
			</div>
		</div>
		<div class="control-group span5">
			<label class="control-label" for="case_owner">责任人：</label>
			<div class="controls">
				<input name="caseOwner" id="case_owner"
				class="easyui-combobox"
				data-options="method:'get',valueField:'id',textField:'name'">
			</div>
		</div>
	</div>
	<div class="control-group">
			<label class="control-label" for="description">描述：</label>
			<div class="controls">
				<textarea rows="10" class="span7" id="description" name="description" maxlength="1024"></textarea>
			</div>
		</div>
</div>
	
