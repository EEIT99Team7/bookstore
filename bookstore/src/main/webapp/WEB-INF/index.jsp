<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>社群書店</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" ></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/bootstrap-material-design-font/css/material.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
	<!-- 選定特效 -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/et-line-font-plugin/style.css">
		
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" >
	
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/animate.css/animate.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/theme2/css/style.css">
	<!-- 選擇欄位-->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/mobirise-gallery/style.css">	
<!-- 	<link rel="stylesheet" -->
<%-- 		href="${pageContext.request.contextPath}/css/shop-homepage.css"> --%>
<style>

$('.carousel').carousel({
  interval: 1000
})

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

	<!--廣告區塊 -->
    <!-- /.col-lg-8 -->
    <div class="col-lg-8 offset-lg-2 ">
		<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
			  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			  <!--使用foreach在廣告圖下方產生小白槓 -->
			  <!--透過FrontpageServlet設定參數adcounts，取得廣告圖數量 -->
              <c:forEach var="i" begin="1" end="${adcounts-1}" varStatus="stVar">
              	<li data-target="#carouselExampleIndicators" data-slide-to="${i}"></li>
              </c:forEach>
            </ol>
			<!-- 設置要顯示的廣告圖 -->
            <div class="carousel-inner" role="listbox">
              <c:forEach var="adverBean" items="${adver_FPS}" varStatus="stVar">
            	<c:choose>
            		<c:when test="${stVar.index==0}">
            			<div class="carousel-item active">
            			<img class="d-block img-fluid"  src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" >
            			</div>
            		</c:when>
            		<c:otherwise>
            			<div class="carousel-item">
                		<img class="d-block img-fluid"  src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" >
              			</div>
            		</c:otherwise>
            	</c:choose>
              </c:forEach>
            </div>
			<!-- 廣告圖左右箭頭 -->
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
    </div><!-- /.col-lg-8 -->
	<!-- 廣告圖區塊結束-->

	<section class="mbr-gallery mbr-section mbr-section-nopadding mbr-slider-carousel" data-filter="true" id="gallery4-0" data-rv-view="0" style="background-color: rgb(255, 255, 255); padding-top: 0rem; padding-bottom: 0rem;">	
		<!-- Filter -->
		<div class="mbr-gallery-filter container gallery-filter-active">
			<ul>
				<li class="mbr-gallery-filter-all active">All</li>	
			</ul>
		</div>
		<!-- Gallery -->
		<div class="mbr-gallery-row container">
			<div class=" mbr-gallery-layout-default">
				<div >
					<div id=show>
				       <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="語言電腦"/></div>
				           
						<!--<div> -->
		
					   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="各國旅遊"></div>	
							 
					   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="人文小說"></div>
							
					   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"data-tags="大眾心理"></div>
						
						<!--</div> -->
						<div class="clearfix"></div>
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
	<script src="${pageContext.request.contextPath}/bootstrap4/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- 變化動態 -->
	<script
		src="${pageContext.request.contextPath}/assets/masonry/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/smooth-scroll/smooth-scroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/theme2/js/jquery.touchSwipe.min.js"></script>		
	<script
		src="${pageContext.request.contextPath}/assets/theme2/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/mobirise-gallery/player.min.js"></script>
	<!-- 選擇欄位 -->
	<script src="${pageContext.request.contextPath}/assets/mobirise-gallery/script.js"></script>

	<!-- 排序 -->
	<script src="${pageContext.request.contextPath}/assets/imagesloaded/imagesloaded.pkgd.min.js"></script>

<script>
$(document).ready(function() {
	myDiv = document.getElementById("show");
	while(myDiv.hasChildNodes()){
		myDiv.removeChild(myDiv.lastChild);
				}
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=2",function(data) {
		//console.log(data);
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","各國旅遊");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","1");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=1",function(data) {
		//console.log(data);
	
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","語言電腦");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","2");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=3",function(data) {
		//console.log(data);
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","人文小說");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","3");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=4",function(data) {
		//console.log(data);
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","大眾心理");
                    eleDiv2.setAttribute("data-toggle","modal");
                    //eleDiv2.setAttribute("data-slide-to","4");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})

// 購物車相關
function checkCartItem(){
	
	
}

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