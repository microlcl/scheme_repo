<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>进店管理</title>
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$("#visit-tab").addClass("active");
			
			var visitTypeId = ['${visitType}'];
			$("#cc1").combotree({ 
				onLoadSuccess:function(node){//数据加载成功触发 
					$("#cc1").combotree('setValues', visitTypeId);
				},
				onBeforeSelect:function(node){ 
					var tree = $(this).tree;
					var isLeaf = tree('isLeaf', node.target);
					console.log("isLeaf=" + isLeaf);
					return isLeaf;
				}
			
			});
			
			
			$('.form_date').datetimepicker({
		        language:  'zh-CN',
		        weekStart: 1,
		        todayBtn:  true,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format: 'yyyy-mm-dd HH:mm'
		    });
			
	        Date.prototype.format = function(format){ 
	        	var o = { 
	        	"M+" : this.getMonth()+1, //month 
	        	"d+" : this.getDate(), //day 
	        	"h+" : this.getHours(), //hour 
	        	"m+" : this.getMinutes(), //minute 
	        	"s+" : this.getSeconds(), //second 
	        	"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
	        	"S" : this.getMilliseconds() //millisecond 
	        	} ;

	        	if(/(y+)/.test(format)) { 
	        	format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	        	} 

	        	for(var k in o) { 
	        	if(new RegExp("("+ k +")").test(format)) { 
	        	format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
	        	} 
	        	} 
	        	return format; 
	        };
	        
	        var myDate = new Date();
			var datetime = myDate.format("yyyy-MM-dd hh:mm");
			//console.log(myDate.toLocaleString());
			$("#visitTime").val(datetime.toLocaleString());
			
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					caseTitle: {
						rangelength: [1,64]
					},
					visitNumber: {
						rangelength: [1,5],
						digits:true
					},
					customerName: {
						rangelength: [2,8]
					},
					comment: {
						rangelength: [2,256]
					},
					guestNumber: {
						rangelength: [1,5],
						digits:true
					},
					spaceTip: {
						rangelength: [2,256]
					},
					isVisited: {
                        required: function (element) {
                            return $("input:radio[name='isVisited']:checked").val() != "";
                        }
                    }
				},
				messages: {
					caseTitle: {
						required: "请填写案例名称！"
					},
					visitNumber: {
						required: "请填写到访人数！",
						digits: "请输入数字！"
					},
					customerName: {
						required: "请正确填写客户姓名（xx先生或者xx女士亦可）！"
					},
					comment: {
						required: "请输入访问备注!"
					},
					guestNumber: {
						required: "请填写案例人数！",
						digits: "请输入数字！"
					},
					spaceTip: {
						required: "请输入会场简介!"
					},
					isVisited: {
                        required: "请选择是否初次到访!"
                    }
				},
				errorElement: "span",
	//			success: function () {
                    //正确时的样式
    //                label.text(" ").removeClass("error");
    //              label.text("ss ").addClass("success");
    //        },
				errorPlacement: function (error, element) {
	                if(element.is(":radio")||element.is(":checkbox"))
                 	   error.appendTo(element.parent().parent());   
	                else
	                	error.insertAfter(element); 
               
        	    }
			});
		});
		
		function submitForm(){
//			console.log("测试" + $("#customerVisitTime").val() + $("#customerEventTime").val() + $("input[name='visitTypeId']").val() + $("input[name='businessTypeId']").val());
//			if (($("#customerVisitTime").val() != "") && ($("#customerEventTime").val() != "") && ($("input[name='visitTypeId']").val() != "") && ($("input[name='businessTypeId']").val() != "")) {
//				console.log("In form submit");
				$('#inputForm').submit();
//			}else if (($("#customerVisitTime").val() == "") || ($("#customerEventTime").val() == "")){
//				$("#warning-block1").show();
//				return;
//			}else if (($("input[name='visitTypeId']").val() == "") || ($("input[name='businessTypeId']").val() == "")){
//				$("#warning-block2").show();
//				return;
//			}else {
//				console.log("判断条件不正确");
//			}
		}
      
        
	</script>
	<style>
		.control-label {
		    float: left;
		    padding-top: 5px;
		    text-align: left;
		    width: 100px;
		}
		.controls {
		    margin-left: 100px;
		}
		.accordion-inner {
			background-color: #FFFFFF;
		}
	</style>
