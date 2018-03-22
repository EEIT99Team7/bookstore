<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${LoginOK.nickName}</title>

    
		<!-- 套用此css會影響至bootstrap原先按鈕樣式及整體版面的些許字形 ex:大小、顏色、字體-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme2/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/tether/tether.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets3/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/theme/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobirise/css/mbr-additional2.css" type="text/css">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->

<style>
.my-cart-icon{
 	position: fixed;
   	z-index: 999;
 
}
.badge-notify{
    background:red;
   	position:relative;
   	top: -25px;
   	right:15px;
 	z-index: 1;
}
.btn-outline-success{
	margin-left:0px
}

.mysearchcss{
	height:50px
}
.btn-outline-success{
	padding:10px;
	padding-left:30px;
	padding-right:30px
}

.my-cart-icon{
 	position: fixed;
   	z-index: 999;
 
}
.badge-notify{
    background:red;
   	position:relative;
   	top: -25px;
   	right:15px;
 	z-index: 1;
}


.mysearchcss{
 padding-right:20px;
 padding-top:10px;
 padding-bottom:10px;
 margin-right:0px;

}

</style>
	

</head>
<body>

	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />




    <section class="counters2 counters cid-qM3jZxdPAu" id="counters2-4" data-rv-view="21">


        <div class="container pt-4 mt-2">
            <div class="media-container-row">
                <div class="media-block" style="width: 30%;">
                    <h2 class="mbr-section-title pb-3 align-left mbr-fonts-style display-2">${LoginOK.nickName}</h2>
                    <h3 class="mbr-section-subtitle pb-5 align-left mbr-fonts-style display-5">${LoginOK.description}</h3>
                    <div class="mbr-figure">
                        <img src="${pageContext.request.contextPath}/getImage?id=${LoginOK.memId}&type=MEMBER" media-simple="true">
                    </div>
                </div>
                <div class="cards-block" style="padding-top:150px;padding-left:200px">
                    <div class="cards-container">
                        <div class="card px-3 align-left col-12 col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <span class="mbr-iconfont pr-2 mbri-hearth" style="font-size: 60px;" media-simple="true"></span>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                       
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">我的粉絲</h4>
                                    <p class="mbr-content-text mbr-fonts-style display-7">
                                                                                        
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card px-3 align-left col-12 col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <span class="mbr-iconfont pr-2 mbri-update" style="font-size: 50px;" media-simple="true"></span>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                        
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                                                           我的小圈圈
                                    </h4>
                                    <p class="mbr-content-text mbr-fonts-style display-7">
                                                                                              
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card px-3 align-left col-12 col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <a onclick="showReview()"><span class="mbr-iconfont pr-2 mbri-edit" style="font-size: 60px;" media-simple="true"></span></a>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                        
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">我的書評</h4>
                                    <p class="mbr-content-text mbr-fonts-style display-7">
                                                                                 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card px-3 align-left col-12 col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <span class="mbr-iconfont pr-2 mbri-users" style="font-size: 60px;" media-simple="true"></span>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                        
                                    </h3>
                                </div>
                                <div class="card-texts">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                                                                    我的追蹤者
                                    </h4>
                                    <p class="mbr-content-text mbr-fonts-style display-7">
                                                                                
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </section>
    
    <section class="accordion2 cid-qM3odMGhor" id="accordion2-6" data-rv-view="33">



        <div class="container">
            <div class="media-container-row pt-5">
                <div class="accordion-content">


                    <div id="bootstrap-accordion_1" class="panel-group accordionStyles accordion pt-5 mt-3" role="tablist" aria-multiselectable="true">
                        <div class="card" style="width: 250px">
                            <div class="card-header" role="tab" id="headingOne">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#bootstrap-accordion_1" data-core="" href="#collapse1_1" aria-expanded="false" aria-controls="collapse1">
                                    <h4 class="mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>我的書庫
                                    </h4>
                                </a>
                            </div>
                            <div id="collapse1_1" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body p-4">
                        <table id="productTable" class="table table-bordered">
                       <tbody>
             
                       </tbody>
                        <tfoot>
                        <tr>
                       <form name="myForm" >                      
                       <td>
                       <input style="width:150px;DISPLAY:none" type="text"  id="BCname" name="BCname" placeholder="新增/修改我的書櫃" onblur="InsertName()"  >
