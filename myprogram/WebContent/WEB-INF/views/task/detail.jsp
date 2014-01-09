<%@ page contentType="text/html;charset=UTF-8"%>
    <script>
    $(document).ready(function() {

		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#department').combotree({
			onChange : function(node) {
				var url = '../account/api/search?departmentId=' + node;
				$('#myaccount_id').combobox('reload', url);
			}
		});
	});
	</script>
	<div>
		任务类型：<input type="text" id="taskType" name="taskType.id"   class="input-large required" maxlength="64"/>
		任务状态：
		 <input id="status" name="status.id"  class="easyui-combotree"  style="width:220px;" data-options="url:'${ctx}/category/api/getAll/M1-9',method:'get',required:false">
		
	</div>
	
	<div>
		所属部门：
		<input id="department" name="department.id"   class="easyui-combotree" data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		拥有者：
		<input id="myaccount_id" name="owner.id"  class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'">
	</div>
	<!-- 
	<div>
		优先级：<input type="text" id="priority" name="priority"   class="input-large required" maxlength="64"/>
		计划完成时间：<input type="text" id="dueDate" name="dueDate"  class="input-large required" maxlength="64"/>
	</div>
	<div>
		剩余时间：<input type="text" id="timeRemaining" name="timeRemaining"  class="input-large required" maxlength="64"/>
		创建人：<input type="text" id="createdDy" name="createdDy"   class="input-large required" maxlength="64"/>
	</div>
	<div>
		创建时间：<input type="text" id="createdTimestamp" name="createdTimestamp"  class="input-large required" maxlength="64"/>
		描述：<input type="text" id="description" name="description"   class="input-large required" maxlength="64"/>
	</div>
 -->