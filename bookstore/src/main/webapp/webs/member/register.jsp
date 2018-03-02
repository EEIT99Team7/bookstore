<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<Form action="<c:url value='register.do' />" method="POST"	name="loginForm">
				<legend align="center" >會員註冊</legend>
				<fieldset>
				 
				 <div class="block">
                      <label for="username">帳號：</label><input type="text" id="username" autofocus placeholder="請輸入帳號" value="${sessionScope.user}" /><span class="warning" id="nValidate">${ErrorMsgKey.AccountEmptyError}</span><br />
                 </div>
                 </hr>
                  <div class="block">
                      <label for="pwd">密碼：</label><input type="password" id="pwd" autofocus placeholder="請輸入密碼" value="${sessionScope.password}" /><span class="warning" id="pValidate">${ErrorMsgKey.PasswordEmptyError} </span><br />
                  </div>
                   <div class="block">
                      <label for="pwdcomfirm">確認密碼：</label><input type="password" id="pwdcomfirm" autofocus placeholder="請再次輸入密碼" /><span class="warning" id="pValidate">${ErrorMsgKey.PasswordCheckError} </span><br />
                  </div>
                  <div class="block">
                      <label for="email">E-mail：</label><input type="text" id="email" autofocus placeholder="請輸入email" /><span class="warning" id="mailValidate">${ErrorMsgKey.emailError} </span><br />
                  </div>
                  
				    <div class="sub">
                                <input type="submit" value="送出" />
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
</body>
</html>