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

<!-- 使用 購物車icon-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">

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

.mysearchcss{
	height:50px;
}
.btn-outline-success{
	padding:10px;
	padding-left:30px;
	padding-right:30px
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

	  	<!-- 購物車Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog  modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">購物車內容</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<!--modal購物車彈跳視窗內容 -->
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">書籍圖片</th>
				      <th scope="col">書籍名稱</th>
				      <th scope="col">價格</th>
				      <th scope="col">數量</th>
				      <th scope="col">小計</th>
				    </tr>
				  </thead>
				  <tbody>
					<c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
	        			<TR height='16'>
	        			<TD align="center"><img src="${pageContext.request.contextPath}/bookimg.controller?bookId=${anEntry.value.bookID}" width="90" height="120"></TD>
	          			<TD align="center">${anEntry.value.title}</TD>
	          			<TD align="center" ><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount }" pattern="#,###" /></TD>
	          			<TD align="center" >
	                		<Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" name="qty" onkeypress="return isNumberKey(event)"  />
	          			</TD>
	          			<TD style="text-align:right;"><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}" pattern="#,###,###" /></TD>
	          			<TD ><Input type="button" class="btn btn-success" style="padding:10px" name="update" value="修改" onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
	               			<Input type="button" class="btn btn-danger" style="padding:10px;margin-left:0px;" name="delete" value="刪除" onClick="confirmDelete(${anEntry.key},${vs.index})"></TD>
	        			</TR>
	     			</c:forEach>
	     				<TR height='16'>
	     					<TD class="font-weight-bold" colspan="5" align="right">總計&nbsp&nbsp:&nbsp&nbsp<fmt:formatNumber value="${ShoppingCart.subtotal }" pattern="#,###,###" />元</TD>
	     				</TR>
				  </tbody>
				</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
	        <button type="button" class="btn btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/ShowCartContentTest.jsp'">結帳</button>
	      
	      </div>
	    </div>
	  </div>
	</div>	


	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Google Login -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>

</body>
</html>