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

    <title>社群書店</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
	<!-- 限制內容字數 css  -->
	<link  href="${pageContext.request.contextPath}/css/ellipsis.css" rel="stylesheet">
</head>
 <body>

 	<!-- 引用共同導覽列  -->
	<jsp:include page="/webs/nav/top.jsp" />

<!--     Page Content    -->
    <div class="container" >
    <div class="row">
	<!--左側方導覽列 -->
	<jsp:include page="/webs/nav/DBLeftNav.jsp" />
       
        <!-- /.col-lg-9 -->
        <div class="col-lg-9">

         <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">

		   <div class="row">
			  <h2 class="col-lg-4" >首頁廣告管理</h2>			
			  <a class="col-lg-2 offset-lg-6" href="${pageContext.request.contextPath}/BookInsert.jsp" style="padding-top:15px;">新增廣告</a>
		   </div>
		  </div>		  
		  <!-- table放置區 -->
		  
		  	<form action="" method="GET" enctype="multipart/form-data">
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">廣告ID</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" placeholder="${bean.bookId}" readonly>
					</div>
				</div>
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">圖檔名稱</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="imgFilename" id="imgFilename" value="${bean.bookId}">
					</div>
				</div>		  
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">狀態</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="imgstatus" id="imgstatus" value="${bean.bookId}">
					</div>
				</div>		  
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">圖片</label>
					<div class="col-sm-10">
						<img height='210' width='250' id="adImg" 
	                     	src='${pageContext.servletContext.contextPath}/getImage?id=${bean.bookId}&type=ADVERTISEMENT'/>
					    <input type="file" class="form-control-file"  name="adImgFile" id="adImgFile" value="">
					</div>
				</div>		  
		  	</form>
<!-- 		  <table class="table"> -->
<!-- 			    <thead> -->
<!-- 			    	<tr> -->
<!-- 			      		<th scope="col">#</th> -->
<!-- 			      		<th scope="col">圖檔名稱</th> -->
<!-- 			      		<th scope="col">狀態(0:隱藏  1顯示)</th> -->
<!-- 			      		<th scope="col">圖片</th> -->
<!-- 			      		<th scope="col"></th> -->
<!-- 			    	</tr> -->
<!-- 			    </thead> -->
<!-- 			    <tbody> -->
<!-- 		  			廣告 -->
<%-- 		  			<c:forEach var="adverBean" items="${AdverBeans}" varStatus="stvar"> --%>
<!-- 		  			    <tr> -->
<%-- 					      <th scope="row">${stvar.count}</th> --%>
<%-- 					      <td>${adverBean.imgName}</td> --%>
<%-- 					      <td>${adverBean.status}</td> --%>
<%-- 					      <td><img src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" width="100" height="80"/></td> --%>
<!-- 					      <td><input type="button" class="btn btn-info" id="btnModify" value="修改"></td> -->
<!-- 					    </tr> -->
<%-- 		  			</c:forEach> --%>
<!-- 			    </tbody> -->
<!-- 		  	</table> -->
        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$("btnModify").click(function(){
			
			
		})
	</script>
  </body>
</html>