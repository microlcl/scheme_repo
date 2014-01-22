<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://com.eastteam.myprogram/mytaglib" prefix="mytag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
			var visitTypeId = ['${visit.visitType.id}'];
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
			var businessTypeId = ['${visit.businessType.id}'];
			$("#cc2").combotree({ 
				onLoadSuccess:function(node){//数据加载成功触发 
					$("#cc2").combotree('setValues', businessTypeId);
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
			alert("还没有实现写库");
			return;
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

	</script>

</head>
<body>
	<div class="form">
		<form id="inputForm" action="${ctx}/visit/save" method="post">
			<h1>修改到访记录</h1>
			<div class="alert hide" id="warning-block1">
		  	   <strong>注意! </strong>请确保您已选择<strong>到访时间</strong>和<strong>案例时间 </strong>。
			</div>
			<div class="alert hide" id="warning-block2">
		  	   <strong>注意! </strong>请确保您已选择<strong>访问类别</strong>和<strong>策划类别</strong>。
			</div>
			<div style="padding:20px;">
				<div class="control-group">
					<span class="formlabel span2 control-label">案例名称：</span>
					<input type="text" class="required" id="caseTitle" name="caseTitle" value="${visit.thisCase.title}" style="width:186px" class="input-large " maxlength="64" placeholder="请输入案例名称"/>
				</div>		
			
				<div class="control-group">
					<span class="formlabel span2 control-label">访问类别：</span>
					<input id="cc1" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-10',method:'get',required:false" style="width:200px;" name="visitTypeId"/>
				</div>
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">到访人数：</span>
					<input type="text" class="required" id="visitNumber" name="visitNumber" value="${visit.visitNum}" style="width:186px" class="input-large " maxlength="20" placeholder="请输入到访人数"/>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">到访时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id=customerVisitTime name="customerVisitTime" value="<fmt:formatDate value='${visit.visitTime}' pattern='yyyy-MM-dd HH:mm'/>" style="width:132px" readonly>
	                    <span class="add-on"><i class="icon-remove"></i></span>
						<span class="add-on"><i class="icon-th"></i></span>
	               </div>
	            </div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">策划类别：</span>
					<input id="cc2" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/getBusinessType',method:'get',required:false" style="width:200px;" name="businessTypeId"/>
				</div>
		
				<div class="control-group">
					<span class="formlabel span2 control-label">是否初次到访：</span>
					<div class="controls">
						<c:if test="${visit.isVisited == 'F'}">
							<label class="radio inline">
								<input type="radio" name="isVisited" id="sex" value="F" checked="checked">是
							</label>
							<label class="radio inline">
								<input type="radio" name="isVisited" id="sex" value="T" >否
							</label>
						</c:if>
						<c:if test="${visit.isVisited == 'T'}">
							<label class="radio inline">
								<input type="radio" name="isVisited" id="sex" value="F" >是
							</label>
							<label class="radio inline">
								<input type="radio" name="isVisited" id="sex" value="T" checked="checked">否
							</label>
						</c:if>
					</div>
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">客户名字：</span>
					<input type="text" id="customerName" class="required" name="customerName" value="${visit.customer.customerName}" style="width:186px" class="input-large " maxlength="64" placeholder="客户姓名，xx先生/xx女士亦可"/>
				</div>		
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">到访备注：</span>
					<textarea id="comment" name="comment" style="width:186px" maxlength="256" class="input-large">${visit.comment}</textarea>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">案例时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id="customerEventTime" name="customerEventTime" value="<fmt:formatDate value='${visit.thisCase.eventTime}' pattern='yyyy-MM-dd HH:mm'/>" style="width:132px" readonly>
	                    <span class="add-on"><i class="icon-remove"></i></span>
						<span class="add-on"><i class="icon-th"></i></span>
	               </div>
	            </div>
	            
	           	<div class="control-group">
					<span class="formlabel span2 control-label">客人人数：</span>
					<input type="text" id="guestNumber" class="required" name="guestNumber" value="${visit.thisCase.guestNum}" style="width:186px" class="input-large " maxlength="20" placeholder="请输入客人人数"/>
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">会场简介：</span>
					<textarea id="spaceTip" name="spaceTip"  style="width:186px" maxlength="256"  class="input-large">${visit.thisCase.spaceTip}</textarea>
				</div>
	            
			</div>
			<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;padding-left: 180px;">
				<input id="submit_btn" class="btn btn-warning" type="button" value="提交" onclick="submitForm();"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</form>
	</div>
</body>
</html>