<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>无线巡更管理中心</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<base href="<%=basePath%>">

<!-- jQuery 3.1.1 -->
<script src="//cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/select2/4.0.3/css/select2.min.css">
<script src="//cdn.bootcss.com/select2/4.0.3/js/select2.min.js"></script>
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css">
<script
	src="//cdn.bootcss.com/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
<script
	src="//cdn.bootcss.com/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- Slimscroll -->
<script
	src="//cdn.bootcss.com/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<!-- Theme style -->
<link rel="stylesheet" href="static/dist/css/AdminLTE.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="static/dist/css/skins/_all-skins.min.css">

<style>
body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, "宋体", Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
	background: #eee;
}

.content-header>.breadcrumb {
	position: relative;
	margin-top: 5px;
	top: 0;
	right: 0;
	float: none;
	background: #d2d6de;
	padding-left: 10px;
}

.content-header>.breadcrumb li:before {
	color: #97a0b3;
}
</style>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<ol class="breadcrumb">
		<li><a href="main/showInfo"><i
				class="fa fa-dashboard"></i> 首页</a></li>
		<li>巡更管理</li>
		<li class="active">巡更记录</li>
	</ol>
	</section>

	<!-- Main content -->
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">任务列表</h3>

					<div class="box-tools">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="table_search"
								class="form-control pull-right" placeholder="Search">

							<div class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body table-responsive no-padding">
					<table class="table table-hover table-bordered text-center">
						<thead>
							<tr>
								<th>序号</th>
								<th>人员</th>
								<th>设备</th>
								<th>巡更地点</th>
								<th>巡更时段</th>
								<th>指派时间</th>
								<th>状态</th>
							</tr>
						</thead>
						<c:if test="${taskList != null }">
							<c:forEach var="task" items="${taskList }" varStatus="status">
								<tr>
									<td>${status.index+1 }</td>
									<td>${members[2*status.index] }<br>[${members[2*status.index+1] }]
									</td>
									<td>${devices[2*status.index] }<br>[${devices[2*status.index+1] }]
									</td>
									<td>${locations[2*status.index] }<br>[${locations[2*status.index+1] }]
									</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${task.startTime }"/> - <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${task.endTime }"/></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${task.addTime }"/></td>
									<td><c:if test="${task.nowStage == 1}">
											<span class="text-light-blue">待完成</span>
										</c:if> <c:if test="${task.nowStage == 2}">
											<span class="text-green">已完成</span>
										</c:if> <c:if test="${task.nowStage == 3}">
											<span class="text-yellow">未按时完成</span>
										</c:if> <c:if test="${task.nowStage == 4}">
											<span class="text-red">未完成</span>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${taskList == null }">
							<tr>
								<td colspan="7">无记录！</td>
							</tr>
						</c:if>
					</table>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix">
					<div class="pull-right">
						<nav aria-label="Page navigation">
						<ul class="pagination">${pageCode }
						</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
	</section>
	<!-- /.content -->

</body>
</html>