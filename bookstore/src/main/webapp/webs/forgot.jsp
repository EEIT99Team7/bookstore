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
<title>忘記密碼</title>
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
<!-- 顯示邊界 調整DIV用 -->
<style>
#legend{
	margin: 1rem auto 1rem;
	text-align:center;
}
fieldset {
	max-width: 500px;
	border: 3px solid gray;
	margin: auto;
	border-radius: 20px;
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
#loadingImg {
	display:none;
}
</style>

</head>
<body>
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<span id ="">${msgOK.QueryOK}</span>
	<div class="container">
		<div id='content'>
			<Form action="<c:url value='forgot.controller' />" method="post"
				name="forgotForm" onsubmit="load()">
				<h4 id="legend">忘記密碼</h4>
				<fieldset>

					<div class="block">
						<label for="name">電子信箱：</label><input type="text" name="email"
							autofocus placeholder="請輸入email" /><span class="warning"
							id="nValidate">${ErrorMsgKey.EmailEmptyError}${ErrorMsgKey.EmailNotFoundError}</span><br />
					</div>
					</hr>
					<div class="sub">
						<input type="submit" class="btn btn-success" value="查詢" id="submitquery" />
						<img height='32px' width='32px' src="${pageContext.request.contextPath}/images/loading.gif" id="loadingImg">
					</div>
				</fieldset>
				<legend align="center"></legend>
			</Form>
		</div>
	</div>
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- Bootstrap core JavaScript -->

	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
	var loadingImg = document.getElementById("loadingImg")
	function load(){
		this.submitquery.disabled=true
		loadingImg.style.display="inline";
	}
	</script>
</body>
</html>