<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css"  href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/easyui/mytree.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/static/styles/form.css">

<script src="${ctx}/static/easyui/jquery.easyui.min.js"	type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script>
	//用于保存点击增加stakeholder button之前的最大index
	var myCharacterIndex = 0;
	$(document).ready(function() {
		$("#case-tab").addClass("active");
		// 必须在$(document).ready里面定义combotree的onChange事件
		$('#assigned_department').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#case_owner').combobox('reload', url);
			},
			onLoadSuccess: function(node, data) {
				console.log("department load successfully: ");
			}
		});
		//时间控件
		$('#eventTime_div').datetimepicker({
	        language:  'zh-CN',
	        //weekStart: 1,
	        todayBtn:  true,
	        pickerPosition: "bottom-left",
			autoclose: 1,
			todayHighlight: 1,
			//startView: 2,
			//minView: 2,
			forceParse: 0,
			format: 'yyyy-mm-dd hh:ii'
    	});
		$("div[id^='customer_birthday_div_']").datetimepicker({
	        language:  'zh-CN',
	        //weekStart: 1,
	        todayBtn:  true,
	        pickerPosition: "bottom-left",
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format: 'yyyy-mm-dd'
    	});    	
    	
    	
    	// 如果department有初始值，初始化人员选择列表
    	var defaultDept = $('#assigned_department').combotree('getValue');
    	if (defaultDept) {
    		var url = '${ctx}/account/api/search?departmentId=' + defaultDept;
			$('#case_owner').combobox('reload', url);
    	}
    	
    	$("#caseForm").validate({
    		rules: {
    			title:{
						rangelength: [1,64],
						required: true
				},
				eventTime:{
						required: true
				},	
				guestNum: {
						required: true,
						rangelength: [1,5],
						digits: true 			
				},
				description:{
						rangelength: [1,1024]
				}					
			},
			messages: {
				title:{
					required: "请填写案例名称！"	
				},
				eventTime:{
					required: "请选择举行时间"
				},
				guestNum: {
					required: "请填写到访人数！",
					digits: "请输入数字！"
				},
				description:{
					rangelength: $.validator.format("请输入面试小于1024个字符.")
				}
			}
		});
	});
	
	function mySubmit() {
	console.log('in mySubmit');
	var number=1;
	var quests=document.getElementsByName("quest");      
    var questnum=quests.length;
    for(var i=0;i<questnum;i++){                        
   	 	var questid=quests[i].getAttribute("value");  
    	var options=document.getElementsByName(questid);    
    	var optionnum=options.length;
    	var flag=0;
    	for(var j=0;j<optionnum;j++){                   
       		if(options[j].checked){
    		flag=1;
    		break;
     		}
    	}
    	if(flag==0){
    		 number=0;
    		}
    	}
    	
     if(!number)
        $("#warning-block1").show();
     else{
        $("#warning-block1").hide();
     	$('#caseForm').submit();
     }
	}
	
	function addSpaces(result) {
		console.log("in callback function");
		console.log(result);
		console.log(result.space[0].holders.holder_name);
		$('#' + result.parameters.showid).val(result.space[0].holders.holder_name + ' - ' + result.space[0].space_name);
		$('#' + result.parameters.target).val(result.space[0].id);
			
	}
	
	function generateCharacterListHtmlCode(myindex) {
		var mytemp = '<input name="statkeholders[{index}].character.id" id="customer_character_{index}" class="span4 easyui-combotree"/>';
		var parameter = {};
		parameter.index=myindex;
		return nano(mytemp,parameter);
	}
	
	function addCharacter() {
		var mytemp = $('#myCharacterTemplate').html();
		var parameter = {};
		myCharacterIndex++;
		parameter.index=myCharacterIndex;
		parameter.characterList=generateCharacterListHtmlCode(myCharacterIndex);
		var myvalue = nano(mytemp,parameter);
		$('#caseContentDetailDiv').append(myvalue);
		$("#customer_birthday_div_" + myCharacterIndex).datetimepicker({
	        language:  'zh-CN',
	        //weekStart: 1,
	        todayBtn:  true,
	        pickerPosition: "bottom-left",
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0,
			format: 'yyyy-mm-dd'
    	}); 
    	//var url = '${ctx}/category/api/getChildren/getCharacterType';
    	//console.log('-------------');
    	//console.log($('#customer_character_' + myindex));
		//$('#customer_character_' + myindex).combobox('reload', url);
    	
		$('#customer_character_' + myCharacterIndex).combotree({		
			url:'${ctx}/category/api/getChildren/getCharacterType',
			required: false,
			valueField: 'id',
			textField: 'text',
			method:'get'
		});
		
	}