<!-- 這裡修改memID=抓使用者的--><input type="hidden" id="memID" name="memID" value="${LoginOK.memId}">
                       <input type="hidden" id="BCID" name="BCID" value=""></td>
                       <td><button  class="btn-xs btn-link"   type="submit" onClick="Insert()" style="DISPLAY:none"><i class="fas fa-plus-circle"></i></button>           
                       <button class="btn-xs btn-link" type="submit" onClick="Updatename()" style="DISPLAY:none"><i class="fas fa-edit"></i></button></td>
                       
                       </tr>
                      </form>
                      </tfoot>
                       </table>        
                                </div>
                            </div>
                        </div>

                        <div class="card" style="width: 250px">
                            <div class="card-header" role="tab" id="headingTwo">
                                <a role="button" class="collapsed panel-title text-black" data-toggle="collapse" data-parent="#bootstrap-accordion_1" data-core="" href="#collapse2_1" aria-expanded="false" aria-controls="collapse2">
                                    <h4 class="mbr-fonts-style mbr-fonts-style display-5">
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span> 閱讀狀態
                                    </h4>
                                </a>

                            </div>
                            <div id="collapse2_1" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body p-4">
                                    <p class="mbr-fonts-style panel-text display-7">
                                        
                                    </p>
                                </div>
                            </div>
                        </div>








                    </div>
                </div>
                <!--  <button class="btn-xs btn-link" type="button" onClick="setup()"><i class="fab fa-whmcs"></i></button>-->
  <!-- 按鈕處--><span class="mbr-iconfont pr-2 mbri-setting" onClick="setup()" style="font-size: 40px;" media-simple="true"></span>
               <form id="a2a" name="checkboxmyForm" style="width:200%">
<!-- 這裡修改memID=抓使用者的 -->
                <div id="aaa" style="DISPLAY:none">
                <input  type="hidden" id="memID" name="memID" value="${LoginOK.memId}">
                <select name="BCID">
　                            <!-- <option value="Taipei">台北</option> -->
　                           </select>
                 <button class="btn-xs btn-link" type="button" onClick="checkbox()" style="DISPLAY:none"><i class="fas fa-edit"></i></button>
                <button type="button" style="DISPLAY:none" onClick="Deletecheckbox()" class="btn-xs btn-link"><i class="fas fa-trash-alt"></i></button>
                </div>
                <div id="show" class="row" >
      
                </div>
                </form>
                
                </div>
            </div>
       
    </section>
    <div >
 </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="${pageContext.request.contextPath}/assets/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/tether/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/smooth-scroll/smooth-scroll.js"></script>
    <script src="${pageContext.request.contextPath}/assets/viewport-checker/jquery.viewportchecker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/theme/js/script.js"></script>
<script>

