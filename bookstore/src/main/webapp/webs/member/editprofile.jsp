<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>會員中心</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/myaccount.css"
	rel="stylesheet">

<!-- Modal用 -->

  <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap3.3.7.min.js"></script>
<style>
.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p,
	.bootstrap-iso form {
	font-family: Arial, Helvetica, sans-serif;
	color: black
}

.bootstrap-iso form button, .bootstrap-iso form button:hover {
	color: white !important;
}

.asteriskField {
	color: red;
}

.datepicker {
	margin-top: 50px;
	position: absolute;
}
#loadingImg {
	display:none;
}
</style>
</head>
<body>

	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!--左側方導覽列 -->
			<div class="col-lg-3">
				<h1 class="my-4">會員中心</h1>
				<div class="list-group">
					<a	href="${pageContext.request.contextPath}/webs/member/editprofile.jsp"
						class="list-group-item active">修改會員資料</a>
				</div>
				<div class="list-group">
					<a	href="${pageContext.request.contextPath}/webs/member/changepassword.jsp"
						class="list-group-item">修改密碼</a>
				</div>
			</div>

			<!-- /.col-lg-9 頁面主內容-->
			<div class="col-lg-9">
				<Form action="<c:url value='editprofile.controller' />"
					method="post" id="EditForm">
					<h2>修改個人資料</h2>
					<div class="form-horizontal rm-form form-profile">
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-field-4">個人頭像</label>
							<div class="col-sm-10">
								<c:if test="${!empty LoginOK}">
									<img height='256' width='256' id="memberImage"
										src="${pageContext.request.contextPath}/getImage?id=${LoginOK.memId}&type=MEMBER">
									<input type="file" name="inputimg_name"
										class="form-control-file" id="memberImageFile">
								</c:if>
								<c:if test="${empty LoginOK}">
								<img height='256' width='256' id="memberImage"
										src="${pageContext.request.contextPath}/images/default-member-image.png">
									<input type="file" name="inputimg_name"
										class="form-control-file" id="memberImageFile">
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-field-2">電子郵件</label>
							<div class="col-sm-10">${LoginOK.email}
							<!-- Button trigger modal -->
								<button type="button" id="changeEmail-btn" class="btn btn-primary" data-toggle="modal" data-target="#changeEmail">
								  修改Email
								</button>		
								 <span class="help-inline">${ErrorMsgKey.EmailDuplicationError}${OkMsgKey.ChangeEmailOK}  </span><br/>
								 <span class="help-inline">變更Email，需要重新登入  </span>
							</div>
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							<label class="control-label col-sm-2" for="form-field-2">密碼</label> -->
<!-- 							<div class="col-sm-10"> -->
<!-- 							Button trigger modal -->
<!-- 								<button type="button" id="changePassword-btn" class="btn btn-primary" data-toggle="modal" data-target="#changePassword"> -->
<!-- 								  變更密碼 -->
<!-- 								</button>	 -->
<!-- 								<br> <span class="help-inline">變更密碼，需要重新登入</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="form-group">
							<label class="control-label col-sm-2" for="addr">地址</label>
							<div class="col-sm-10">
								<c:if test="${!empty LoginOK.addr}">
									<input type="text" name="addr" value="${LoginOK.addr}" class="form-control" size="30">
								</c:if>
								<c:if test="${empty LoginOK.addr}">
									<input type="text" name="addr" placeholder="請輸入地址" class="form-control" size="30" >
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-input-readonly">電話</label>
							<div class="col-sm-10">
							<c:if test="${!empty LoginOK.phone}">
								<input type="text" name="phone" value="${LoginOK.phone}" class="form-control" size="30">
							</c:if>
							<c:if test="${empty LoginOK.phone}">
								<input type="text" name="phone" placeholder="請輸入電話" class="form-control" size="30">
							</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-input-readonly">暱稱</label>
							<div class="col-sm-10">
								<input type="text" name="nickname" value="${LoginOK.nickName}" class="form-control" size="30">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-field-2">性別</label>
							<div class="col-sm-10">
								<c:if test="${empty LoginOK.sex}">
									<label class="radio-inline"><input type="radio"
										name="sex" value="男">男</label>&nbsp;&nbsp;&nbsp;
								    <label class="radio-inline"><input type="radio"
										name="sex" value="女">女</label>&nbsp;&nbsp;&nbsp;
								    <span class="help-inline">性別設定後就不能再更改</span>
								</c:if>
								<c:if test="${!empty LoginOK.sex}">
									<span style="line-height: 2.5em;">${LoginOK.sex} </span>
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="birthday_year">生日</label>
							<div class="col-sm-10">
								<c:if test="${!empty LoginOK.birthDate}">
									<span style="line-height: 2.5em;"><fmt:formatDate
											value="${LoginOK.birthDate}" pattern="yyyy/MM/dd" /> </span>
								</c:if>
								<c:if test="${empty LoginOK.birthDate}">
									<div class="input-group date">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-th"></span>
										</div>
										<input class="form-control" id="date" name="birthDate"
											placeholder="請輸入生日，設定後就不能再更改，格式：YYYY/MM/DD  " type="text" />
									</div>
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="form-field-4">個人簡介</label>
							<div class="col-sm-10">
									<textarea name="description" cols="40" rows="5" class="form-control" placeholder="請輸入個人簡介">${LoginOK.description}</textarea>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-10 col-sm-push-2">${ErrorMsgKey.errTitle}
								<button class="btn btn-default btn-lg" type="reset">清除</button>
								<button class="btn btn-primary btn-lg" type="submit">修改</button>
							</div>
						</div>
					</div>
				</Form>
			</div>

			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- Modal 1 變更信箱-->
