<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>社群書店</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css"
	rel="stylesheet">
<!-- 限制內容字數 css  -->
<link href="${pageContext.request.contextPath}/css/ellipsis.css"
	rel="stylesheet">
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>
<body>

	<!-- 引用共同導覽列  -->
	<jsp:include page="/webs/nav/top.jsp" />

	<!-- Page Content    -->
	<div class="container">

		<div class="row">

			<!--左側方導覽列 -->
			<jsp:include page="/webs/nav/DBLeftNav.jsp" />

			<!-- /.col-lg-9 -->
			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<div class="row">
						<h2 class="col-lg-4">書評管理</h2>
					</div>
				</div>
				<form action="" id="contentForm" method="POST"
					enctype="multipart/form-data">
					<div id="contentDiv">
						<!-- table放置區 -->
						<table class="table" id="reviewTb">
							<thead>
								<tr>
									<th scope="col">書評ID</th>
									<th scope="col">書籍ID</th>
									<th scope="col">會員ID</th>
									<th scope="col">內容</th>
									<th scope="col">狀態</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reviewBean" items="${ReviewBeans}"
									varStatus="var">
									<tr>
										<th scope="row">${reviewBean.reviewId}</th>
										<td>${reviewBean.bookId}</td>
										<td>${reviewBean.memID}</td>
										<td>${reviewBean.content}</td>

										<td><select id="${reviewBean.reviewId}" name="sel">
												<c:choose>
													<c:when test="${reviewBean.statusNo}">
														<option value="1" selected="selected">顯示</option>
														<option value="0">隱藏</option>
													</c:when>
													<c:otherwise>
														<option value="1">顯示</option>
														<option value="0" selected="selected">隱藏</option>
													</c:otherwise>
												</c:choose>
										</select></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	<!-- /.container --> </footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>

		$("select[name='sel']").each(function() {
			$(this).change(function() {
				var reviewId = $(this).attr('id');
				var status = $(this).val();
				$.ajax({
					method : "GET",
					url : "reviewstatus.controller",
					data : {
						"status" : status,
						"reviewId" : reviewId
					}
				});
			});
		});
	</script>

</body>
</html>