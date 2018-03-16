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
<meta name="google-signin-client_id"
	content="30136455505-9rt5nfgsvktopts10pc3eqff7ui86jq6.apps.googleusercontent.com">
<title>註冊成功</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

<style>
#legend {
	margin: 1rem auto 1rem;
	text-align: center;
}

.block {
	border-bottom: 1px solid black;
	margin: 20px;
	padding-bottom: 5px;
}

.warning {
	color: black;
	font-size: 12px;
	margin: 5px;
}

.sub {
	margin: 10px;
	max-width: 450px;
	text-align: center;
}
</style>


</head>
<body>

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

	<div class="container">

		<div class="row text-center">
			<div class="col-sm-6 offset-sm-3">
				<br> <br>
				<h2 style="color: #0fad00">歡迎您的加入</h2>
				<img height='80px' width='80px'
					src="${pageContext.request.contextPath}/images/2000px-Yes_Check_Circle.svg.png" />
				<h3>請完善您的會員資料</h3>
				<p style="font-size: 20px; color: #5C5C5C;"></br></p>
				
				<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-success"> &nbsp; &nbsp; 回首頁 &nbsp;
					&nbsp; </a> <br> <br>
			</div>

		</div>
	</div>

	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- Bootstrap core JavaScript -->

	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Google Login -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>

</body>
</html>