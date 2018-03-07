<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>註冊</title>
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
        fieldset {
        	max-width:500px;
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
    </style>
</head>
<body>

	
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<div class="container">
		<div id='content'>
			<Form action="<c:url value='register.controller' />" method="post"	name="RegistorForm" enctype="multipart/form-data" >
				<legend align="center" >會員註冊</legend>
				<fieldset>
				 
				 <div class="block">
                      <label for="username">帳號：</label><input type="text" name="username" autofocus placeholder="請輸入帳號"  /><span class="warning" id="nValidate">${MsgError.errorIDEmpty}${MsgError.errorIDDup}</span><br />
                 </div>
                 </hr>
                  <div class="block">
                      <label for="pwd">密碼：</label><input type="password" name="pwd" autofocus placeholder="請輸入密碼" /><span class="warning" id="pValidate">${MsgError.errorPasswordEmpty} </span><br />
                  </div>
                   <div class="block">
                      <label for="pwdcomfirm">確認密碼：</label><input type="password" name="pwd2" autofocus placeholder="請再次輸入密碼" /><span class="warning" id="pValidate">${MsgError.errorPassword2Empty} </span><br />
                  </div>
                  <div class="block">
                      <label for="email">E-mail：</label><input type="text" name="email" autofocus placeholder="請輸入email" /><span class="warning" id="mailValidate">${MsgError.errorEmail} </span><br />
                  </div>
                  
                  <div class="block">
					    <label for="inputimg">請上傳圖片(非必要)：</label>
					    <br/>
					    <div class="col-sm-10">
					      <img height='256' width='256' id="memberImage" 
	                     		src='../images/default-member-image.png'  />
					      <input type="file" class="form-control-file"  name="inputimg" id="memberImageFile" >
					    </div>
					</div>
				    <div class="sub">
                                <input type="submit"  class="btn btn-success" value="送出" />
                            </div>
				 
				  </fieldset>
<legend align="center" ></legend>
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
		<script type="text/javascript">
	function setFocus()
	{
	     $().focus();
	}
	
	function confirmDelete() {
		if (confirm("確定刪除此項書籍資料(書號:${bookbean.bookId})?") ) {
			console.log("delete");
			$("#bookForm").attr("action","BookDelete.do?bookId=${bookbean.bookId}");
			//?bookId=${bookbean.bookId}
			$("#bookForm").method="POST";
			$("#bookForm").submit();
		} else {
		}
	}
	
	function updateBook() {
		$("#bookForm").attr("action","BookUpdate.do?type=BOOK");
		$("#bookForm").method="POST";
		$("#bookForm").submit();
	}
	
	//預覽圖片
	$("#memberImageFile").change(function(){
		var oFReader = new FileReader();
		//使用FileReader物件將檔案編成一組 URL 字串
		oFReader.readAsDataURL(this.files[0]);		
		oFReader.onloadend = function (oFREvent) {
			//參考資料
			//https://developer.mozilla.org/zh-TW/docs/Web/API/FileReader
			//https://www.html5rocks.com/zh/tutorials/file/dndfiles/
			//使用當事件結束時，自動傳進來的oFREvent的target方法拿到讀取資料結束後的FileReader。
			//使用FileReader.result讀入資料內容並將資料放至src
		    src = oFREvent.target.result;

		    $("#memberImage").attr("src",src);
		};
		
	})
	</script>
</body>
</html>