</head>
<body>
	<form id="inputForm" action="${ctx}/visit/save" method="post">
		<div class="form">
			<input type="hidden" name="isVisited" id="sex" value="T" >
			<input type="hidden" name="visitType.id" value="1-0-4-1">
			<h1>增加回访记录</h1>
			<div class="alert hide" id="warning-block1">
		  	   <strong>注意! </strong>请确保您已选择<strong>到访时间</strong>和<strong>案例时间 </strong>。
			</div>
			<div class="alert hide" id="warning-block2">
		  	   <strong>注意! </strong>请确保您已选择<strong>访问类别</strong>和<strong>策划类别</strong>。
			</div>
						
			
			<div class="accordion-group" style="margin:20px;">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						href="#visit_details">		
							回访细节：
					</a>
				</div>
				<div id="visit_details" class="accordion-body collapse">
					<div class="accordion-inner">
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="visitTime">回访时间：</label>
								<div class="pull-left">
									<div class="input-append date form_date">
					                	<input size="16" type="text" id="visitTime" name="visitTime" style="width:200px" readonly>
					                    <span class="add-on"><i class="icon-remove"></i></span>
										<span class="add-on"><i class="icon-th"></i></span>
			              		 	</div>
								</div>
							</div>		
						</div>	
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="comment">跟单者：</label>
								<div class="pull-left">
									<input name="operator" id="operator" class="easyui-combobox"
				data-options="url:'${ctx}/account/api/search?departmentId=D1',method:'get',valueField:'id',textField:'name'" style="width:270px;"/>
								</div>
							</div>				
						</div>		
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="comment">客户姓名：</label>
								<div class="pull-left">
									<input type="text" id="customerName" class="required" name="customer.customerName" style="width:255px" class="input-large " maxlength="64" placeholder="客户姓名，xx先生/xx女士亦可"/>
								</div>
							</div>				
						</div>	
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="comment">相关问题调查：</label>
								<div class="pull-left">
									<input id="visitPaper" class="easyui-combobox" name="paper.id" data-options="url:'${ctx}/paper/api/search?businessType=${businessTypeId}',method:'get',valueField:'id',textField:'paperName'" style="width:270px;" />								
								</div>
							</div>				
						</div>							
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="comment">回访备注：</label>
								<div class="pull-left">
									<textarea id="comment" name="comment"   maxlength="256" class="input-large  span4"></textarea>
								</div>
							</div>				
						</div>	
			
					</div>
				</div>
			</div>	            
						
			            
			<div class="accordion-group" style="margin:20px;">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						href="#case_details">		
							案例资料：
					</a>
				</div>
				<div id="case_details" class="accordion-body collapse">
					<div class="accordion-inner">
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="caseTitle">案例名称：</label>
								<div class="controls">
									<input type="text" class="required" id="caseTitle" name="caseTitle"  style="width:270px"  value="${thisCase.title}" readonly>
									<input type="hidden" value="${thisCase.id}" name="caseId">
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="businessType">策划类别：</label>
								<div class="pull-left">
									<input id="cc" name="businessType.id" class="easyui-combotree" value="${businessTypeId}" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false" style="width:200px;" disabled/>
								</div>
							</div>
						</div>			
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customerEventTime">案例时间：</label>
								<div class="pull-left">
									<div class="input-append date form_date">
					                	<input size="16" type="text" name="eventTime" id="event_time" value="<fmt:formatDate value='${thisCase.eventTime}' pattern='yyyy-MM-dd HH:mm'/>" style="width:217px" readonly>
					                    <span class="add-on"><i class="icon-remove"></i></span>
										<span class="add-on"><i class="icon-th"></i></span>
			              		 	</div>
								</div>
							</div>				
							<div class="control-group span5 pull-right">
								<label class="control-label" for="guestNumber">客人人数：</label>
								<div class="pull-left">
									<input type="text" id="guestNumber" class="required span4" name="guestNum" value="${thisCase.guestNum}"  class="input-large " maxlength="20" style="width:187px" placeholder="请输入客人人数" />
								</div>
							</div>					
		
						</div>				
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="spaceTip">会场简介：</label>
								<div class="controls">
									<textarea id="spaceTip" name="spaceTip"   maxlength="256" class="input-large  span4">${thisCase.spaceTip}</textarea>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>	            


			<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;padding-left: 180px;">
				<input id="submit_btn" class="btn btn-warning" type="button" value="提交" onclick="submitForm();"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
			
		</div>
	</form>
</body>
</html>