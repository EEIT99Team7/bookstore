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
<title>修改密碼</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/myaccount.css"
	rel="stylesheet">
<style>
#loadingImg {
	display: none;
}

.form-control {
	width: 50%;
}
</style>
</head>
<body>
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<!-- Page Content -->
	<div class="container">
		<span>${OkMsgKey.ChangeOK}</span>
		<div class="row">
			<!--左側方導覽列 -->
			<div class="col-lg-3">
				<h1 class="my-4">會員中心</h1>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/editprofile.jsp"
						class="list-group-item">修改會員資料</a>
				</div>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/changepassword.jsp"
						class="list-group-item active">修改密碼</a>
				</div>
				<c:if test="${LoginOK.userType =='member'}">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/customerservice.jsp"
						class="list-group-item">聯絡客服</a>
				</div>
				</c:if>
			</div>

			<!-- /.col-lg-9 頁面主內容-->
			<div class="col-lg-9">
				<Form action="<c:url value='changepassword.controller' />"
					method="post" id="changepswdForm">
					<h2>修改密碼</h2>
					<div class="form-horizontal rm-form form-profile">
						<div class="form-group">
							<label class="control-label col-sm-2" for="oldpswd">原本密碼</label>
							<div class="col-sm-10">
								<input type="password" name="oldpswd" placeholder="請輸入密碼"
									class="form-control"> <span>${ErrorMsgKey.erroroldpswdEmpty}${ErrorMsgKey.PWDNotCorrectError}</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="newpwsd">新密碼</label>
							<div class="col-sm-10">
								<input type="password" name=newpwsd placeholder="請輸入新密碼"
									class="form-control"> <span>${ErrorMsgKey.errornewpwsdEmpty}${ErrorMsgKey.errorPasswordDuplicate}${ErrorMsgKey.errorPasswordMatch}</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="newpwsd2">再次確認</label>
							<div class="col-sm-10">
								<input type="password" name="newpwsd2" placeholder="請再次輸入新密碼"
									class="form-control" size="10"> <span>${ErrorMsgKey.errornewpwsd2Empty}${ErrorMsgKey.errorPassword2Match}</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10 col-sm-push-2">
								<button class="btn btn-default btn-lg" type="reset">清除</button>
								<button class="btn btn-primary btn-lg" type="submit">修改</button>
							</div>
						</div>
					</div>
				</Form>
			</div>

			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />


	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>