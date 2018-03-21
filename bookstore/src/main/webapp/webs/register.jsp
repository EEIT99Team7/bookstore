<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>註冊</title>
<!-- 使用 購物車icon-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">


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
#legend {
	margin: 1rem auto 1rem;
	text-align: center;
}

fieldset {
	max-width: 500px;
	border: 3px solid gray;
	margin: auto;
	border-radius: 20px;
}

.block {
	border-bottom: 1px solid black;
	margin: 20px;
	padding-bottom: 5px;
}

.warning {
	color: black;
	font-size: 12px;
	margin: 5px;
}

.sub {
	margin: 10px;
	max-width: 450px;
	text-align: center;
}

.mysearchcss{
	height:50px
}
.btn-outline-success{
	padding:10px;
	padding-left:30px;
	padding-right:30px
}
</style>
</head>
<body>


	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<div class="container">
		<div id='content'>
			<Form action="<c:url value='register.controller' />" method="post"
				name="RegistorForm" enctype="multipart/form-data">
				<h4 id="legend">會員註冊</h4>
				<fieldset>

					<div class="block">
						<label for="username">帳號：</label><input type="text"
							name="username" autofocus placeholder="請輸入帳號" /><span
							class="warning" id="nValidate">${MsgError.errorIDEmpty}${MsgError.errorIDDup}</span><br />
					</div>
					</hr>
					<div class="block">
						<label for="pwd">密碼：</label><input type="password" name="pwd"
							autofocus placeholder="請輸入密碼" /><span class="warning"
							id="pValidate">${MsgError.errorPasswordEmpty} </span><br />
					</div>
					<div class="block">
						<label for="pwdcomfirm">確認密碼：</label><input type="password"
							name="pwd2" autofocus placeholder="請再次輸入密碼" /><span
							class="warning" id="pValidate">${MsgError.errorPassword2Empty}
						</span><br />
					</div>
					<div class="block">
						<label for="email">E-mail：</label><input type="text" name="email"
							autofocus placeholder="請輸入email" /><span class="warning"
							id="mailValidate">${MsgError.errorEmail} </span><br />
					</div>
					<div class="block">
						<label for="email">暱稱：</label><input type="text" name="nickName"
							autofocus placeholder="請輸入暱稱" /><span class="warning"
							id="mailValidate">${MsgError.errorNickName} </span><br />
					</div>
					<div class="block">
						<label for="inputimg">請上傳圖片(非必要)：</label> <br />
						<div class="col-sm-10">
							<img height='256' width='256' id="memberImage"
								src='../images/default-member-image.png' /> <input type="file"
								class="form-control-file" name="inputimg" id="memberImageFile">
						</div>
					</div>
					<div class="sub">
						<input type="submit" class="btn btn-success" value="送出" />
					</div>

				</fieldset>
				<legend align="center"></legend>
			</Form>
		</div>
	</div>
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- Bootstrap core JavaScript -->

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

	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		//預覽圖片
		$("#memberImageFile").change(function() {
			var oFReader = new FileReader();
			//使用FileReader物件將檔案編成一組 URL 字串
			oFReader.readAsDataURL(this.files[0]);
			oFReader.onloadend = function(oFREvent) {
				//參考資料
				//https://developer.mozilla.org/zh-TW/docs/Web/API/FileReader
				//https://www.html5rocks.com/zh/tutorials/file/dndfiles/
				//使用當事件結束時，自動傳進來的oFREvent的target方法拿到讀取資料結束後的FileReader。
				//使用FileReader.result讀入資料內容並將資料放至src
				src = oFREvent.target.result;

				$("#memberImage").attr("src", src);
			};

		})
	</script>
</body>
</html>