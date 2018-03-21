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
	<!-- 使用 icon-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css" type="text/css">
	
	<!-- 套用此css會影響至bootstrap原先按鈕樣式及整體版面的些許字形 ex:大小、顏色、字體-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme2/css/style.css">
	<!-- 選擇欄位-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise-gallery/style.css">	
	
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
.btn-outline-success{
	margin-left:0px
}
.mysearchcss{
	padding-right:3px;
}

.b1 {
	color: black;
	outline: none;
	box-shadow: none;
	border-radius: 10px;
	background-color: #FFFFFF;
}

.s1 {
	color: white;
	outline: none;
	box-shadow: none;
	border-radius: 10px;
	background-color: #0066FF;
}

</style>
	
</head>
<body>
	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

	<div class="features1 cid-qKKGw9Wto7" id="features11-0" data-rv-view="40">

		<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div>
		  			<a href="${pageContext.request.contextPath}/index.jsp">首頁</a><span>/</span>
		  			<a href="${pageContext.request.contextPath}/searchBook.controller?displayType=allbooks&category=0">分類總覽</a><span>/</span>
		  			<c:if test="${not empty book}">
							<a href="${pageContext.request.contextPath}/searchBook.controller?displayType=displayBycategory&category=${book.bookNo}">
							      <c:choose>
							         <c:when test = "${book.bookNo==1}">工具相關</c:when>
							         <c:when test = "${book.bookNo==2}">各國旅遊</c:when>
							         <c:when test = "${book.bookNo==3}">人文小說</c:when>
							      	 <c:when test = "${book.bookNo==4}">大眾心理</c:when>
							         <c:otherwise></c:otherwise>
      							</c:choose>								
							</a>
					</c:if>
  	  			</div>
			
			
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
						<h3 class="mbr-title pt-4 mbr-fonts-style display-6">
							${book.title}</h3>
						<div class="mbr-section-text">
							<p class="mbr-text mb-3 pt-3 mbr-light mbr-fonts-style display-8">
								${book.content}</p>
							<p class="block-text mbr-fonts-style display-8">
								作者:${book.author}<br> 出版社:${book.press}<br>
								售價:${book.price}元
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
			
				<!-- Review Begin -->
				<div class="card">
					<h5 class="card-header">Review</h5>
					<ul class="list-group list-group-flush">
	
						<c:if test="${not empty review}">
							<c:forEach var="row" items="${review}" varStatus="var">
								<li class="list-group-item">
									<div class="card-body user">
										<span class="user-photo"><img
											src="${pageContext.request.contextPath}/getImage?id=${row.memId}&type=MEMBER"
											width="50px"></span> <span class="user-name">${row.nickname}</span>
										發表於: <span class="review-time">${row.make}</span>
									</div>
									<div class="card-body content">
										<p class="card-text">${row.content}</p>
									</div>
									<div class="modal-footer">
										<span class="badge badge-pill badge-warning">${row.score} stars</span>
										<span class="badge badge-pill badge-primary">
										<span id="total${var.index}">${row.like}</span> likes</span>
										<span><button type="button" id="like${var.index}" class="b1" onclick="myFunction(${var.index})" value="${row.memlike}">
											  <span class="mbri-like"></span>
											  </button></span>
									</div>
								</li>
								<input type="hidden" id="review${var.index}"
									value="${row.reviewId}">
							</c:forEach>
						</c:if>
	
						<c:if test="${not empty errors}">
							<li class="list-group-item">
								<div class="card-body error">
									<p class="card-text">${errors.noreivew}</p>
									<p>
										<button type="button" class="btn btn-outline-success btn-block"
											name="insertp" value="Insert" onclick="insert()">新增書評</button>
									</p>
								</div>
							</li>
						</c:if>
	
					</ul>
				</div>				
			</div>
			<!-- 書櫃程式碼 -->
			<div class="col-md-3 border-top" style="padding-top:10px;">
			<c:if test="${not empty BookCollectors}">
				<div>在${fn:length(BookCollectors) }人的書櫃中</div>
				<c:forEach var="BookCollector" items="${BookCollectors}" varStatus="vstr">				
					<div>
					<a href="member.controller?memberID=${BookCollector.memId}">
						<img height='30px' width='30px' src='${pageContext.request.contextPath}/getImage?id=${BookCollector.memId}&type=MEMBER'>
					</a>
					<a href="member.controller?memberID=${BookCollector.memId}">${BookCollector.nickName}</a>
					</div>
				</c:forEach>
			</c:if>		
			<c:if test="${empty BookCollectors}">
				<div>在0人的書櫃中</div>
			</c:if>
			</div>
			
		</div><!--container-->
		</div><!-- row -->
	</div>

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
				  <tbody id="addToShoppingcart">
					<c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
	        			<TR height="16">
	        			<TD align="center"><img src="${pageContext.request.contextPath}/bookimg.controller?bookId=${anEntry.value.bookID}" width="90" height="120"></TD>
	         			<TD align="center">${anEntry.value.title}</TD>
	          			<TD align="center" ><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount }" pattern="#,###" /></TD>
	         			<TD align="center" >
	                		<Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" onkeypress="return isNumberKey(event)"  />
	          			</TD>	          			
	          			<TD style="text-align:;"><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}" pattern="#,###,###" /></TD>
	          			<TD style="display:none;">
	          				<Input id="hiddenQty${vs.index}" style="width:28px;text-align:right" name="hiddenqty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />"  />
	          			</TD>
	          			<TD ><Input type="button" class="btn btn-success" style="padding:10px" name="update" value="修改" onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
	               			<Input type="button" class="btn btn-danger" style="padding:10px;margin-left:12px" name="delete" value="刪除" onClick="confirmDelete(${anEntry.key},${vs.index})"></TD>
	        			</TR>
	     			</c:forEach>
	     				<TR height='16'>
	     					<TD class="font-weight-bold" id="subTotal" colspan="5" align="right">總計&nbsp&nbsp:&nbsp&nbsp<span><fmt:formatNumber value="${ShoppingCart.subtotal }" pattern="#,###,###" /></span>元</TD>
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
	    miniReport();//Your function 
	});
	
	
	//一進網頁就檢查，並更改like_btn狀態
	for(i = 0 ; i<20 ; i++){	
		var memlike = document.getElementById("like"+i);
		if(memlike!=null){
			var likevalue = memlike.value;
		}
		//	alert(likevalue	);
		if(likevalue == 1 &&memlike!=null){
			memlike.className = "s1";
		}
	}
	

	

	
	function  miniReport(){
		 //alert('123');
		 //寫入收藏的書號與會員帳號
		 $.get("${pageContext.request.contextPath}/InsertCollection.controller?memID=${LoginOK.memId}&bookId=${book.bookId}",function(date) {
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
			var temp = $('#shoppingAmount').text();
			var tempindex = ($('#addToShoppingcart tr').length)-1;
			$('#shoppingAmount').html(data);
			if(temp!=data){
				//首次新增購物車有bug
					$('#addToShoppingcart tr:last-child').prev().after('<TR height="16">'+'<TD align="center"><img src="${pageContext.request.contextPath}/bookimg.controller?bookId=${book.bookId}" width="90" height="120"></TD>'+
		          			'<TD align="center">${book.title}</TD><TD align="center" ><fmt:formatNumber value="${book.price * 1 }" pattern="#,###" /></TD>'+'<TD align="center" >'+
		                	'<Input id="newQty'+tempindex+'" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="1" />" name="qty" onkeypress="return isNumberKey(event)"  />'+
		          			'</TD><TD style="text-align:right;"><fmt:formatNumber value="${book.price}" pattern="#,###,###" /></TD>'+
		          			'<TD ><Input type="button" class="btn btn-success" style="padding:10px" name="update" value="修改" onClick="modify(${book.bookId}, 1, '+tempindex+')">'+
		               		'<Input type="button" class="btn btn-danger" style="padding:10px;margin-left:12px" name="delete" value="刪除" onClick="confirmDelete(${book.bookId},'+tempindex+')"></TD></TR>');										
			}

		})
		location.reload();
	})
	
});

