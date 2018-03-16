<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 自訂的css  -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/ellipsis.css" rel="stylesheet">

<style>
	*{border: 1px solid red}
</style>
</head>
<body>

	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />


  	<div class="container" >
  	  <div>
  			<a href="">首頁</a><span>/</span>
  			<a href="">分類總覽</a><span>/</span>
  			
  	  </div>
	  <div class="row">
		<!--左方導覽列 -->
		<div class="col-lg-3">
			<h3 class="my-4">書籍分類</h3>
			<div class="list-group">
			  <a href="" class="list-group-item">工具相關</a>
			  <a href="" class="list-group-item">各國旅遊</a>
			  <a href="" class="list-group-item">人文小說</a>
			  <a href="" class="list-group-item">大眾心理</a>
			</div>
		</div>
		
		<div class="col-lg-9"style="border:1px solid orange">
			<c:if test="${not empty bookBeans}">
				<h4>查詢關鍵字: ${bookName},  搜尋結果共 ${searchReasultNumber}筆</h4>
			</c:if>
			<h4>${searchResult}</h4>
			<div class="row">
			<c:forEach var="bookBean" items="${bookBeans}">
		      <div class="col-lg-4 col-md-4 mb-4">
	              <div class="card h-100">
	<!-- 透過getImage?id=呼叫model.RetrieveImageServlet至資料庫抓圖片 -->
	                <a href="${pageContext.request.contextPath}/ShowSingleProductServletTest?bookId=${bookBean.bookId}"><img class="card-img-top" src="${pageContext.request.contextPath}/getImage?id=${bookBean.bookId}&type=BOOK" alt="" height="200"></a>
	                <div class="card-body">
	                  <h5 class="card-title crop-text-4" style="height:100px;">
	                    <a href="#">${bookBean.title}</a>
	                  </h5>
	                  <h5>${bookBean.price}</h5>
					  <div class="card-text crop-text-4 text-justify">${bookBean.content}</div>
	                </div>
	              </div>
	            </div>
		  
		  </c:forEach>
			</div>
		</div>	
	
	</div><!-- row -->
  </div><!-- container -->
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>