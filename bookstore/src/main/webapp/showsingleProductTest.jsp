<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css"
	rel="stylesheet">
	
<!-- 限制內容字數 css  -->
<%-- <link href="${pageContext.request.contextPath}/css/ellipsis.css" --%>
<!-- 	rel="stylesheet"> -->
	

</head>
<body>

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

   <div class="container" >
   		<div class="col-lg-10 offset-lg-2 ">
   			<br>
			<h3>購物車內物品數量:
				<span id="shoppingAmount">${ShoppingCart.itemNumber}</span>
			</h3>

			
			<br>
			<!--做一個查看購物車的畫面及功能 -->
			<A href="<c:url value='ShowCartContentTest.jsp' />" >查看購物車</A></TD>
		
			書籍ID:${bookBean.bookId}
			<br> 書籍名稱:${bookBean.title}
			<br> 價格:${bookBean.price}
			<br> 庫存:${bookBean.stock}
			<br> 作者:${bookBean.author}
			<br> 內容簡介:${bookBean.content}
			<br>
		
			<form action="<c:url value='BuyBook.do' />" method="get">
				<%-- <input type="hidden" name="bookId" value="${bookBean.bookId}"> --%>
				<%-- <input type="hidden" name="title" value="${bookBean.title}"> --%>
				<%-- <input type="hidden" name="price" value="${bookBean.price}"> --%>
				<%-- <input type="hidden" name="stock" value="${bookBean.stock}"> --%>
				<!-- <input type="hidden" name="author" value="隱藏欄位值"> -->
				<!-- <input type="hidden" name="content" value="隱藏欄位值"> -->
		
				<input type="button" id="buybookbtn" value="購買">
			</form>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#buybookbtn").click(function() {
				$.get('ShoppingCartItemAddServlet', {
					'bookId' : '${bookBean.bookId}',
					'title' : '${bookBean.title}',
					'price' : '${bookBean.price}',
					'stock' : '${bookBean.stock}'
				}, function(data) {
					//data就是Server回傳的結果
					$('#shoppingAmount').html(data);
				})

			})

			$("#checkShoppingCart").click(function() {
				$.get('ShoppingCartItemAddServlet', {
					'bookId' : '${bookBean.bookId}',
					'title' : '${bookBean.title}',
					'price' : '${bookBean.price}',
					'stock' : '${bookBean.stock}'
				}, function(data) {
					//data就是Server回傳的結果
					$('#shoppingAmount').html(data);
				})

			})
		})
	</script>
</body>
</html>