function insert(){
	window.location.href="${pageContext.request.contextPath}/TurnReivew.controller?bookId=${book.bookId}";  
}


function myFunction(index) {
	var test = "${LoginOK.memId}";
	if(test!=""){
	var param = {};
	var temp="like"+index;
	var temp2="review"+index;
	var temp3="total"+index;
	var number = parseInt($("#"+temp3).html());
//		console.log("test");
//		console.log($("#"+temp).val());
	var t3=$("#"+temp).val();
	var t4=$("#"+temp2).val();
	$.ajax({
		method: "GET",
		url: "presslike.controller",
	    data: {"like":$("#"+temp).val(),"review":$("#"+temp2).val(),"memId":"${LoginOK.memId}"},
//		    dataType: 'string';
		success: function(data){
			$("#"+temp).val(data);
			if(t3==1){
				// 更改按鈕狀態
				$("#"+temp).removeClass('s1');
				$("#"+temp).addClass('b1');
				$("#"+temp3).html(number-1);
			}if(t3==0){
				// 更改按鈕狀態
				$("#"+temp).removeClass('b1');
				$("#"+temp).addClass('s1');
				$("#"+temp3).html(number+1);
			}
		}
	});	
	}
	}


//購物車相關
function confirmDelete(n,index) {
	
	if (confirm("確定刪除此項商品 ? ") ) {
		var x = "#newQty" + index;
		var tempprice = $(x).parent().next().text().replace(/,/g,"");
		console.log(tempprice);
		$.get('UpdateItem.do', {'cmd':'DEL','async':'ajax','bookID': n }, function (data) {
 			$(x).parent().parent().remove();			
 			var tempsubtotal = $("#subTotal span").text().replace(/,/g,"");
 			console.log(tempsubtotal);
 			$("#subTotal span").text("");
 			$("#subTotal span").text(new Intl.NumberFormat("en-US").format(tempsubtotal-tempprice));
			//更改右上角購物車顯示的物品數量
 			$('#shoppingAmount').text($('#shoppingAmount').text()-1);
		})
				
	} else {
	
	}
}
function modify(key,nothing, index) {
	var x = "newQty" + index;
	var x1 = "#newQty" + index;
	var newQty =$(x1).val();
	var oldQtyEle ="#hiddenQty"+index;
	var oldQty =$(oldQtyEle).val();
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == oldQty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + oldQty + " 改為 " + newQty + " ? ") ) {
		//透過async=ajax呼叫後端不更新頁面程式
		$.get('UpdateItem.do', {'cmd':'MOD','async':'ajax','bookID': key , 'newQty':newQty }, function (data) {
						
// 			//小計
			var totalTemp =parseInt($("#subTotal span").text().replace(/,/g,""));
			//單品價格
			var priceEle = $(x1).parent().prev();
			var priceTemp =  parseInt(priceEle.text().replace(/,/g,""));
			//修改後的數量
			var newQtyTemp =  parseInt(newQty);
			//原先的數量
			var qtyTemp =  parseInt(oldQty);
			//更新數量
			$(x1).val(newQtyTemp);
			$(oldQtyEle).val(newQtyTemp);
			//更新小計						
			$(x1).parent().next().text(new Intl.NumberFormat("en-US").format(priceTemp*newQtyTemp));
			//更新總計
			$("#subTotal span").text(new Intl.NumberFormat("en-US").format(totalTemp-(priceTemp*qtyTemp)+(priceTemp*newQtyTemp)));
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

</script>

</body>
</html>