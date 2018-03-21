<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${member.nickName}</title>

    
	
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/tether/tether.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/assets3/bootstrap/css/bootstrap-grid.min.css">
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
	padding-right:3px;
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
                    <h2 class="mbr-section-title pb-3 align-left mbr-fonts-style display-2">${member.userName}</h2>
                    <h3 class="mbr-section-subtitle pb-5 align-left mbr-fonts-style display-5">${member.description}</h3>
                    <div class="mbr-figure">
                        <img src="${pageContext.request.contextPath}/getImage?id=${member.memId}&type=MEMBER" >
                    </div>
                </div>
                <div class="cards-block"  style="padding-top:150px;padding-left:200px">
                    <div class="cards-container">
                        <div class="card px-6 align-left col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <span class="mbr-iconfont pr-2 mbri-hearth" style="font-size: 60px;" media-simple="true"></span>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                        39
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">成為${member.userName}粉絲</h4>
                                    <p class="mbr-content-text mbr-fonts-style display-7">
                                                                                        
                                    </p>
                                </div>
                            </div>
                        </div>
                       
                        <div class="card px-6 align-left col-md-6">
                            <div class="panel-item p-3">
                                <div class="card-img pb-3">
                                    <a href="http://www.books.com.tw/products/0010776691?loc=P_004_1_002"><span class="mbr-iconfont pr-2 mbri-edit" style="font-size: 60px;" media-simple="true"></span></a>
                                    <h3 class="count py-3 mbr-fonts-style display-2">
                                        100
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">${member.userName}的書評</h4>
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
                                        5
                                    </h3>
                                </div>
                                <div class="card-text">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                                                           ${member.userName}的小圈圈
                                    </h4>
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
                                        50
                                    </h3>
                                </div>
                                <div class="card-texts">
                                    <h4 class="mbr-content-title mbr-bold mbr-fonts-style display-7">
                                                                                    ${member.userName}的追蹤者
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
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span>${member.userName}的書庫
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
                       <!-- <input style="width:150px;DISPLAY:none" type="text"  id="BCname" name="BCname" placeholder="新增/修改我的書櫃" onblur="InsertName()"  >-->  
<!-- 這裡修改memID=抓使用者的--><input type="hidden" id="memID" name="memID" value="${LoginOK.memId}">
                       <input type="hidden" id="BCID" name="BCID" value=""></td>
                       <!--  <td><button  class="btn-xs btn-link"   type="submit" onClick="Insert()" style="DISPLAY:none"><i class="fas fa-plus-circle"></i></button>-->           
                       <!--<button class="btn-xs btn-link" type="submit" onClick="Updatename()" style="DISPLAY:none"><i class="fas fa-edit"></i></button></td>-->
                       
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
                                        <span class="sign mbr-iconfont mbri-arrow-down inactive"></span> ${member.userName}的狀態
                                    </h4>
                                </a>

                            </div>
                            <div id="collapse2_1" class="panel-collapse noScroll collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body p-4">
                                    <p class="mbr-fonts-style panel-text display-7">
                                                                                正在讀
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


	<!-- 購物車Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog  modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">購物車內容</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<!--modal購物車彈跳視窗內容 -->
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">書籍圖片</th>
				      <th scope="col">書籍名稱</th>
				      <th scope="col">價格</th>
				      <th scope="col">數量</th>
				      <th scope="col">小計</th>
				    </tr>
				  </thead>
				  <tbody id="addToShoppingcart">
					<c:forEach varStatus="vs" var="anEntry" items="${ShoppingCart.content}">
	        			<TR height="16">
	        			<TD align="center"><img src="${pageContext.request.contextPath}/bookimg.controller?bookId=${anEntry.value.bookID}" width="90" height="120"></TD>
	         			<TD align="center">${anEntry.value.title}</TD>
	          			<TD align="center" ><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount }" pattern="#,###" /></TD>
	         			<TD align="center" >
	                		<Input id="newQty${vs.index}" style="width:28px;text-align:right" name="newQty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />" onkeypress="return isNumberKey(event)"  />
	          			</TD>	          			
	          			<TD style="text-align:;"><fmt:formatNumber value="${anEntry.value.price * anEntry.value.discount * anEntry.value.qty}" pattern="#,###,###" /></TD>
	          			<TD style="display:none;">
	          				<Input id="hiddenQty${vs.index}" style="width:28px;text-align:right" name="hiddenqty" type="text" value="<fmt:formatNumber value="${anEntry.value.qty}" />"  />
	          			</TD>
	          			<TD ><Input type="button" class="btn btn-success" style="padding:10px" name="update" value="修改" onClick="modify(${anEntry.key}, ${anEntry.value.qty}, ${vs.index})">
	               			<Input type="button" class="btn btn-danger" style="padding:10px;margin-left:12px" name="delete" value="刪除" onClick="confirmDelete(${anEntry.key},${vs.index})"></TD>
	        			</TR>
	     			</c:forEach>
	     				<TR height='16'>
	     					<TD class="font-weight-bold" id="subTotal" colspan="5" align="right">總計&nbsp&nbsp:&nbsp&nbsp<span><fmt:formatNumber value="${ShoppingCart.subtotal }" pattern="#,###,###" /></span>元</TD>
	     				</TR>
				  </tbody>
				</table>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
	        <button type="button" class="btn btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/ShowCartContentTest.jsp'">結帳</button>
	      
	      </div>
	    </div>
	  </div>
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
	$.getJSON("${pageContext.request.contextPath}/selectbookcase.controller?memID=${member.memId}",function(data) {
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
             // var cell5 = $('<td></td>').html('<button onClick="Update('+BCID+')" class="btn-xs btn-link" style="DISPLAY:none"><i class="fas fa-pencil-alt"></i></button><button style="DISPLAY:none" onClick="Delete('+BCID+')" class="btn-xs btn-link"><i class="fas fa-trash-alt"></i></button>');
               
               
               //var cell6 = $('<td></td>').html('<form><tr><td><input style="width:50px" type="text" id="memID" name="memID" value=""></td></tr></form>');
               //var row1 = $('<tr></tr>').append(cell6);
               var row = $('<tr></tr>').append(cell1);
               
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
		alert(names[i].value); 
	$.post("${pageContext.request.contextPath}/deleteCollection.controller",{memID:datas[0].value,BookId:names[i].value},function(data) {
	})
	}
	alert("刪除成功");
	window.location.reload();
}
//選擇多本書
checkbox=function(){
    var datas = $('form[name="checkboxmyForm"]').serializeArray() ;
	//console.log(datas);
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
	
	
               }