$(document).ready(function() {
	//使用者會員下拉式選單
	//使用者會員memID=1
	$.getJSON("${pageContext.request.contextPath}/selectbookcase.controller?memID=${LoginOK.memId}",function(data) {
		
		var tb=$('#a2a>div>select');
		$.each(data,function(idx,product){
			var BCname=product.BCname;
			var cell1 = $("<option  value="+product.BCID+">"+product.BCname+"</option>");
			tb.append(cell1);
		})
		
	})
//此網頁的會員資料-顯示書庫
//這裡修改memID=	
	$.getJSON("${pageContext.request.contextPath}/selectbookcase.controller?memID=${LoginOK.memId}",function(data) {
		//console.log(data);
		//var docFrag = document.createDocumentFragment();不能用
		var tb=$('#productTable>tbody');
		  $.each(data,function(idx,product){
				//alert(product.BCID);
               // var cell2 = $("<h1>" +product.BCname+"</h1>");
              var BCID=product.BCID;
              var BCname=product.BCname;
              //alert(BCname);
                var cell1 = $("<td>"+"<a href='#' onClick='MyFunction("+BCID+")'>"+product.BCname+"</a>"+"</td>");
               // ${pageContext.request.contextPath}/selectcollectionBookId.controller?memID=1&BCID="+product.BCID+"
                //var cell5 = $("<td>"+"<button onClick='Update("+BCID+")'>"+"</button>"+"</td>");
              var cell5 = $('<td></td>').html('<button onClick="Update('+BCID+')" class="btn-xs btn-link" style="DISPLAY:none"><i class="fas fa-pencil-alt"></i></button><button style="DISPLAY:none" onClick="Delete('+BCID+')" class="btn-xs btn-link"><i class="fas fa-trash-alt"></i></button>');
               
               
               //var cell6 = $('<td></td>').html('<form><tr><td><input style="width:50px" type="text" id="memID" name="memID" value=""></td></tr></form>');
               //var row1 = $('<tr></tr>').append(cell6);
               var row = $('<tr></tr>').append([cell1,cell5]);
               
                //eleAA.append();
               tb.append(row);      
			});
		  
	
	});
	
	
	
})
//隱藏顯示按鈕
setup=function(){
	//alert("123");
	//aaa.style.display=aaa.style.display=='none'?'':'none'
	$("#aaa").toggle();
	//$("#aaa").css("display","inline");
	$("input").toggle();
	
	$("button").toggle();
	
}
Deletecheckbox=function(){
	//alert("123");
	var datas = $('form[name="checkboxmyForm"]').serializeArray() ;
	//console.log(datas);
	var names = $("input[type='checkbox']:checked");
	var i=0;
	for(;i<names.length;i++){
		//alert(names[i].value); 
	$.post("${pageContext.request.contextPath}/deleteCollection.controller",{memID:datas[0].value,BookId:names[i].value},function(data) {
	})
	}
	alert("刪除成功");
	window.location.reload();
}
//選擇多本書
checkbox=function(){
    var datas = $('form[name="checkboxmyForm"]').serializeArray() ;
	console.log(datas);
    var names = $("input[type='checkbox']:checked");
	var i=0;
	for(;i<names.length;i++){
	//alert(names[i].value); //抓書的質
	$.post("${pageContext.request.contextPath}/UpdateBBkcase.controller",{memID:datas[0].value,BCID:datas[1].value,BookId:names[i].value},function(data) {
	})
	}
	alert("新增成功");
}
//更新書放到書庫
Updatename=function(){
	var datas = $('form[name="myForm"]').serialize();
	
	$.post("${pageContext.request.contextPath}/UpdatebookcaseName.controller",datas,function(data) {
		
		 })
		 alert("更新成功");
	window.location.reload();

}
//新增書庫
Insert=function(){
	var datas = $('form[name="myForm"]').serialize();
	$.post("${pageContext.request.contextPath}/bookcaseInsert.controller",datas,function(data){ 		    		

  	});
	
	alert("新增成功");
	window.location.reload();
}
//刪除書庫
Delete=function(a){
	//alert(a);
	$.get('${pageContext.request.contextPath}/bookcasedelete.controller',{BCID:a})
          alert("刪除成功");
	window.location.reload();
	
}
//更新書庫名
Update=function(a){
	//alert(a);
	$.getJSON("${pageContext.request.contextPath}/selectbookcaseName.controller",{'BCID': a},function(data) {
		$("#BCID").val(data.BCID); 
		$("#BCname").val(data.BCname); 
		
		 })
}

//顯示 此網頁的會員資料
MyFunction=function(a){
	myDiv = document.getElementById("show");
	while(myDiv.hasChildNodes()){
		myDiv.removeChild(myDiv.lastChild);
				}
	
//這裡修改此網頁的會員memID=
	$.getJSON("${pageContext.request.contextPath}/selectcollectionBookId.controller?memID=${LoginOK.memId}&BCID="+a+"",function(data) {
		//console.log(data);
		 var tb=$('#show');
		      $.each(data,function(idx,product){
			   //alert(product.bookId);
			    $.getJSON("${pageContext.request.contextPath}/selectbookcaseName.controller?BCID="+product.BCID,function(datas) {
			    	 var eleDiv5 = document.createElement("div")
			    	
				    	eleDiv5.append(document.createTextNode("#"+datas.BCname));
			    	 var eleA2= document.createElement("a");//超連結
			    	 eleA2.setAttribute("href","");
			    	 eleA2.append(eleDiv5);
			    	 
			  
            
				
			  
			  $.getJSON("${pageContext.request.contextPath}/selectbook.controller?bookId="+product.bookId,function(test) {
				  var docFrag = document.createDocumentFragment();
				  var eleImg = document.createElement("img");
				  $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+test.bookId);          
				  $(eleImg).css("height","100");
				  $(eleImg).css("width","100");
				  $(eleImg).css("margin","auto");
				  $(eleImg).className="card-img-top";
				  var eleDiv = document.createElement("div");
				  var eleDiv1 = document.createElement("div");//外
				  var eleDiv2 = document.createElement("div");//內
				  var eleDiv3 = document.createElement("div");//內
				  //col-lg-3 col-md-4 col-sm-6
				  eleDiv.className="col-md-4  portfolio-item"
				  eleDiv1.className="card h-100";
				  eleDiv2.className="card-body"
				  var eleSpan2= document.createElement("span");//內容
				  var eleA= document.createElement("a");//超連結
				  var eleinput = document.createElement("input");
				  eleinput.setAttribute("type","checkbox");
				  $(eleinput).css("display","none");
				  
				
				  eleinput.setAttribute("name","bookId")
				  eleinput.setAttribute("value",test.bookId)
				  eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+test.bookId);
				  //eleSpan2.className="card-title";
				  //eleSpan2.appendChild(eleA);
				  eleSpan2.append(eleinput);
				  eleSpan2.appendChild(document.createTextNode(test.title));
				  eleSpan2.append(eleA2);
			
				  eleDiv3.append(eleA);
				  eleA.append(eleImg);
				  eleDiv2.append(eleDiv3);
				  eleDiv2.append(eleSpan2);				 
				  eleDiv1.append(eleDiv2);				  
				  eleDiv.append(eleDiv1);  
				  docFrag.append(eleDiv);
				  tb.append(docFrag); 
				  
				  
			});
			  
			    })	  
			  
			  
			});
		 
		  
	});
	
	
               }
