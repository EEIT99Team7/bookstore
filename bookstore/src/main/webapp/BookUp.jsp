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
	<%@ page import="org.springframework.web.context.WebApplicationContext"%>
	<%@ page import="org.springframework.context.ApplicationContext" %>
	<%@ page import="model.dao.*" %>
	
	<%
	// <jsp:useBean id="categoryBean" class="model.dao.CategoryDaoJdbc" scope="page" />
	// 因使用Spring無法在jsp環境下使用usebean拿到Bean物件，所以使用context.getBean
	 ApplicationContext context = (ApplicationContext)
	 					application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	
	 ProductDaoJdbc pdj = (ProductDaoJdbc) context.getBean("productDaoJdbc");
	 CategoryDaoJdbc cdj = (CategoryDaoJdbc) context.getBean("categoryDaoJdbc");
	 pageContext.setAttribute("pdj", pdj);
	 pageContext.setAttribute("cdj", cdj);
	 
	 %>
	<c:choose>
	   <c:when test="${not empty param.BOOKID}">
	       <jsp:setProperty name="pdj" property='bookId' value='${param.BOOKID}' />
	      <c:set var="bookbean" value='${pdj.book}' scope='session' />
	   </c:when>
	   <c:otherwise>
	   </c:otherwise>
	</c:choose> 

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
	<!-- 限制內容字數 css  -->
	<link  href="${pageContext.request.contextPath}/css/ellipsis.css" rel="stylesheet">
</head>
<body>

 	<!-- 引用共同導覽列 -->       
	<jsp:include page="/webs/nav/top.jsp" />

    <!-- Page Content -->   
    <div class="container" >
     <div class="row">
	<!--左側方導覽列 -->
	<jsp:include page="/webs/nav/DBLeftNav.jsp" />
       
        <!-- /.col-lg-3 -->
        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
 
			  <div ><h2>書籍管理</h2></div>	
			  <!--書籍 -->
			  <div class="col-lg-8 col-md-12 mb-8">
			      
			      <form id="bookForm" method="post" action="BookUpdate.do" 
	      				enctype="multipart/form-data">
					<div class="form-group row">
					    <label for="" class="col-sm-2 col-form-label">書籍ID</label>
					    <div class="col-sm-10">
					      <input class="form-control" type="text" placeholder="${bookbean.bookId}" readonly>
					    </div>
					</div>
					
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">書名</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="title" id="title" value="${bookbean.title}">
					    </div>
					</div>  
					
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">作者</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="author" id="author" value="${bookbean.author}">
					    </div>
					</div>				
	
					<div class="form-group row">
					


					    <label for="inputEmail3" class="col-sm-2 col-form-label">出版社</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="press" id="press" value="${bookbean.press}">
					    </div>
					</div>				
	
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">價錢</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="price" id="price" value="${bookbean.price}">
					    </div>
					</div>
					  
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">庫存</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" name="stock" id="stock" value="${bookbean.stock}">
					    </div>
					    <c:set target="${cdj}" property="tagName" value='bookNo' /> 
						<c:set target="${cdj}" property="selected" value='${bookbean.bookNo}' /> 
					    <label for="inputEmail3" class="col-sm-3 col-form-label">書本類別</label>
					    <div class="col-sm-3">
					    	  ${cdj.selectTag}
					    </div>
					    
					</div>
													  
	
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">圖片</label>
					    <div class="col-sm-10">
					      <img height='210' width='250' id="bookImg" 
	                     		src='${pageContext.servletContext.contextPath}/getImage?id=${bookbean.bookId}&type=BOOK'  />
					      <input type="file" class="form-control-file"  name="bookImgFile" id="bookImgFile" value="">
					    </div>
					</div>
	
					<div class="form-group row">
					    <label for="inputEmail3" class="col-sm-2 col-form-label">內容</label>
					    <div class="col-sm-10">
					      <textarea class="form-control" name="content" id="content" rows="5" >${bookbean.content}</textarea>
					    </div>
					</div>
					
					<div class="form-group row">
					    <input type="button" name="update" value="修改" onclick='updateBook()'/>
					    
	        			<input type="button" name="delete" value="刪除" onclick='confirmDelete()'/> 
					</div>
												 
			      </form>
	
			  </div>
			  <!-- /.col-lg-8 col-md-12 mb-8 -->

          </div>
          <!-- #carouselExampleIndicators -->

      </div>
      <!-- /.col-lg-9 -->

     </div>
     <!-- /.row -->
    </div>
    <!-- /.container-->
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
	$("#bookImgFile").change(function(){
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

		    $("#bookImg").attr("src",src);
		};
		
	})
	</script>
  </body>
</html>