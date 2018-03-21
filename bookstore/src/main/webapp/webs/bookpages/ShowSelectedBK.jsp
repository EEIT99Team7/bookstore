<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分類總覽</title>

<!-- 使用 購物車icon-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 自訂的css  -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/ellipsis.css" rel="stylesheet">

<!-- 套用此css會影響至bootstrap原先按鈕樣式及整體版面的些許字形 ex:大小、顏色、字體 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme2/css/style.css">

<style>	
	.mysearchcss{
		height:50px
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
	body {
 	 padding-top: 90px;
	}
</style>
</head>
<body>

	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

  	<div class="container" >
  	  <div>
  			<a href="${pageContext.request.contextPath}/index.jsp">首頁</a><span>/</span>
  			<a href="${pageContext.request.contextPath}/searchBook.controller?displayType=allbooks&category=0">分類總覽</a><span>/</span>
  			<c:if test="${not empty categoryBean}">
					<a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=${categoryBean.bookNo}">${categoryBean.c_name}</a>
			</c:if>
  	  </div>
	  <div class="row">
		<!--左方導覽列 -->
		<div class="col-lg-3">
			<h3 class="my-4">書籍分類</h3>
			<div class="list-group">
			  <a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=1" class="list-group-item">工具相關</a>
			  <a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=2" class="list-group-item">各國旅遊</a>
			  <a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=3" class="list-group-item">人文小說</a>
			  <a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=4" class="list-group-item">大眾心理</a>
			</div>
		</div>
		
		<div class="col-lg-9">
			<c:if test="${empty displayType}">
				<c:if test="${not empty bookBeans}">
					<h4>查詢關鍵字: ${bookName},  搜尋結果共 ${searchReasultNumber}筆</h4>
				</c:if>
			</c:if>
			<h4>${searchResult}</h4>
			<div class="row">
			<c:forEach var="bookBean" items="${bookBeans}">
		      <div class="col-lg-4 col-md-4 mb-4">
	              <div class="card h-100">
			<!-- 透過getImage?id=呼叫model.RetrieveImageServlet至資料庫抓圖片 -->
	                <a href="${pageContext.request.contextPath}/bookPages.controller?bookId=${bookBean.bookId}"><img class="card-img-top" src="${pageContext.request.contextPath}/getImage?id=${bookBean.bookId}&type=BOOK" alt="" height="200"></a>
	                <div class="card-body">
	                  <h5 class="card-title crop-text-4" style="height:100px;">
	                    <a href="${pageContext.request.contextPath}/bookPages.controller?bookId=${bookBean.bookId}">${bookBean.title}</a>
	                  </h5>
	                  <h5>售價:&nbsp;${bookBean.price}&nbsp;元</h5>
					  <div class="card-text crop-text-4 text-justify">${bookBean.content}</div>
	                </div>
	              </div>
	            </div>
		  
		  </c:forEach>
			</div>
		</div>	
	
	</div><!-- row -->
  </div><!-- container -->
  
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
  
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
//購物車相關
function checkCartItem(){
	
	
}
//刪除購物車中單項物品
function confirmDelete(n,index) {
	
	if (confirm("確定刪除此項商品 ? ") ) {
		$.get('UpdateItem.do', {'cmd':'DEL','async':'ajax','bookID': n }, function (data) {
			var x = "#newQty" + index;
 			$(x).parent().parent().remove();
		})
				
	} else {
	
	}
}
//修改購物車物品數量
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
		//透過async=ajax呼叫後端不更新頁面程式
		$.get('UpdateItem.do', {'cmd':'MOD','async':'ajax','bookID': key , 'newQty':newQty }, function (data) {
			document.getElementById(x).value = newQty;	
		})
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode<48||charCode>57)){
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