//此網頁會員全部的書
$(document).ready(function() {
	myDiv = document.getElementById("show");
	while(myDiv.hasChildNodes()){
		myDiv.removeChild(myDiv.lastChild);
				}
   //這裡修改 此網頁會員 memID=	
	         $.getJSON("${pageContext.request.contextPath}/selectallbook.controller?memID=${LoginOK.memId}",function(data) {
		     //console.log(data);
		
		     var tb=$('#show');
		       $.each(data,function(idx,product){
			   //alert(product);
			 //console.log(product);
			  
			    	
			    var eleA2= document.createElement("a");//超連結
			   var eleDiv5 = document.createElement("div")
				eleDiv5.append(document.createTextNode("#"));
			   eleA2.setAttribute("href","");
			   eleA2.append(eleDiv5);
			  
			  
			   
			  $.getJSON("${pageContext.request.contextPath}/selectbook.controller?bookId="+product.bookId,function(test) {
				  //alert(test); 
				  //console.log(test.bookId);
				  var docFrag = document.createDocumentFragment();
				  var eleImg = document.createElement("img");
				  $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+test.bookId);          
				  $(eleImg).css("height","100");
				  $(eleImg).css("width","100");
				  $(eleImg).css("margin","auto");
				  $(eleImg).className="card-img-top";
				  var eleDiv = document.createElement("div");
				  var eleDiv1 = document.createElement("div");//外
				  var eleDiv2 = document.createElement("div");//內
				  var eleDiv3 = document.createElement("div");//內
				  //col-lg-3 col-md-4 col-sm-6
				  eleDiv.className="col-md-4  portfolio-item"
				  eleDiv1.className="card h-100";
				  eleDiv2.className="card-body"
				  var eleSpan2= document.createElement("span");//內容
				  var eleA= document.createElement("a");//超連結
				  var eleinput = document.createElement("input");
				  eleinput.setAttribute("type","checkbox");
				  $(eleinput).css("display","none");
				  
				
				  eleinput.setAttribute("name","bookId")
				  eleinput.setAttribute("value",test.bookId)
				  eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+test.bookId);
				  //eleSpan2.className="card-title";
				  //eleSpan2.appendChild(eleA);
				  eleSpan2.append(eleinput);
				  eleSpan2.appendChild(document.createTextNode(test.title));
				  eleSpan2.append(eleA2);
			
				  eleDiv3.append(eleA);
				  eleA.append(eleImg);
				  eleDiv2.append(eleDiv3);
				  eleDiv2.append(eleSpan2);				 
				  eleDiv1.append(eleDiv2);				  
				  eleDiv.append(eleDiv1);  
				  docFrag.append(eleDiv);
				  tb.append(docFrag); 
				  
				 
				 
			});
			  
		  
			});
	  
	});
	

}) 

function showReview(){
	window.location.href="${pageContext.request.contextPath}/Showreview.controller?memId=${LoginOK.memId}";  
}
</script>
</body>
</html>