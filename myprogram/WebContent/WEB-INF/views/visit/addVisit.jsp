<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
			
			$("#cc1").combotree({ 
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
				format: 'yyyy-mm-dd'
		    });
		});

	</script>

</head>
<body>
	<div class="form">
		<form action="${ctx}/visit/save" method="post">
			<h1>增加到访记录</h1>
			<div id="inputForm" style="padding:20px;">
				<div class="control-group">
					<span class="formlabel span2 control-label">案例名称：</span>
					<input type="text" id="caseTitle" name="caseTitle" style="width:186px" class="input-large " maxlength="64"/>
				</div>		
			
				<div class="control-group">
					<span class="formlabel span2 control-label">访问类别：</span>
					<input id="cc1" class="easyui-combotree" data-options="url:'${ctx}/category/api/getAll/M1-10',method:'get',required:false" style="width:200px;" name="visitTypeId"/>
				</div>
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">访问人数：</span>
					<input type="text" id="visitNumber" name="visitNumber" style="width:186px" class="input-large " maxlength="20"/>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">访问时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id=customerVisitTime name="customerVisitTime" style="width:132px" readonly>
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
						<label class="radio inline">
							<input type="radio" name="isVisited" id="sex" value="F" >是
						</label>
						<label class="radio inline">
							<input type="radio" name="isVisited" id="sex" value="T" >否
						</label>
					</div>
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">客户名字：</span>
					<input type="text" id="customerName" name="customerName" style="width:186px" class="input-large " maxlength="64"/>
				</div>		
				
	           	<div class="control-group">
					<span class="formlabel span2 control-label">到访备注：</span>
					<input type="text" id="comment" name="comment" style="width:186px" class="input-large " maxlength="64"/>
				</div>
				
				<div class="control-group">	
					<span class="formlabel span2 control-label">案例时间：</span>
					<div class="input-append date form_date">
	                	<input size="16" type="text" id="customerEventTime" name="customerEventTime" style="width:132px" readonly>
	                    <span class="add-on"><i class="icon-remove"></i></span>
						<span class="add-on"><i class="icon-th"></i></span>
	               </div>
	            </div>
	            
	           	<div class="control-group">
					<span class="formlabel span2 control-label">客人人数：</span>
					<input type="text" id="guestNumber" name="guestNumber" style="width:186px" class="input-large " maxlength="20"/>
				</div>
				
				<div class="control-group">
					<span class="formlabel span2 control-label">会场简介：</span>
					<input type="text" id="spaceTip" name="spaceTip" style="width:186px" class="input-large " maxlength="64"/>
				</div>
	            
			</div>
			<div class="form-actions" style="min-height: 23px;margin-top: 0 !important;padding-left: 180px;">
				<input id="submit_btn" class="btn btn-warning" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</form>
	</div>
</body>
</html>