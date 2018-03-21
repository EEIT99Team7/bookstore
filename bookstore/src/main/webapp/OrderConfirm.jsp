<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			return true;
		} else {
			return false;
		}
	}
	function reconfirmOrder() {
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			return true;
		} else {
			return false;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean id="today" class="java.util.Date" scope="session" />
<title>訂單明細資訊確認</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css"
	type="text/css">

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

	<c:set var="funcName" value="CHE" scope="session" />

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<br><br><br><br>
	<div class="container" >
	<CENTER>
		<img alt="" src="${pageContext.request.contextPath}/images/time_line_step2_zh-tw.png">
		<FORM action="<c:url value='ProcessOrder.do' />" method="POST">
			<TABLE class="table" >
				<TR>

					<TD
						style="text-align: center; ">請確認下列訊息：</TD>

				</TR>
				<TR>

					<TD
						style="text-align: left;">購物車內容:</TD>
				</TR>

				<TR>
					<TD colspan='3'>

						<TABLE border='1'>

							<TR>
								<TH style="text-align: center; font-size: 12pt;" width="200">書籍圖片</TH>
								<TH style="text-align: center; font-size: 12pt;" width="350">書籍名稱</TH>
								<TH style="text-align: center; font-size: 12pt;" width="80">單價</TH>
								<TH style="text-align: center; font-size: 12pt;" width="60">數量</TH>
								<TH style="text-align: center; font-size: 12pt;" width="110">小計</TH>
							</TR>

							<c:forEach varStatus="vs" var="anEntry"
								items="${ShoppingCart.content}">

								<TR height='16'>
									<TD style="text-align: center; font-size: 11pt;">
										<img height="150" width="120" src="<%=request.getContextPath()%>/bookimg.controller?bookId=${anEntry.value.bookID}" alt="" title=""
										media-simple="true">
									</TD>
									<TD style="text-align: left; font-size: 11pt;">${anEntry.value.title}</TD>
									<TD style="text-align: right; font-size: 11pt;"><fmt:formatNumber
											value="${anEntry.value.price * anEntry.value.discount }"
											pattern="#,###" />元</TD>
									<TD style="text-align: right; font-size: 11pt;">
										${anEntry.value.qty}</TD>
									<TD style="text-align: right; font-size: 11pt;"><fmt:formatNumber
											value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}"
											pattern="#,###,###" />元</TD>
								</TR>
							</c:forEach>

							<TR height='16'>
								<TD style="text-align: right; font-size: 11pt;" colspan='4'>合計金額：</TD>
								<TD style="text-align: right; font-size: 11pt;"><fmt:formatNumber
										value="${ShoppingCart.subtotal}" pattern="#,###,###" />元</TD>

							</TR>

						</TABLE>

					</TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 11pt;">運送方式： <input
						type="radio" name="" id="productDelivery" value="" checked><label
						for="productDelivery">宅配</label>
					</TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 11pt;">付款方式：
						 <input type="radio" name="payment" id="paymentRadio1" value="超商取貨">
						 <label for="paymentRadio1">超商付款取貨</label> 
						 <input type="radio" name="payment" id="paymentRadio2" value="歐付寶">
						 <label for="paymentRadio2">信用卡付款</label>
						 <img height="50" width="70" src="${pageContext.request.contextPath}/images/allpay.jpg">
						 <span id="storechoicespan"></span>
					</TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">會員資料：</TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">姓名：<input
						type="text" class="form-control" name="memberName" id="memberName"
						placeholder="${LoginOK.userName}" readonly></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">地址：<input
						type="text" class="form-control" name="memberName" id="memberName"
						placeholder="${LoginOK.addr}" readonly></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">電話：<input
						type="text" class="form-control" name="memberName" id="memberName"
						placeholder="${LoginOK.phone}" readonly></TD>
				</TR>


				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">收件人資料：<input
						type="checkbox" id="checkReceiver">
					<sapn style="font-size:10px">同會員資料</sapn></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">姓名：<input
						type="text" class="form-control" name="receiverName" id="receiverName"
						value=""></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">地址：<input
						type="text" class="form-control" name="receiverAddress" id="receiverAddress"
						value=""></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">電話：<input
						type="text" class="form-control" name="receiverPhone" id="receiverPhone"
						value=""></TD>
				</TR>
								
				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">超商名稱：<input
						type="text" class="form-control" name="storeName" id="storeName"
						value="${stNameUTF8}"></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">超商地址：<input
						type="text" class="form-control" name="storeAddress" id="storeAddress"
						value="${stAddrUTF8}"></TD>
				</TR>

				<TR height='20'>
					<TD style="text-align: left; font-size: 15pt;">超商電話：<input
						type="text" class="form-control" name="storePhone" id="storePhone"
						value="${stTelUTF8}"></TD>
				</TR>
				

			</TABLE>
			<P />
			<INPUT  TYPE="hidden" name="finalDecision" value=""> 
			<INPUT class="btn btn-primary" TYPE="SUBMIT" name="OrderBtn" value="確定送出" onclick="return reconfirmOrder();"> 
			<INPUT class="btn btn-secondary" TYPE="SUBMIT" name="CancelBtn" value="取消訂單" onclick="return cancelOrder();">
		</FORM>
	</CENTER>
	
	</div>
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function() {
		
		function putMemToReceiver (){
			$("#receiverName").val("${LoginOK.userName}");
			$("#receiverAddress").val("${LoginOK.addr}");
			$("#receiverPhone").val("${LoginOK.phone}");
		}
		//當同會員資料鈕按下時，將會員資料帶入收件人資料中
		$("#checkReceiver").change(function(){
			if($(this).prop("checked")){
				putMemToReceiver();
			}else{
				$("#receiverName").val("");
				$("#receiverAddress").val("");
				$("#receiverPhone").val("");
			}
		
		}
		
		);
		//當超商取貨按下時，顯示選擇門市按鈕
		$("input[name='payment']").change(function(){
			console.log($(this).val());
			if($(this).val()=="超商取貨"){
			$("#storechoicespan").html($("<input class='btn btn-primary' value='選擇門市' type='button'>").click(function(){
				location.href="http://map.ezship.com.tw/ezship_map_web_2014.jsp?rtURL=http://localhost:8080/bookstore/OrderConfirm.jsp"}));
			}
			else{
			$("#storechoicespan").html("");	
				
			}
		})
		
		console.log($("#storeName").val());
		if($("#storeName").val()!=""){
			$("#paymentRadio1").attr("checked","checked");
			putMemToReceiver();
			
			$("#checkReceiver").attr("checked","checked");
		}
	
	})
	</script>
</body>
</html>