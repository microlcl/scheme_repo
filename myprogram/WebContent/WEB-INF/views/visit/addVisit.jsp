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
			
			$("#cc2").combotree({ 
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
			console.log("测试");
			if (($("#customerVisitTime").val() != "") && ($("#customerEventTime").val() != "") && ($("input[name='visitTypeId']").val() != "") && ($("input[name='businessTypeId']").val() != "")) {
				console.log("In form submit");
				$('#inputForm').submit();
			}else if (($("#customerVisitTime").val() == "") || ($("#customerEventTime").val() == "")){
				$("#warning-block1").show();
				return;
			}else if (($("input[name='visitTypeId']").val() == "") || ($("input[name='businessTypeId']").val() == "")){
				$("#warning-block2").show();
				return;
			}else {
				console.log("判断条件不正确");
			}
		}
      
        function addCase(result){
           var temp = result.cases[0].title;           
		   $("#caseTitle").val(temp);

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
			<input type="hidden" name="isVisited" id="sex" value="F" >
			<h1>增加初次到访记录</h1>
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
							访问细节：
					</a>
				</div>
				<div id="visit_details" class="accordion-body collapse">
					<div class="accordion-inner">
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="cc1">访问类别：</label>
								<div class="controls">
									<input id="cc1" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-10',method:'get',required:false" style="width:370px;" name="visitTypeId"/>
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="visitNumber">到访人数：</label>
								<div class="pull-left">
									<input type="text" class="required span4" id="visitNumber" name="visitNumber" class="input-large " maxlength="20" placeholder="请输入到访人数"/>
								</div>
							</div>
						</div>			
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customerVisitTime">访问时间：</label>
								<div class="pull-left">
									<div class="input-append date form_date">
					                	<input size="16" type="text" id="customerVisitTime" name="customerVisitTime" style="width:302px" readonly>
					                    <span class="add-on"><i class="icon-remove"></i></span>
										<span class="add-on"><i class="icon-th"></i></span>
			              		 	</div>
								</div>
							</div>				
							<div class="control-group span5 pull-right">
								<label class="control-label" for="comment">到访备注：</label>
								<div class="controls">
									<textarea id="comment" name="comment"   maxlength="256" class="input-large  span4">${thisCase.comment}</textarea>
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
									<input name="caseTitle" id="caseTitle" type="text"
										class="span4" >
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="cc2">策划类别：</label>
								<div class="pull-left">
									<input id="cc2" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false" style="width:370px;" name="businessTypeId"/>
								</div>
							</div>
						</div>			
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customerEventTime">案例时间：</label>
								<div class="pull-left">
									<div class="input-append date form_date">
					                	<input size="16" type="text" id="customerEventTime" name="customerEventTime" style="width:302px" readonly>
					                    <span class="add-on"><i class="icon-remove"></i></span>
										<span class="add-on"><i class="icon-th"></i></span>
			              		 	</div>
								</div>
							</div>				
							<div class="control-group span5 pull-right">
								<label class="control-label" for="guestNumber">客人人数：</label>
								<div class="pull-left">
									<input type="text" id="guestNumber" class="required span4" name="guestNumber" value="${thisCase.guestNum}"  class="input-large " maxlength="20" placeholder="请输入客人人数"/>
								</div>
							</div>					
		
						</div>				
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customer_weibo">会场简介：</label>
								<div class="controls">
									<textarea id="spaceTip" name="spaceTip"   maxlength="256" class="input-large  span4">${thisCase.spaceTip}</textarea>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>	            
		
		
		
			<div class="accordion-group" style="margin:20px;">
				<div class="accordion-heading">
		
						<a class="accordion-toggle" data-toggle="collapse"
						href="#customer_details">				
							到访客户资料：
					</a> 
		
				</div>
				<div id="customer_details" class="accordion-body collapse">
					<div class="accordion-inner">
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customer_job">工作：</label>
								<div class="controls">
									<input name="customer.job" id="customer_job" type="text"
										class="span4" value="${customer.job}">
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="customer_name">姓名：</label>
								<div class="pull-left">
									<input type="text" class="span4" name="customer.customerName" id="customer_name" value="${customer.customerName}" placeholder="姓名">
								</div>
							</div>
						</div>			
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customer_weixi">微信：</label>
								<div class="pull-left">
									<input type="text" class="span4" name="customer.weixin" id="customer_weixin" placeholder="微信" value="${customer.weixin}">
								</div>
							</div>				
							<div class="control-group span5 pull-right">
								<label class="control-label" for="customer_phone">电话：</label>
								<div class="pull-left">
									<input type="text" class="span4" name="customer.customerPhone" id="customer_phone" placeholder="电话" value="${customer.customerPhone}">
								</div>
							</div>					
		
						</div>				
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customer_weibo">微博：</label>
								<div class="controls">
									<input name="customer.weibo" id="customer_weibo" type="text" placeholder="微博地址"
										class="span4" value="${customer.weibo}">
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="customer_qq">QQ：</label>
								<div class="controls">
									<input name="customer.qq" id="customer_qq" type="text" placeholder="QQ"
										class="span4" value="${customer.qq}">
								</div>
							</div>
						</div>	
						<div class="row">
							<div class="control-group span5 pull-left">
								<label class="control-label" for="customer_favorite">爱好：</label>
								<div class="controls">
										<textarea rows="3" class="span4" id="customer_favorite" name="customer.favorite" maxlength="128">${customer.favorite}</textarea>
								</div>
							</div>
							<div class="control-group span5 pull-right">
								<label class="control-label" for="customer_description">备注：</label>
								<div class="controls">
									<textarea rows="3" class="span4" id="customer_description" name="customer.description" maxlength="128">${customer.description}</textarea>								
								</div>
							</div>
						</div>					
					</div>
				</div>
			</div>




	            
	            
			<%@ include file="../components/casePopupWindow.jsp"%>
			<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;padding-left: 180px;">
				<input id="submit_btn" class="btn btn-warning" type="button" value="提交" onclick="submitForm();"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
			
		</div>
	</form>
</body>
</html>