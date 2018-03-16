<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>${book.title}</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" ></script>
</script>
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
	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

	<section class="features1 cid-qKKGw9Wto7" id="features11-0" data-rv-view="40">
		<div class="container">
			<div class="col-md-12">
				<!-- 邊框 -->
				<div class="media-container-row">
					<div class="mbr-figure" style="width: 40%;">
						<!-- 圖 ../assets/images/05.jpg-->
						<!-- ${pageContext.request.contextPath}el方法 下面是寫程式的方法-->
						<img src="<%=request.getContextPath()%>/bookimg.controller?bookId=${book.bookId}" alt="" title=""
							media-simple="true">
						<div class="media-container-row">
							<!-- 分享按鍵 -->
							<div class="mbr-social-likes" data-counters="false">
								<span class="btn btn-social facebook mx-1"
									title="Share link on Facebook"> <i
									class="socicon socicon-facebook"></i>
								</span> <span class="btn btn-social twitter mx-1"
									title="Share link on Twitter"> <i
									class="socicon socicon-twitter"></i>
								</span> <span class="btn btn-social plusone mx-1"
									title="Share link on Google+"> <i
									class="socicon socicon-googleplus"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="align-left aside-content">
						<h2 class="mbr-title pt-4 mbr-fonts-style display-6">
							${book.title}</h2>
						<div class="mbr-section-text">
							<p class="mbr-text mb-3 pt-3 mbr-light mbr-fonts-style display-4">
								${book.content}</p>
							<p class="block-text mbr-fonts-style display-8">
								作者:${book.author}<br> 出版社:${book.press}<br>
								價錢:${book.price}元
							</p>
						</div>
						<!-- 按鍵 -->
						<div class="block-content">
							<div class="card p-1 pr-2">
								<div class="media">
									<div class=" align-self-center card-img pb-3">
										<!-- 愛心 -->
										<a id="love">
										 <span class="mbr-iconfont mbri-hearth"
											style="color: rgb(255, 51, 102); font-size: 60px;"
											media-simple="true"></span></a>
										<!-- 購物車 --> 
										<span	id="buybookbtn"
												class="mbr-iconfont mbri-cart-add "
												style="color: rgb(20, 157, 204); font-size: 60px;cursor: pointer;"
												media-simple="true"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</section>

	<!-- 購物車Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">購物車內容</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<!--modal內容 -->
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
	          			<TD align="center" ><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount }" pattern="#,###" />元</TD>
	          			<TD align="center" >
	                		<Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" name="qty" onkeypress="return isNumberKey(event)"  />
	          			</TD>
	          			<TD style="text-align:right;"><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}" pattern="#,###,###" />元</TD>
	          			<TD ><Input type="button" name="update" value="修改" onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
	               			<Input type="button" name="delete" value="刪除" onClick="confirmDelete(${anEntry.key},${vs.index})"></TD>
	        			</TR>
	     			</c:forEach>
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


	<script src="${pageContext.request.contextPath}/assets/tether/tether.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/web/assets/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/popper/popper.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/assets/smooth-scroll/smooth-scroll.js"></script>
	<script src="${pageContext.request.contextPath}/assets/social-likes/social-likes.js"></script>
	<script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>
<script>
$(document).ready(function(){
	$('#love').on('click', function(){
		//alert('onclick is working.');
	    miniReport();//Your function 
	});
	

	function  miniReport(){
		 //alert('123');
		 //寫入收藏的書號與會員帳號
		 $.get("${pageContext.request.contextPath}/InsertCollection.controller?memID=2&bookId=${book.bookId}",function(date) {
			 if(date!=null) {
				 alert('已加入我的收藏');
			 }else {
				 alert('親~已加過了!');
			}
			 ;
		})
	}

	$("#buybookbtn").click(function() {
		$.get('ShoppingCartItemAddServlet', {
			'bookId' : '${book.bookId}',
			'title' : '${book.title}',
			'price' : '${book.price}',
			'stock' : '${book.stock}'
		}, function(data) {
			//data就是Server回傳的結果
			$('#shoppingAmount').html(data);
		})

	})
	
});

//購物車相關
function confirmDelete(n,index) {
	
	if (confirm("確定刪除此項商品 ? ") ) {
		$.get('UpdateItem.do', {'cmd':'DEL','async':'ajax','bookID': n }, function (data) {
			var x = "#newQty" + index;
 			$(x).parent().parent().remove();
		})
				
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