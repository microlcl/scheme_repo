<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet"
	href="${ctx}/static/plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css"
	type="text/css" />
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<!-- production -->
<script type="text/javascript"
	src="${ctx}/static/plupload/js/plupload.full.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plupload/js/i18n/zh_CN.js"></script>


<div class="row">
	<div class="span9">
		<div class="row">
			<div class="span7">
				<div id="uploader" class="control-group">
					<p>你的浏览器不支持 Flash, Silverlight or HTML5.</p>
				</div>
			</div>
			<div class="span2">
				<table id="subtable" class="table table-condensed">
					<tr class="success">
				<!-- 		<td >subscribers &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#myModal" data-toggle="modal" >Add...</a></td> -->
				<td >subscribers &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" onclick="userPopupWindow({callback:addUser})">Add...</a></td>
					</tr>
					<tr class="success">
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h3 id="myModalLabel">选择用户</h3>
	</div>
	<div class="modal-body">
		<label>部&nbsp;&nbsp;&nbsp;门：</label> <input name="search_department_id" id="mydepartment_id1" class="easyui-combotree"  data-options="url:'${ctx}/department/api/get',method:'get',required:false">
		<label>拥有者：</label> <input name="sub_id" id="myaccount_id1"  class="easyui-combobox" data-options="method:'get',valueField:'id',textField:'name'"> 
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true" onclick="addsub()">添加</button>
	</div>
</div>

<div class="row" style="margin:0px;">
		
</div>
<!--user 选择模态对话框 -->
	<%@ include file="../components/userPopupWindow.jsp"%>
<script type="text/javascript">
		// Initialize the widget when the DOM is ready
			var count = 0;
		function addUser(result){
			//获取原来的id
			var oldIDs=new Array();//去掉重复前的所有id
			var j=0;
			//获取原来的id
			if(jQuery("input[name^='subUsers']").length!=0){
				jQuery("input[name^='subUsers']").each(function(){
					oldIDs[j]=jQuery(this).val();
					j++;
				});
			}
			//获取新加的用户id
			for(var i=0;i<result.length;i++){
				var temp = result[i].value;
				var id=temp.substring(0,temp.indexOf(":"));
				//var name=temp.substring(temp.indexOf(":")+1);
				oldIDs[j]=id;
				j++;
			}
			var IDs = unique(oldIDs);//去掉重复后的所有id
			var htmlcontent='<tr class="success"><td >subscribers &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" onclick="userPopupWindow({callback:addUser})">Add...</a></td></tr>';
			for(var m=0;m<IDs.length;m++){
				htmlcontent+='<tr class="success"><td>'+IDs[m]+'</td></tr><input type="hidden" name="subUsers['+m+']" value="'+IDs[m]+'"><input type="hidden" name="username['+m+']" value="'+IDs[m]+'">';
			}
			var tableHolder = $('#subtable');
			//tableHolder.append('<tr class="success"><td>'+name+'</td></tr><input type="hidden" name="subUsers['+count+']" value="'+id+'">');
			tableHolder.html(htmlcontent);
		}
		//去掉重复的数组元素
		function unique(data){
			data = data || [];
			var a = {};
			for (var i=0; i<data.length; i++) {
			var v = data[i];
			if (typeof(a[v]) == 'undefined'){
			a[v] = 1;
			}
			};
			data.length=0;
			for (var i in a){
			data[data.length] = i;
			}
			return data;
		} 
		$(function() {
			$("#uploader").plupload({
				// General settings
				runtimes : 'html5,flash,silverlight,html4',
				url : '${ctx}/task/upload',

				// User can upload no more then 20 files in one go (sets multiple_queues to false)
				max_file_count : 20,

				chunk_size : '10mb',

				// Resize images on clientside if we can
				/**
				resize : {
					width : 200, 
					height : 200, 
					quality : 90,
					crop: true // crop to exact dimensions
				},
				 **/

				filters : {
					// Maximum file size
					max_file_size : '1000mb',
					// Specify what files to browse for
					mime_types : [ {
						title : "Image files",
						extensions : "jpg,gif,png,txt,doc"
					}, {
						title : "Zip files",
						extensions : "zip"
					},{
						title: "Audio",
						extensions : "mp3"
					} ]
				},

				// Rename files by clicking on their titles
				rename : true,

				// Sort files
				sortable : true,

				// Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
				dragdrop : true,

				// Views to activate
				views : {
					list : true,
					thumbs : true, // Show thumbs
					active : 'thumbs'
				},

				// Flash settings
				flash_swf_url : '${ctx}/static/plupload/js/Moxie.swf',

				// Silverlight settings
				silverlight_xap_url : '${ctx}/static/plupload/js/Moxie.xap'
			});
			
			$('#myModal').modal(options);
			
			
			$('#uploader').on('complete', function() {
						$('#form')[0].submit();
					});

		});
		
	</script>