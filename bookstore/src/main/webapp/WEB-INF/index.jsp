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
	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

    <!-- 網頁內容 -->
    <div class="container" >
        <!-- /.col-lg-3 -->
        <div class="col-lg-8 offset-lg-2 ">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
	<!--廣告圖放置位置 -->
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	<!--使用foreach在廣告圖下方自動產生小白槓 -->
	<!--透過FrontpageServlet設定參數adcounts，取得廣告圖數量 -->
              <c:forEach var="i" begin="1" end="${adcounts-1}" varStatus="stVar">
              	<li data-target="#carouselExampleIndicators" data-slide-to="${i}"></li>
              </c:forEach>
            </ol>
	<!-- 設置廣告圖顯示位置 -->
            <div class="carousel-inner" role="listbox">
              <c:forEach var="adverBean" items="${adver_FPS}" varStatus="stVar">
            	<c:choose>
            		<c:when test="${stVar.index==0}">
            			<div class="carousel-item active">
            			<img class="d-block img-fluid" src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" >
            			</div>
            		</c:when>
            		<c:otherwise>
            			<div class="carousel-item">
                		<img class="d-block img-fluid" src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" >
              			</div>
            		</c:otherwise>
            	</c:choose>
              </c:forEach>
            </div>
	<!-- 廣告圖左右箭頭 -->

            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
	<!-- 廣告圖下方的大區塊 -->
		  <div ><h2>隨選新書</h2></div>
		  
          <div class="row">
	<!-- 書籍顯示區塊 -->
		  <c:forEach var="bookBean" items="${ProductBeans}">
		      <div class="col-lg-4 col-md-6 mb-4">
	              <div class="card h-100">
	<!-- 透過getImage?id=呼叫model.RetrieveImageServlet至資料庫抓圖片 -->
	                <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/getImage?id=${bookBean.bookId}&type=BOOK" alt="" height="200" weight="150"></a>
	                <div class="card-body">
	                  <h4 class="card-title crop-text-4" style="height:120px;">
	                    <a href="#">${bookBean.title}</a>
	                  </h4>
	                  <h5>${bookBean.price}</h5>
					  <div class="card-text crop-text-4 text-justify">${bookBean.content}</div>
	                </div>
	<!--  書籍小方格底下的星星 -->
	                <div class="card-footer">	                
	                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
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
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
</html>