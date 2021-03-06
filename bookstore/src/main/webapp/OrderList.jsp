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
    <p/>
    <center>
    <div class="container">
    
    <h2>${LoginOK.nickName}的訂購紀錄</h2>
	<table class="table table-hover ">

		<tr height='40' class="table-info" >
			<th >訂單編號</th>
			<th width="100" >訂購日期</th>
			<th width="80" >總金額</th>
			<th width="400" >送貨地址</th>
		</tr>
		
		<jsp:setProperty name="orderBeans" property="memberId" value="${LoginOK.userName}"/>
		<c:forEach var="anOrderBean" varStatus="stat" 	items="${orderBeans.allOrders}">
				<c:if test="${anOrderBean.memberId==LoginOK.userName}">

						<TR height='30'>
							<TD width="86" align="center">
							    <a  href='<c:url value='orderDetail.do?memberId=${LoginOK.userName}&orderNo=${anOrderBean.orderNo}' />'>
							         ${anOrderBean.orderNo}
							    </a>
							  </TD>
<%-- 							<TD width="100" align="center">${anOrderBean.orderDateStr}</TD> --%>
							<TD width="100" align="center">${anOrderBean.orderDateStr}</TD>
							<TD width="80" align="center">${anOrderBean.totalAmountNoDp}</TD>
							<TD width="400" align="left">&nbsp;${anOrderBean.shippingAddress}</TD>
							<!--
							<%-- 
							<TD width="100" align="center"><input type="hidden"
								value="${anOrderBean.orderNo}" name="OrderNo"> <input
								type="hidden" value="${anOrderBean.totalAmount}"
								name="totalAmount"> <input type="hidden"
								value="${anOrderBean.orderDate}" name="orderDate"> <input
								type="submit" value="詳細資料"></TD>
								--%>
  						 -->
						</TR>
						
				</c:if>
		</c:forEach>
		<tr height='36'>
			<td align="center" colspan="4"><a href="<c:url value='index.jsp' />">回首頁</a></td>
		</tr>
	</TABLE>
	</div>
	</center>
	<!--
		<%-- 
		<c:forEach var="anOrderBean" varStatus="stat"
			items="${orderBeans.allOrders}">
			<c:choose>
				<c:when test="${ stat.count % 2 == 0 }">
					<c:set var="aColor" value="#556677" />
				</c:when>
				<c:otherwise>
					<c:set var="aColor" value="#AA0077" />
				</c:otherwise>
			</c:choose>
			<TR bgColor="${aColor}">
				<TD>${anOrderBean.orderNo}</TD>
				<TD>${anOrderBean.userId}</TD>
				<TD>${anOrderBean.totalAmount}</TD>
				<TD>${anOrderBean.orderDate}</TD>
			</TR>
		</c:forEach>
	</TABLE>
	--%>
	 -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	 
</body>
</html>