</script>



</head>

<body>
	<form id="caseForm" class="form" style="padding:20px;" action="${ctx}/case/save" method="post">
		<h1>需求管理：新增</h1>
		<div class="row">
			<div class="span">
				<div class="form-search" style="padding-left:20px;">
					<label for="case_title">概要：</label> 
					<input type="text" class="input-xxlarge" name="title" id="case_title" value="${mycase.title}">
					<input type="hidden" name="id" value="${mycase.id}">

				</div>
			</div>
								<div class="pull-right">
										<input id="case_status"
				class="span2 easyui-combotree" name="status.id"
				data-options="url:'${ctx}/category/api/getChildren/getCaseStatus',method:'get',required:false" value="1-0-8-1" readonly="readonly">
					</div>
		</div>

		<div style="padding: 20px;">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#caseDetail" data-toggle="tab">详细</a></li>
					<li><a href="#paper" data-toggle="tab">调查问卷</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="caseDetail">
						 <%@ include file="caseContentDetail.jsp"%>
					</div>
					<div class="tab-pane" id="paper">
						<%@ include file="casePaper.jsp"%>
					</div>					
				</div>
			</div>
		</div>
		<div class="form-actions">
			<input id="save_btn" class="btn" type="submit" value="保存"/>
		</div>
	</form>
	<a name="myBottom"></a>
	
	<!-- character 模板 开始 -->
<div style="display:none" id="myCharacterTemplate">	
<div class="accordion-group">
		<div class="accordion-heading">

				<a class="accordion-toggle" data-toggle="collapse"
				href="#stakeholders_{index}">新增
			</a> 

		</div>
		<div id="stakeholders_{index}" class="accordion-body collapse in">
			<div class="accordion-inner">
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_character_{index}">身份：</label>
						<div class="controls" id="characterListDiv">{characterList}</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_name_{index}">姓名：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[{index}].customer.customerName" id="customer_name_{index}" value="" placeholder="姓名">
							<input type="hidden" name="statkeholders[{index}].customer.id"  value="">
						</div>
					</div>
				</div>			
					
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_job_{index}">工作：</label>
						<div class="controls">
							<input name="statkeholders[{index}].customer.job" id="customer_job_{index}" type="text"
								class="span4" value="">
						</div>
					</div>
					<div class="control-group pull-right">
						<label class="control-label" for="customer_birthday_{index}">生日：</label>
						<div class="pull-right">
							<div id="customer_birthday_div_{index}" class="input-append date form_date">
								<input size="16" type="text" name="statkeholders[{index}].customer.birthday" id="customer_birthday_{index}"
									style="width: 302px"
									value="" readonly> <span class="add-on">
									<i class="icon-remove"></i></span> <span class="add-on"><i
									class="icon-th"></i></span>
							</div>
						</div>
					</div>					

				</div>
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_weixin_{index}">微信：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[{index}].customer.weixin" id="customer_weixin_{index}" placeholder="微信" value="">
						</div>
					</div>				
					<div class="control-group pull-right">
						<label class="control-label" for="customer_phone_{index}">电话：</label>
						<div class="pull-right">
							<input type="text" class="span4" name="statkeholders[{index}].customer.customerPhone" id="customer_phone_{index}" placeholder="电话" value="">
						</div>
					</div>					

				</div>				
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_weibo_{index}">微博：</label>
						<div class="controls">
							<input name="statkeholders[{index}].customer.weibo" id="customer_weibo_{index}" type="text" placeholder="微博地址"
								class="span4" value="">
						</div>
					</div>
					<div class="control-group span pull-right">
						<label class="control-label" for="customer_qq_{index}">QQ：</label>
						<div class="controls">
							<input name="statkeholders[{index}].customer.qq" id="customer_qq_{index}" type="text" placeholder="QQ"
								class="span4" value="">
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="control-group span pull-left">
						<label class="control-label" for="customer_favorite_{index}">爱好：</label>
						<div class="controls">
								<textarea rows="3" class="span4" id="customer_favorite_{index}" name="statkeholders[{index}].customer.favorite" maxlength="128"></textarea>
						</div>
					</div>
					<div class="control-group span pull-right">
						<label class="control-label" for="customer_description_{index}">备注：</label>
						<div class="controls">
							<textarea rows="3" class="span4" id="customer_description_{index}" name="statkeholders[{index}].description" maxlength="128"></textarea>								
						</div>
					</div>
				</div>					
			</div>
		</div>
	</div>
</div>		
<!-- character 模板 结束-->
<%@ include file="../components/spacePopupWindow.jsp"%>
</body>
</html>
