<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歐付寶測試及超商取貨API測試</title>
</head>
<body>
<form action="aioCheckOutOneTime" method="POST">
<%
// 編碼問題轉換
if(request.getParameter("stName")!=null && request.getParameter("stAddr")!=null &&
	request.getParameter("stTel")!=null){
byte[] binary = request.getParameter("stName").getBytes("ISO-8859-1");
byte[] binary1 = request.getParameter("stAddr").getBytes("ISO-8859-1");
byte[] binary2 = request.getParameter("stTel").getBytes("ISO-8859-1");
String stNameUTF8 = new String(binary, "UTF8");
String stAddrUTF8 = new String(binary1, "UTF8");
String stTelUTF8 = new String(binary2, "UTF8");
request.setAttribute("stNameUTF8", stNameUTF8);
request.setAttribute("stAddrUTF8", stAddrUTF8);
request.setAttribute("stTelUTF8", stTelUTF8);
}
%>
<input type="text" value="${stNameUTF8}"><label>商店名稱</label>

<input type="text" value="${stAddrUTF8}"><label>商店地址</label>

<input type="text" value="${stTelUTF8}"><label>商店電話</label>

<input type="submit" value="測試allpay">
</form>


</body>
</html>