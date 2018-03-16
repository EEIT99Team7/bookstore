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
			  <h2 class="col-lg-4" >廣告管理</h2>			
		   </div>
		  </div>		  
		  <!-- table放置區 -->
		  
		  	<form action="AdverInsert.do" method="POST" enctype="multipart/form-data">
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">圖檔名稱</label>
					<div class="col-sm-10">
						<input class="form-control" type="text" name="imgFilename" id="imgFilename" value="">
					</div>
				</div>		  
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">狀態</label>
					<div class="col-sm-10">
						<label class=""radio-inline"><input class="" type="radio" name="status" id="imgstatus1" value="true" checked>顯示</label>						
						<label class=""radio-inline"><input class="" type="radio" name="status" id="imgstatus2" value="false">隱藏</label>
					</div>							
					
				</div>		  
		  		<div class="form-group row">
					<label for="" class="col-sm-2 col-form-label">圖片</label>
					<div class="col-sm-10">
						<img height='210' width='250' id="adImg" 
	                     	src='${pageContext.servletContext.contextPath}/getImage'/>
					    <input type="file" class="form-control-file"  name="adImgFile" id="adImgFile" value="">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-10">
					    <input type="submit" class="form-control-button btn-success" value="新增">
					</div>
				</div>		  
		  	</form>

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
	<script type="text/javascript">
	$(document).ready(function() {
		$("#adImgFile").change(function(){
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
			    $("#adImg").attr("src",src);
			};
		});
	})
	</script>
  </body>
</html>