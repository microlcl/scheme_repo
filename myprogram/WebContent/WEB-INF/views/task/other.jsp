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
				<table class="table table-condensed">
					<tr class="success">
						<td>subscribers &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add...</td>
					</tr>
					<tr class="success">
						<td>yangbin</td>
					</tr>
					<tr class="success">
						<td>libo</td>
					</tr>
					<tr class="success">
						<td>zhangyang</td>
					</tr>
					<tr class="success">
						<td>yidequan</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="row" style="margin:0px;">
		
</div>

<script type="text/javascript">
		// Initialize the widget when the DOM is ready
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
			
			$('#uploader').on('complete', function() {
						$('#form')[0].submit();
					});

		});
	</script>