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
	<!-- 顯示邊界 調整DIV用 -->
	<style>
	.mysearchcss{
		height:50px;
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

    <!-- Page Content -->   
    <div class="container" >
    <div class="row">
	<!--左側方導覽列 -->
	<jsp:include page="/webs/nav/DBLeftNav.jsp" />
       
        <!-- /.col-lg-9 -->
        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">

		   <div class="row">
			  <h2 class="col-lg-4" >書籍管理</h2>			
			  <a class="col-lg-2 offset-lg-6" href="${pageContext.request.contextPath}/BookInsert.jsp" style="padding-top:15px;">新增書籍</a>
		   </div>
		  </div>
		  
          <div class="row">
<!-- 書籍 -->
		  <c:forEach var="bookBean" items="${ProductBeans}">
		      <div class="col-lg-4 col-md-6 mb-4">
	              <div class="card h-100">
<!-- 	              透過getImage?id=呼叫RetrieveImageServlet至資料庫抓圖片 -->
	                <a href="BookUp.jsp?BOOKID=${bookBean.bookId}"><img class="card-img-top" src="${pageContext.request.contextPath}/getImage?id=${bookBean.bookId}&type=BOOK" alt=""></a>
	                <div class="card-body">
	                  <h4 class="card-title crop-text-4" style="height:120px;">
<!-- 	                   -->
<!-- 或許可以使用session scope的方式，直接把bean傳給bookUpdate.jsp過去 -->
	                    <a href="BookUp.jsp?BOOKID=${bookBean.bookId}">${bookBean.title}</a>
	                  </h4>
	                  <h5>${bookBean.price}</h5>
					  <div class="card-text crop-text-4 text-justify">${bookBean.content}</div>
	                </div>

	              </div>
	            </div>
		  
		  </c:forEach>

          </div>
          <!-- /.row -->

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

  </body>
</html>