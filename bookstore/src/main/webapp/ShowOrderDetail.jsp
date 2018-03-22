<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/assets/web/assets/jquery/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

<c:if test="${empty LoginOK}">
	<c:redirect url="/_02_login/login.jsp" />
</c:if>
<title>個人訂單明細</title>
<style type="text/css">
#main {
	position: absolute;
	top: 110px;
	left: 210px;
}
</style>
</head>
<body>

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<div class="container">
	<br>
		<TABLE   class="table">
			<tr height='50'class="table-info" style="text-align:center;border-style: none;">
				<th align="center" colspan="7"><h3>${LoginOK.nickName}的訂單明細</h3></th>
			</tr>
			<tr height='36'class="table-info">
				<td colspan="7">
				<table border='0'>
					<tr>
						<td align="Left" width="400px">收件人姓名:${OrderBean.customer}</td>
						<td align="center" width="400px">收件人電話:${OrderBean.phone}</td>
						<td align="center" width="400px">取貨方式:${OrderBean.payment}</td>		
					</tr>
					<tr>
						<td align="Left" width="500px">收貨地址:${OrderBean.shippingAddress}</td>
						<td align="center" width="300px">訂購日期:${OrderBean.orderDateStr}</td>		
						<td align="center" width="400px">訂單編號:${OrderBean.orderNo}</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr height='36' class="table-info">
				<th width="300px" align="center">書籍圖片</th>
				<th width="1000px" align="center">書籍資訊</th>
				<th width="100px" align="center">單價</th>
				<th width="100px" align="center">數量</th>
				<th width="100px" align="center">總價</th>
			</tr>
			<c:set var="subtotal" value="0" />
			<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
				<c:choose>
					<c:when test="${ stat.count % 2 == 0 }">
						<c:set var="aColor" value="#E6FFA0" />
					</c:when>
					<c:otherwise>
						<c:set var="aColor" value="#EBFFEB" />
					</c:otherwise>
				</c:choose>
				<tr  height='30'>
					<td  align="center"><img height="150" width="100" src="<%=request.getContextPath()%>/bookimg.controller?bookId=${aBean.bookId}" alt="" title=""
							media-simple="true"></td>
					<td  align="left"><a href="${pageContext.request.contextPath}/bookPages.controller?bookId=${aBean.bookId}">${aBean.description}</a></td>
					<td  align="right">
						<fmt:formatNumber	
							value="${aBean.unitPrice}"
							pattern="#,###,###" />
					</td>
					<td  align="right">${aBean.quantity}&nbsp;</td>
					<td  align="right">					
						<fmt:formatNumber	
							value="${aBean.unitPrice*aBean.discount*aBean.quantity}"
							pattern="#,###,###" />元
						</td>
					<c:set var="subtotal" value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.quantity }" />
				</tr>
			</c:forEach>
		
			<tr height='40'>
				<TD width="450px" align="right" style="font-size:50px">總金額</TD>
				<TD width="450px" align="right" style="font-size:50px">
				<fmt:formatNumber value="${OrderBean.totalAmount}" pattern="#,###,###" />元</TD>
			</tr>
		</TABLE>

		<center>
		<a href="<c:url value='OrderList.jsp' />">回上一頁</a>&nbsp;&nbsp;<a href="<c:url value='index.jsp' />">回首頁</a>
		</center>
	</div>
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>



