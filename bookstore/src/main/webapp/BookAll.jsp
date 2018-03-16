<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>${book.title}</title>
<!-- 危險 要注意測試環境是否有網路 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/bootstrap-material-design-font/css/material.css">
<!-- 選定特效 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/et-line-font-plugin/style.css">
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"> --%>
<link href="${pageContext.request.contextPath}/vendor/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/animate.css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/theme2/css/style.css">
<!-- 選擇欄位-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobirise-gallery/style.css">




</head>
<body>
  	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />

<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img class="d-block w-100" src="http://placehold.it/900x350" alt="First slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="http://placehold.it/900x350" alt="Second slide">
	    </div>
	    <div class="carousel-item">
	      <img class="d-block w-100" src="http://placehold.it/900x350" alt="Third slide">
	    </div>
	  </div>
	</div>



		<section class="mbr-gallery mbr-section mbr-section-nopadding mbr-slider-carousel" data-filter="true" id="gallery4-0" data-rv-view="0" style="background-color: rgb(255, 255, 255); padding-top: 0rem; padding-bottom: 0rem;">	
			<!-- Filter -->
			<div class="mbr-gallery-filter container gallery-filter-active">
				<ul>
					<li class="mbr-gallery-filter-all active">All</li>	
				</ul>
			</div>
			<!-- Gallery -->
			<div class="mbr-gallery-row container">
				<div class=" mbr-gallery-layout-default">
					<div >
							<div id=show>
						       <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="語言電腦"/></div>
						           
		<!-- 				        <div> -->
				
							   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="各國旅遊"></div>	
									 
							   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" data-tags="人文小說"></div>
									
							   <div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"data-tags="大眾心理"></div>
								
		<!-- 						</div> -->
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
			</div>
		</section>

		
	<script src="${pageContext.request.contextPath}/assets/tether/tether.min.js"></script>
    

	<script src="${pageContext.request.contextPath}/assets/web/assets/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- 變化動態-->
	<script
		src="${pageContext.request.contextPath}/assets/masonry/masonry.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/smooth-scroll/smooth-scroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/theme2/js/jquery.touchSwipe.min.js"></script>
		
	<script
		src="${pageContext.request.contextPath}/assets/theme2/js/script.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/mobirise-gallery/player.min.js"></script>
	<!-- 選擇欄位-->
	<script
		src="${pageContext.request.contextPath}/assets/mobirise-gallery/script.js"></script>
<!-- 排序-->
<script src="${pageContext.request.contextPath}/assets/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script>
$(document).ready(function() {
	myDiv = document.getElementById("show");
	while(myDiv.hasChildNodes()){
		myDiv.removeChild(myDiv.lastChild);
				}
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=2",function(data) {
		//console.log(data);
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","各國旅遊");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","1");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=1",function(data) {
		//console.log(data);
	
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","語言電腦");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","2");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=3",function(data) {
		//console.log(data);
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","人文小說");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","3");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})
$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=4",function(data) {
		//console.log(data);
		
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","大眾心理");
                    eleDiv2.setAttribute("data-toggle","modal");
                    //eleDiv2.setAttribute("data-slide-to","4");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);	
  });		
})

</script>


</body>
</html>