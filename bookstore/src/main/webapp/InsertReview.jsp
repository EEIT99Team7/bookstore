<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>登入</title>
<!-- Bootstrap core CSS -->
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css"
	rel="stylesheet">
<!-- 限制內容字數 css  -->
<link href="${pageContext.request.contextPath}/css/ellipsis.css"
	rel="stylesheet">
<!-- 顯示邊界 調整DIV用 -->
<style>
/* fieldset { */
/* 	max-width: 500px; */
/* 	border: 3px solid gray; */
/* 	margin: auto; */
/* 	border-radius: 20px; */
/* } */

/* .block { */
/* 	border-bottom: 1px solid black; */
/* 	margin: 20px; */
/* 	padding-bottom: 5px; */
/* } */

/* .warning { */
/* 	color: black; */
/* 	font-size: 12px; */
/* 	margin: 5px; */
/* } */

/* .sub { */
/* 	margin: 10px; */
/* 	max-width: 450px; */
/* 	text-align: center; */
/* } */
table {
	margin-left: auto;
	margin-right: auto;
}

th {
	width: 150px;
	text-align: right;
	height: 100px;
	padding-right: 8px;
	text-align: right;
}

td {
	height: 100px;
	padding-left: 10px;
}

.n {
	color: orange;
}

table, th, td {
	border: 1px solid white;
}

#b1 {
	margin: 0px auto;
}

</style>

</head>
<body>

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<br><br>
	<div class="container">
		<div id='content' class="col-md-10 offset-md-1">
			<Form action="<c:url value="/TurnReivew.controller" />" method="post"  >

				<div id="r.title" style="background-color: #DDDDDD; width: 100%;text-align: center;">書評</div>
				<table>
					<tr>
						<td class="table-active"><img src="${pageContext.request.contextPath}/getImage?id=${book.bookId}&type=BOOK" height="250" width="200"></td>
						<td class="table-active">${book.content}</td>
					</tr>
					<tr>
						<th class="table-secondary">會員姓名</th>
						<td class="table-active">${LoginOK.nickName}</td>
					</tr>
					<tr>
						<th class="table-secondary">我要給這本書評分</th>
						<td class="table-active">
						  <div id="content">
								<div>
									<span id="st1" class="fa fa-star s"></span>
									<span id="st2" class="fa fa-star s"></span>
								    <span id="st3" class="fa fa-star s"></span> 
								    <span id="st4" class="fa fa-star s"></span>
								    <span id="st5" class="fa fa-star s"></span>
								     <span id="message"></span>
								</div>
							</div>
							</td>
						<td>${errors.scoreerror}</td>
					</tr>
					<tr>
						<th class="table-secondary">發表想法</th>
						<td class="table-active" style="width: 470px; height: 250px"><textarea
								name="content" style="resize: none; width: 450px; height: 200px"></textarea></td>
						<td>${errors.contenterror}</td>
					</tr>
				</table>
				<div id="b1">
					<input type="hidden" id="Score" name="score" value="">
					 <input	type="hidden" name="memID" value="${LoginOK.memId}">
					  <input type="hidden" name="bookId" value="${book.bookId}">
					   <input type="submit" class="btn btn-warning" name="review" id="123" >
<!-- 						value="Send" onclick="inserted()" -->
				</div>
			</Form>
		</div>
	</div>
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- Bootstrap core JavaScript -->

	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		var curIndex;
		var setStarIndex;
		var setStar = false;
		var stars = document.getElementsByClassName("fa fa-star");
		document.addEventListener("DOMContentLoaded", function() {
			var starsLen = stars.length;
			for (var i = 0; i < starsLen; i++) {
				stars[i].addEventListener("mouseover", mouseOver);
				stars[i].addEventListener("mouseout", mouseOut);
				stars[i].addEventListener("click", click);
			}
			//  document.addEventListener("click", reset);
		});

		function mouseOver(nsEvent) {
			if (this.id != null) {
				curIndex = this.id.substr(2);
			}
			var starsLen = stars.length;
			for (var i = 0; i < curIndex; i++) {
				stars[i].className = stars[i].className.replace(" s", " n");
			}
			for (var j = starsLen - 1; j > curIndex - 1; j--) {
				stars[j].className = stars[j].className.replace(" n", " s");
			}
			document.getElementById("message").innerHTML = curIndex + "顆星";
		}

		function mouseOut() {
			if (setStar == true) {

			} else {
				mouseOver();
			}
		}

		function click(nsEvent) {
			setStar = true;
			if (this.id != null) {
				setStarIndex = this.id.substr(2);
			}
			document.getElementById("message").innerHTML = setStarIndex + "顆星";
			$('#Score').val(setStarIndex);
			setStar = true;
			// 		$.get('/InsertReivew.controller',{'score':setStarIndex});
			var theEvent = nsEvent || event;
			if (theEvent.stopPropagation)
				theEvent.stopPropagation();
			else
				theEvent.cancelBubble = true;
		}

		function inserted() {
			window.location.href = "${pageContext.request.contextPath}/bookPages.controller?bookId=${book.bookId}";
		}
	</script>
</body>
</html>