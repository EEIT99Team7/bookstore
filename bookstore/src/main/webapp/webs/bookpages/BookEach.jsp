<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>${book.title}</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/socicon/css/styles.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/theme/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional.css"
	type="text/css">

<style>
.my-cart-icon {
	position: fixed;
	z-index: 999;
}

.badge-notify {
	background: red;
	position: relative;
	top: -25px;
	right: 15px;
	z-index: 1;
}

.b1 {
	color: black;
	outline: none;
	box-shadow: none;
	border-radius: 10px;
	background-color: #FFFFFF;
}

.s1 {
	color: #0066FF;
}
</style>

</head>
<body>
	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

	<section class="features1 cid-qKKGw9Wto7" id="features11-0"
		data-rv-view="40">
	<div class="container">
		<div class="col-md-9">
			<!-- 邊框 -->
			<div class="media-container-row">
				<div class="mbr-figure" style="width: 40%;">
					<!-- 圖 ../assets/images/05.jpg-->
					<!-- ${pageContext.request.contextPath}el方法 下面是寫程式的方法-->
					<img
						src="<%=request.getContextPath()%>/bookimg.controller?bookId=${book.bookId}"
						alt="" title="" media-simple="true">
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
									<a id="love"> <span class="mbr-iconfont mbri-hearth"
										style="color: rgb(255, 51, 102); font-size: 60px;"
										media-simple="true"></span></a>
									<!-- 購物車 -->
									<span id="buybookbtn" class="mbr-iconfont mbri-cart-add "
										style="color: rgb(20, 157, 204); font-size: 60px; cursor: pointer;"
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
						<c:forEach var="row" items="${review}"  varStatus="var">
							<li class="list-group-item">
								<div class="card-body user">
									<span class="user-photo">photo<img></span> <span
										class="user-name">${row.nickname}</span> 發表於: <span
										class="review-time">${row.make}</span>
								</div>
								<div class="card-body content">
									<p class="card-text">${row.content}</p>
								</div>
								<div class="modal-footer">
									<span class="badge badge-pill badge-warning">${row.score}
										stars</span> <span class="badge badge-pill badge-primary">${row.like}
										likes</span> <span><button type="button" id="like${var.index}" class="b1" onclick="myFunction(${var.index})" value="${row.memlike}">
											<span class="mbri-like"></span>
										</button></span>
								</div>
							</li>
							<input type="hidden" id="review${var.index}" value="${row.reviewId}">
						</c:forEach>
					</c:if>

					<c:if test="${not empty errors}">
						<li class="list-group-item">
							<div class="card-body error">
								<p class="card-text">${errors.noreivew}</p>
								<p>
									<button type="button" class="btn btn-outline-success btn-block" name="insertp" value="Insert" onclick="insert()">新增書評</button>
								</p>
							</div>
						</li>
					</c:if>

				</ul>
			</div>


		</div>
	</div>
	</section>

	<script
		src="${pageContext.request.contextPath}/assets/tether/tether.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/web/assets/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/popper/popper.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/assets/smooth-scroll/smooth-scroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/social-likes/social-likes.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>
	<script>
		$(document).ready(function(){
			$('#love').on('click', function(){
			//alert('onclick is working.');
		    miniReport();//Your function 
			}
			
// 			//一進網頁就檢查，並更改like_btn狀態
// 			if(${row.memlike}=0){
				
// 			}else{
				
// 			}
			
		);

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
		
// 		function myFunction(index) {
// 			var param = {};
// 			var temp="like"+index;
// 			var temp2="review"+index;
// // 			console.log("test");
// // 			console.log($("#"+temp).val());
// 			var t3=$("#"+temp).val();
// 			var t4=$("#"+temp2).val();
// 			$.ajax({
// 				method: "GET",
// 				url: "presslike.controller",
// 			    data: {"like":$("#"+temp).val(),"review":$("#"+temp2).val(),"memId":${LoginOK.memId}}});		
// 		}
		
		function insert(){
			window.location.href="${pageContext.request.contextPath}/TurnReivew.controller?bookId=${book.bookId}";  
		}
	</script>

</body>
</html>