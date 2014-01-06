<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>场地管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/holder/css/holder.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/bootstrap/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/mytree.css">
	<script src="${ctx}/static/easyui/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>

</head>

<body>
<form id="holdersForm" action="${ctx}/holders/doUpdate" method="post" class="form-horizontal" class="form-inline">
		<div class="form">
			<h1>会场信息</h1>
			<div class="control-group">
				<label for="holders_name" class="control-label formlabel">场地名称：</label>
				<div class="controls">
					<input type="text" id="holders_name" name="holders_name" value="${infoSpace.holders.holder_name}" class="input-large" maxlength="64" readonly/>
				</div>
			</div>	
			<div class="control-group">
				<label for="address" class="control-label formlabel">场地地址：</label>
				<div class="controls">
					<input type="text" id="address" name="address" value="${infoSpace.holders.address}" class="input-large required" maxlength="64" readonly />
				</div>
			</div>	
			<div class="control-group">
				<label for="address" class="control-label formlabel">星级：</label>
				<div class="controls">
					<c:if test="${infoSpace.holders.level == '1'}">
						<p  alt="一星级" title="一星级" class="h_xj1"/>
					 </c:if>
					<c:if test="${infoSpace.holders.level == '2'}">
						<p  alt="二星级" title="二星级" class="h_xj2"/>
					</c:if>
					<c:if test="${infoSpace.holders.level == '3'}">
						<p  alt="三星级" title="三星级" class="h_xj3"/>
					</c:if>
					<c:if test="${infoSpace.holders.level == '4'}">
						<p  alt="四星级" title="四星级" class="h_xj4"/>
						</c:if>
					<c:if test="${infoSpace.holders.level == '5'}">
						<p   alt="五星级" title="五星级" class="h_xj5"/>
					</c:if>
				</div>
			</div>	
			<div class="control-group">
				<label for="contact" class="control-label formlabel">联系人名称：</label>
				<div class="controls">
					<input type="text" id="contact" name="contact" value="${infoSpace.holders.contact}"  class="input-large" maxlength="64" readonly/>
				</div>
			</div>	
			<div class="control-group">
				<label for="phone" class="control-label formlabel">联系电话：</label>
				<div class="controls">
					<input type="text" id="phone" name="phone" value="${infoSpace.holders.phone}"  class="input-large" maxlength="64" readonly/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label formlabel">场地描述：</label>
				<div class="controls" >
					<textarea  id="description" name="description"  class="input-large" maxlength="256" readonly >${infoSpace.holders.description}</textarea>
				</div>
			</div>
		<table id="tableholders">
			<tr>
				<td>
					<table>
							<tr>
								<td align='center' width='100'>
								</td>
								<td>
									会场名称：<input type="text"  name="spaces.space_name" value="${infoSpace.space_name}" class="input-medium required" maxlength="32" readonly/>
								</td>
								<td align='right'>
									会场所在楼层：<input type="text"  name="spaces.floor" value="${infoSpace.floor}" class="input-small" maxlength="3" readonly/>
								</td>
								<td align='right'>
									容纳人数：<input type="text"  name="spaces.volume" value="${infoSpace.volume}" class="input-small" maxlength="5" readonly/>
								</td>
								<td align='right' style="width:250px;">
									楼层空间高度：<input type="text"  name="spaces.hall_height" value="${infoSpace.hall_height}" class="input-small" maxlength="2" readonly/>
								</td>
							</tr>
							<tr>
								<td align='center' width='100'>
									&nbsp;
								</td>
								<td>
									&nbsp;舞&nbsp;台&nbsp;长：&nbsp;<input type="text"  name="spaces.stage_length" value="${infoSpace.stage_length}" class="input-small" maxlength="5" readonly/>
								</td>
								<td align='right'>
									舞台宽：<input type="text"  name="spaces.stage_width" value="${infoSpace.stage_width}" class="input-small" maxlength="5" readonly/>
								</td>
								<td align='right'>
									舞台高：<input type="text"  name="spaces.stage_height" value="${infoSpace.stage_height}" class="input-small" maxlength="2" readonly/>
								</td>
								<td align='right'>
								&nbsp;
								</td>
							</tr>
							<tr>
								<td align='center' width='100'>
									&nbsp;
								</td>
								<td>
									场地特色:
								</td>
								<td colspan="2">
									<table>
									<tr>
										<c:forEach items="${categorys}" var="category" varStatus="varStatus">
										<td>
										<input type="checkbox" readonly name="spaces[${status.index}].spaceAttributes[${varStatus.index}].attribute_id" value="${category.id}" width="20" <c:forEach items="${infoSpace.spaceAttributes}" var="spaceAttribute"><c:if test="${category.id==spaceAttribute.attribute_id}" >checked</c:if></c:forEach> >${category.name}
										&nbsp;
										<c:if test="${(varStatus.index+1)%6==0}" > </td></tr></c:if>
										</td>
										</c:forEach>
									</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align='center' width='100'>
									&nbsp;
								</td>
								<td colspan="3">
									描述:<textarea  name="spaces.description" class="input-large" maxlength="256" style="width: 100%" readonly>${infoSpace.description}</textarea>
								</td>
							</tr>
						</table>
				</td>
			</tr>
			</table>
			<div class="form-actions">
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
			
		</div>
	</form>
</body>
</html>
					
	