//此網頁會員全部的書
$(document).ready(function() {
	myDiv = document.getElementById("show");
	while(myDiv.hasChildNodes()){
		myDiv.removeChild(myDiv.lastChild);
				}
   //這裡修改 此網頁會員 memID=	
	         $.getJSON("${pageContext.request.contextPath}/selectallbook.controller?memID=${member.memId}",function(data) {
		     //console.log(data);
		
		     var tb=$('#show');
		       $.each(data,function(idx,product){
			   //alert(product.bookId);
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

//購物車相關
function confirmDelete(n,index) {
	
	if (confirm("確定刪除此項商品 ? ") ) {
		var x = "#newQty" + index;
		var tempprice = $(x).parent().next().text().replace(/,/g,"");
		console.log(tempprice);
		$.get('UpdateItem.do', {'cmd':'DEL','async':'ajax','bookID': n }, function (data) {
 			$(x).parent().parent().remove();			
 			var tempsubtotal = $("#subTotal span").text().replace(/,/g,"");
 			console.log(tempsubtotal);
 			$("#subTotal span").text("");
 			$("#subTotal span").text(new Intl.NumberFormat("en-US").format(tempsubtotal-tempprice));
			//更改右上角購物車顯示的物品數量
 			$('#shoppingAmount').text($('#shoppingAmount').text()-1);
		})
				
	} else {
	
	}
}
function modify(key,nothing, index) {
	var x = "newQty" + index;
	var x1 = "#newQty" + index;
	var newQty =$(x1).val();
	var oldQtyEle ="#hiddenQty"+index;
	var oldQty =$(oldQtyEle).val();
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == oldQty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + oldQty + " 改為 " + newQty + " ? ") ) {
		//透過async=ajax呼叫後端不更新頁面程式
		$.get('UpdateItem.do', {'cmd':'MOD','async':'ajax','bookID': key , 'newQty':newQty }, function (data) {
						
// 			//小計
			var totalTemp =parseInt($("#subTotal span").text().replace(/,/g,""));
			//單品價格
			var priceEle = $(x1).parent().prev();
			var priceTemp =  parseInt(priceEle.text().replace(/,/g,""));
			//修改後的數量
			var newQtyTemp =  parseInt(newQty);
			//原先的數量
			var qtyTemp =  parseInt(oldQty);
			//更新數量
			$(x1).val(newQtyTemp);
			$(oldQtyEle).val(newQtyTemp);
			//更新小計						
			$(x1).parent().next().text(new Intl.NumberFormat("en-US").format(priceTemp*newQtyTemp));
			//更新總計
			$("#subTotal span").text(new Intl.NumberFormat("en-US").format(totalTemp-(priceTemp*qtyTemp)+(priceTemp*newQtyTemp)));
		})
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode<48||charCode>57)){
      return false;
   }
   return true;
}





</script>
</body>
</html>