<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>场地管理</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/styles/form.css">
	

</head>

<body>
	<div class="form">
		<h1>场地信息</h1>
		<div style="padding:20px;">
		<table class="table table-striped table-bordered table-condensed">
			<tbody>
				<tr>
					<td style="width:70px" class="formlabel">会场名字：</td>
					<td style="color:#A1A1A1">${infoSpace.space_name}</td>
				</tr>
				<tr>
					<td class="formlabel" >会场所在楼层：</td>
					<td style="color:#A1A1A1">${infoSpace.floor}</td>
				</tr>
				<tr>
					<td class="formlabel">容纳人数：</td>
					<td style="color:#A1A1A1">${infoSpace.volume}</td>
				</tr>
				<tr>
					<td class="formlabel">楼层空间高度：</td>
					<td style="color:#A1A1A1">${infoSpace.hall_height}</td>
				</tr>
				<tr>
					<td class="formlabel">舞台长：</td>
					<td style="color:#A1A1A1">${infoSpace.stage_length }</td>
				</tr>
				<tr>
					<td class="formlabel">舞台宽：</td>
					<td style="color:#A1A1A1">${infoSpace.stage_width}</td>
				</tr>
				<tr>
					<td class="formlabel">舞台高：</td>
					<td style="color:#A1A1A1">${infoSpace.stage_height}</td>
				</tr>
				<tr>
					<td class="formlabel">场地名称：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.holder_name}</td>
				</tr>
				<tr>
					<td class="formlabel">场地星级：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.level}</td>
			    </tr>
			    <tr>
					<td class="formlabel">场地联系人：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.contact}</td>
			    </tr>
			    <tr>
					<td class="formlabel">场地联系人电话：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.phone}</td>
			    </tr>
			    <tr>
					<td class="formlabel">场地地址：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.address}</td>
			    </tr>
			    <tr>
					<td class="formlabel">场地描述：</td>
					<td style="color:#A1A1A1">${infoSpace.holders.description}</td>
			    </tr>
			</tbody>
		</table>
		</div>
			<div class="form-actions">
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
   </div>

</body>
</html>
					
	