<div class="modal fade" id="changeEmail" tabindex="-1" role="dialog" aria-labelledby="changeEmailLable" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <Form action="<c:url value='changeemail.controller' />" method="post"	name="changeEmailForm" id="changeEmailForm">
      <div class="modal-header">
        <h5 class="modal-title" id="changeEmailLable">修改Email</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="form-group">
			<label class="control-label col-sm-2" for="addr">新的Email</label>
			<div class="col-sm-10">
				<input type="text" name="email" placeholder="請輸入email" class="form-control" size="30" >
			</div>
		</div>
      </div>
      <div class="modal-footer"><img height='32px' width='32px' src="${pageContext.request.contextPath}/images/loading.gif" id="loadingImg">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal" >取消</button>
        <button type="submit" class="btn btn-primary" id="changeEmailSubmit">修改</button>
      </div>
      </Form>
    </div>
  </div>
</div>

	<!-- Modal 2 變更密碼-->
<div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="changePasswordLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="changePasswordLabel">修改密碼</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="changePasswordForm">
          <div class="form-group">
            <label for="oldPassword" class="col-form-label">輸入舊密碼</label><span>${ErrorMsgKey.errorPasswordEmpty}${ErrorMsgKey.PWDNotCorrectError}</span>
            <input type="text" class="form-control" id="oldPassword" name="oldPassword">
          </div>
           <div class="form-group">
            <label for="newPassword" class="col-form-label">設定新密碼</label><span>${ErrorMsgKey.errorPasswordMatch}${ErrorMsgKey.errorPasswordDuplicate}</span>
            <input type="text" class="form-control" id="newPassword" name="newPassword">
          </div>
           <div class="form-group">
            <label for="newPassword2" class="col-form-label">再次確認</label><span>${ErrorMsgKey.errorPassword2Match}</span>
            <input type="text" class="form-control" id="newPassword2" name="newPassword2">
          </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="changePasswordSubmit">更改</button>
      </div>
    </div>
  </div>
</div>
	
	
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- /.container -->

	<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/formden.js"></script>
	<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap-iso3.3.2.css" />

	<!-- Bootstrap core JavaScript -->
	<script	src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
	<!-- Include jQuery -->
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

	<!-- Include Date Range Picker -->
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap-datepicker3.css" />

	<script>
		$(document).ready(
				function() {
					var date_input = $('input[name="birthDate"]'); //our date input has the name "birthDate"
					var container = $('.bootstrap-iso form').length > 0 ? $(
							'.bootstrap-iso form').parent() : "body";
					date_input.datepicker({
						format : 'yyyy/mm/dd',
						container : container,
						todayHighlight : true,
						autoclose : true,
					})
				})
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
		$(document).ready(	function () {
			        $("#changeEmailForm").submit(function (e) {
		            //disable the submit button
		            $("#changeEmailSubmit").attr("disabled", true);
		            //show loading image
		            $("#loadingImg").show();
		
		        });
		    });
		$(document).ready(function () {
			        $("#changePasswordSubmit").click(function(){
			        	$.post("changepassword.controller", $("#changePasswordForm").serialize(),function(result){
			        		console.log(result.errorPassword2Match);
			        		console.log(result..errorPasswordMatch);
			        	},"json");
// 			        	$("#changePasswordSubmit").attr("disabled", true);
// 			        	$("#loadingImg").show();
// 						$.getJSON('changepassword.controller',function(jsonString){
// 						console.log("jsonString");})
			        }) 
		            //disable the submit button
		            //show loading image

			});
	
		
	</script>
</body>
</html>