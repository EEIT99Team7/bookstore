<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="google-signin-client_id" content="30136455505-9rt5nfgsvktopts10pc3eqff7ui86jq6.apps.googleusercontent.com">
<title>登入</title>
<!-- Bootstrap core CSS -->
<!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
	<!-- 限制內容字數 css  -->
	<link  href="${pageContext.request.contextPath}/css/ellipsis.css" rel="stylesheet">
<!-- 顯示邊界 調整DIV用 -->
 <style>
 #legend{
	margin: 1rem auto 1rem;
	text-align:center;
}
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
        #myMOUSE{
         cursor: pointer;
          }
    </style>
    

</head>
<body>
	
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	
	<div class="container">
		<div id='content'>
			<Form action="<c:url value='login.controller' />" method="post"	name="loginForm">
				<h4 id="legend">會員登入</h4>
				<fieldset>
				 
				 <div class="block">
                      <label for="name">帳號：</label><input type="text" name="username" autofocus placeholder="請輸入帳號" value="${sessionScope.user}" /><span class="warning" id="nValidate">${ErrorMsgKey.AccountEmptyError}</span><br />
                 </div>
                 </hr>
                  <div class="block">
                      <label for="pwd">密碼：</label><input type="password" name="pwd" autofocus placeholder="請輸入密碼" value="${sessionScope.password}" /><span class="warning" id="pValidate">${ErrorMsgKey.PasswordEmptyError}${ErrorMsgKey.LoginError} </span><br />
                  </div>
              
				    <div class="sub">
                                <input type="submit" class="btn btn-success btn-block" value="登入" /><br/>
                                <img id="myMOUSE" width="170px" src="${pageContext.request.contextPath}/images/fb_login.PNG">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img id="myMOUSE" width="170px" src="${pageContext.request.contextPath}/images/google_login.PNG"><br/>
                                <a href="${pageContext.request.contextPath}/webs/forgot.jsp">忘記密碼?</a><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                                <a href="${pageContext.request.contextPath}/webs/register.jsp">加入會員</a>
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
	<!-- Google Login -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>

</body>
</html>