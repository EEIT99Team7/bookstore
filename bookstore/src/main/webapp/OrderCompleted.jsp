<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="_04_ShoppingCart.model.*,_04_ShoppingCart.model.dao.*, org.springframework.web.context.support.WebApplicationContextUtils, org.springframework.web.context.WebApplicationContext" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${empty LoginOK}">
	<c:redirect url="/webs/login.jsp" />
</c:if>
<%
  WebApplicationContext ctx = WebApplicationContextUtils
  			.getWebApplicationContext(getServletContext());
  OrderQueryDaoImpl obdao = ctx.getBean(OrderQueryDaoImpl.class);
  pageContext.setAttribute("orderBeans", obdao);

%>
<jsp:useBean id="orderBeans" class="_04_ShoppingCart.model.dao.OrderQueryDaoImpl"
	scope="page" />
<title>訂單列表</title>

<!-- 使用 購物車icon-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/bootstrap4/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

<style>
.mysearchcss{
	height:50px;
	padding-right:10px;
}
.btn-outline-success{
	padding:10px;
	padding-left:30px;
	padding-right:30px
}

.my-cart-icon{
 	position: fixed;
   	z-index: 999;
 
}
.badge-notify{
    background:red;
   	position:relative;
   	top: -25px;
   	right:15px;
 	z-index: 1;
}
th{
text-align:center;
}
</style>
</head>
<body>

 	<!-- 引用共同導覽列 -->       
	<jsp:include page="/webs/nav/top.jsp" />
	
	<br>
	<br>
    <div class="container">
    <br><br><br><br><br>
    	<div class="col-md-6  offset-md-4" id="test1">
			<img height="200" width="200" src="${pageContext.request.contextPath}/images/loading.gif">
			<span style="font-size:55px;">訂單處理中...</span>
		</div>
	</div>


<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>

// 	$("#test1").html('<img height="200" width="200" src="${pageContext.request.contextPath}/images/2000px-Yes_Check_Circle.svg.png">')
	setTimeout(function(){$("#test1").html('<img height="200" width="200" src="${pageContext.request.contextPath}/images/2000px-Yes_Check_Circle.svg.png"><span style="font-size:55px;">${memberId}訂單完成.</span>')},2000);

</script> 
</body>
</html>