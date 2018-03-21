<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
    
<%
response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server 
response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance 
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale" 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物清單</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
<style>
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

</style>
	
</head>
<body>
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<div class="container">
	
	<center>
<!-- 	sdfgdsg -->
	<br>
	<br>
	<img alt="" src="${pageContext.request.contextPath}/images/time_line_step1_zh-tw.png">
	<p/>
	<TABLE border='2' width="820" style="background:#EFEFFB;">
		<TR>
			<TD colspan='4'>
			<!--購物車的標題--> 
	   		<TABLE width="820">
	     		<TR height='18'><TD width="270">&nbsp;</TD><TD width="280" align='center'><FONT  size='+2'>購 物 清 單</FONT></TD><TD width="270" align='right'></TD></TR>
	   		</TABLE>
			</TD>
		</TR>
	
		<TR>
	   		<TD><font size='-1'> 
	   			<TABLE border='1'>
	     			<TR><TH width="100">商品圖</TH><TH width="280">商品名稱</TH><TH width="120">價格</TH><TH width="60">數量</TH><TH width="80">小計</TH><TH width="120">修改</TH></TR>
	     			<c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
	        			<TR height='16'>
	        			<TD align="center"><img src="${pageContext.request.contextPath}/bookimg.controller?bookId=${anEntry.value.bookID}" width="90" height="120"></TD>
	          			<TD align="center">${anEntry.value.title}</TD>
	          			<TD align="center" ><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount }" pattern="#,###" />元</TD>
	          			<TD align="center" >
	                		<Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" name="qty" onkeypress="return isNumberKey(event)"  />
	          			</TD>
	          			<TD style="text-align:right;"><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}" pattern="#,###,###" />元</TD>
	          			<TD ><Input type="button" class="btn btn-warning btn-sm"  name="update" value="修改" onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
	               			<Input type="button" class="btn btn-secondary  btn-sm" height="20" width="30" name="delete" value="刪除" onClick="confirmDelete(${anEntry.key})"></TD>
	        			</TR>
	     			</c:forEach>
	
	        		<TR>
	          			<TD colspan='5' align='right'>總計金額：</TD>
	          			<TD align='right'><fmt:formatNumber value="${ShoppingCart.subtotal }" pattern="#,###,###" />元</TD>
	          			<TD align='right'>&nbsp;</TD>          
	        		</TR>
	   			</TABLE>
	   		</font></TD>
		</TR>
		<TR height='80'>
	   		<TD > 
	     		<TABLE border='1'>
		        	<TR >
			          	<TD width="260" align='center'>
			              <A href="<c:url value='index.jsp' />">繼續購物</A>
			          	</TD>
			          	<TD width="260" align='center'>
			              <A href="<c:url value='checkout.do' />" onClick="return Checkout(${subtotal});">再次確認</A>
			          	</TD>
			          	<TD width="260" align='center'>
			              <A href="<c:url value='abort.do' />" onClick="return Abort();">放棄購物</A>
			          	</TD>
		        	</TR>
	     		</TABLE>
	   		</TD>
		</TR>
	</TABLE>
	<c:if test='${not empty OrderErrorMessage}'>
			<font color='red'>${OrderErrorMessage}</font>
			<c:remove var="OrderErrorMessage"/>	
	</c:if>
	</center>

	<form>
	   <input type="hidden" name="a"/>
	</form>
	
</div>	
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.mycart.js"></script> --%>
<script type="text/javascript">
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=DEL&bookID=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='UpdateItem.do?cmd=MOD&async=normal&bookID=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}
</script>	   
</body>
</html>