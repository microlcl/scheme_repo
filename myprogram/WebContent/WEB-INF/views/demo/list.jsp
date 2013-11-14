<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Bootstrap Demo</title>

</head>

<body>
	<h1>Bootstrap Demo（2.3）</h1>
	<div class="container">
		<!-- table begin -->
		<table class="table table-hover">
			<caption>
				<h3>Table标题</h3>
			</caption>
			<thead class="success">
				<tr>
					<th>姓名</th>
					<th>年龄</th>
					<th>职业</th>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>张三</td>
					<td>25</td>
					<td>服务员</td>
					<td><a href="#"><i class="icon-pencil"></i> Edit</a></td>
				</tr>
				<tr class="success">
					<td>李四</td>
					<td>35</td>
					<td>总经理</td>
				</tr>
				<tr>
					<td>王五</td>
					<td>40</td>
					<td>董事长</td>
				</tr>
				<tr>
					<td>王五</td>
					<td>40</td>
					<td>董事长</td>
				</tr>
				<tr>
					<td>王五</td>
					<td>40</td>
					<td>董事长</td>
				</tr>
			</tbody>
		</table>
		<!-- table end -->

		<!-- form  begin-->

		<form>
			<fieldset>
				<legend>Form 演示</legend>
				<label>Label name</label> <input type="text"
					placeholder="Type something…"> <span class="help-block">Example
					block-level help text here.</span> <label class="checkbox"> <input
					type="checkbox"> Check me out
				</label>
				<button type="submit" class="btn">Submit</button>
			</fieldset>
		</form>
		<!-- form end -->
		
		<!-- 图标 -->
		    <div class="control-group">
    <label class="control-label" for="inputIcon">Email address</label>
    <div class="controls">
    <div class="input-prepend">
    <span class="add-on"><i class="icon-envelope"></i></span>
    <input class="span2" id="inputIcon" type="text">
    </div>
    </div>
    </div>
    <!-- 图标 end -->

		<!-- 下拉菜单 begin -->

		<!-- 下拉菜单 end-->

		<!-- 按钮组 begin -->
		<div class="btn-group">
			<button class="btn">Left</button>
			<button class="btn">Middle</button>
			<button class="btn">Right</button>
		</div>
		<!-- 按钮组 end -->
		<!-- bootstrap demo begin -->
		<a href="#myModal" role="button" class="btn" data-toggle="modal">模态对话框</a>

		<!-- Modal -->
		<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">Modal header</h3>
			</div>
			<div class="modal-body">
				<p>One fine body…</p>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
				<button class="btn btn-primary">Save changes</button>
			</div>
		</div>

		<!-- button radio -->
		<div class="btn-group" data-toggle="buttons-radio">
			<button type="button" class="btn btn-primary">Left</button>
			<button type="button" class="btn btn-primary">Middle</button>
			<button type="button" class="btn btn-primary">Right</button>
		</div>

		<!-- 折叠效果 begin-->
		<div class="accordion" id="accordion2">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseOne"> Collapsible
						Group Item #1 </a>
				</div>
				<div id="collapseOne" class="accordion-body collapse in">
					<div class="accordion-inner">Anim pariatur cliche...</div>
				</div>
			</div>
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#accordion2" href="#collapseTwo"> Collapsible
						Group Item #2 </a>
				</div>
				<div id="collapseTwo" class="accordion-body collapse">
					<div class="accordion-inner">Anim pariatur cliche...</div>
				</div>
			</div>
		</div>
		<!-- 折叠效果 end -->

		<!-- 轮播 begin-->
		<div id="myCarousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="active item">
					<img alt="hello"
						src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-01.jpg">
					<div>文字说明</div>
				</div>
				<div class="item">
					<div class="active item">
						<img alt="hello2"
							src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-02.jpg">
						<div>文字说明</div>
					</div>
				</div>
				<div class="item">
					<div class="active item">
						<img alt=""
							src="http://v2.bootcss.com/assets/img/bootstrap-mdo-sfmoma-03.jpg">
						<div>文字说明</div>
					</div>
				</div>
			</div>
			<!-- Carousel nav -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
		<!-- 轮播 end -->

		<div class="well">hello, world</div>

		<!-- bootstrap demo end -->
	</div>
</body>
</html>
