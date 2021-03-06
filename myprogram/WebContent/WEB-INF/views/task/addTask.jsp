<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>任务管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/styles/form.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/easyui/mytree.css">
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/easyui/jquery.easyui.min.js"
	type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#taskForm").validate({
	     	rules: {
					summary: {
						required : true
					}
				},
				messages: {
					summary: {
						required: "请填写任务名称！"
					}
				},
			errorPlacement: function (error, element) {
            	error.appendTo(element.parent());    //将错误信息添加当前元素的父结点后面 
    		}
		});
		
		$('#mydepartment_id1').combotree({
			onChange : function(node) {
				var url = '${ctx}/account/api/search?departmentId=' + node;
				$('#myaccount_id1').combobox('reload', url);
			}
		});
	});
	
        function addCase(result){
           var title = result.cases[0].title; 
           var id =  result.cases[0].id;        
		   $("#caseTitle").val(title);
		   $("#caseid").val(id);

        }
     	function submitForm(){
			console.log("测试");
   		 	var beginTime =$('#createdTimestamp').val(); 
    		var endTime =  $('#finishTime').val();  
   			var beginTimes = beginTime.substring(0, 10).split('-');  
    		var endTimes = endTime.substring(0, 10).split('-');  
  
    		beginTime = beginTimes[1] + '/' + beginTimes[2] + '/' + beginTimes[0]+ beginTime.substring(10, 19);  
    		endTime = endTimes[1] + '/' + endTimes[2] + '/' + endTimes[0]+ endTime.substring(10, 16)+":00";   
  

		    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
			if (($("#finishTime").val() == "")){
				$("#warning-block2").hide();
				$("#warning-block1").show();
				return;
			}else if(a < 0){
			    $("#warning-block2").show();
			    $("#warning-block1").hide();
			    return;
			}else {
				$('#taskForm').submit();
				console.log("判断条件不正确");
			}
		}
	//var count = 0;
	
//	function addsub(){
//		var userID = $('#myaccount_id1').combobox('getValue');  
//		var userName = $('#myaccount_id1').combobox('getText');
//		$('#myModal').modal('hide');
//		var tableHolder = $('#subtable');
//		tableHolder.append('<tr class="success"><td>'+userName+'</td></tr><input type="hidden" name="subUsers['+count+']" value="'+userID+'">');
//		count++;
//	}
	</script>
</head>

<body>
	<div class="form">
		<h1>增加任务</h1>
		<div class="alert hide" id="warning-block1">
		  	   <strong>注意! </strong> 请确保您已选择 <strong> 计划完成时间 </strong>。
		</div>
		<div class="alert hide" id="warning-block2">
		  	   <strong>注意! </strong> 请确保您已选择 <strong> 计划完成时间 大于 创建时间 </strong>。
		</div>
		<form id="taskForm" action="${ctx}/task/save" method="post" class="form-horizontal" >
		<div >
		<p style="padding-left:24px;"> 
		摘要：<input type="text" id="summary" name="summary"   maxlength="256" style="width: 60%" class="required"/>
		</p>
		</div>
		<div style="padding: 20px;">
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#detail" data-toggle="tab">任务详细信息</a></li>
					<li><a href="#other" data-toggle="tab">附属内容</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="detail">
						 <%@ include file="detail.jsp"%>
					</div>
					<div class="tab-pane" id="other">
						<%@ include file="other.jsp"%>
					</div>
								
				</div>
			</div>
		</div>
		
	</form>
	</div>
	<%@ include file="../components/casePopupWindow.jsp"%>
</body>
</html>
