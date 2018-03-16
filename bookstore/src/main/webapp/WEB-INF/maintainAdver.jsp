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

	<!-- Page Content    -->
    <div class="container" >
    
    <div class="row">
    
		<!--左側方導覽列 -->
		<jsp:include page="/webs/nav/DBLeftNav.jsp" />
       
        <!-- /.col-lg-9 -->
        <div class="col-lg-9">

		   <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
			   <div class="row">
				   <h2 class="col-lg-4" >廣告管理</h2>			
				   <a class="col-lg-2 offset-lg-6" href="${pageContext.request.contextPath}/AdverInsert.jsp" style="padding-top:15px;">新增廣告</a>
			   </div>
		   </div>
		   <form action="" id="contentForm" method="POST" enctype="multipart/form-data">
		   <div id="contentDiv">		  
		   		<!-- table放置區 -->
			   <table class="table" id="adverTb">
				    <thead>
				    	<tr>
				      		<th scope="col">#</th>
				      		<th scope="col">圖檔名稱</th>
				      		<th scope="col">狀態(0:隱藏  1顯示)</th>
				      		<th scope="col">圖片</th>
				      		<th scope="col"></th>
				    	</tr>
				    </thead>
				    <tbody>
			  			<!--廣告 -->
			  			<c:forEach var="adverBean" items="${AdverBeans}" varStatus="stvar">
			  			    <tr>
						      <th scope="row">${adverBean.id}</th>
						      <td>${adverBean.imgName}</td>
						      <c:choose>
						        <c:when test="${adverBean.status}">
 									<td>顯示</td>
						        </c:when>
						        <c:otherwise>
						           <td>隱藏</td>
						        </c:otherwise>
					          </c:choose>
						      <td><img src="${pageContext.request.contextPath}/getImage?id=${adverBean.id}&type=ADVERTISEMENT" width="140" height="80"/></td>
						      <td><input type="button" class="btn btn-info btnmodify"  value="修改"></td>
						<!--  寫一個Javascript當 btn被按下時 抓取該物件 使用該物件的parents找到tH的text 用該id去呼叫AdverShowUpdateServlet -->
						    </tr>
			  			</c:forEach>
				    </tbody>
			  	</table>
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
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".btnmodify").click(function(){
			var Id = $(this).parent().siblings("th").text()
			console.log("getjson before");
			$.getJSON('AdverShowUpdate.do', {'adverID': Id }, function (data) {	

				var maindiv= $("#contentDiv");
				maindiv.empty();		
				var div1 = $("<div></div>");
				div1.attr('class',"form-group row");
				var label1 = $("<label></label>");
				label1.attr("class","col-sm-2 col-form-label");
				label1.text("廣告ID");
				var div11 = $("<div></div>");
				div11.attr('class',"col-sm-10");
				div11.html('<input class="form-control" type="text" name="adverId" value="' + data.id + '" placeholder="' + data.id + '" readonly>');
				div1.append([label1,div11]);
				
				var div2 = $("<div></div>");
				div2.attr('class',"form-group row");
				var label2 = $("<label></label>");
				label2.attr("class","col-sm-2 col-form-label");
				label2.text("圖檔名稱");
				var div21 = $("<div></div>");
				div21.attr('class',"col-sm-10");
				div21.html('<input class="form-control" type="text" name="imgFilename" id="imgFilename" value="'+data.imgName+'">');
				div2.append([label2,div21]);
	
				var div3 = $("<div></div>");
				div3.attr('class',"form-group row");
				var label3 = $("<label></label>");
				label3.attr("class","col-sm-2 col-form-label");
				label3.text("狀態");
				var div31 = $("<div></div>");
				div31.attr('class',"col-sm-10");
				var label31 = $('<label class="radio-inline"></label>');
				var inRadioEle1 =$('<input type="radio"/>');
				inRadioEle1.attr({"class":"form-control",name:"status",id:"radioture",value:"true"});
				label31.append([inRadioEle1,"顯示"]);
				var label32 = $('<label class="radio-inline"></label>');
				var inRadioEle2 =$('<input type="radio"/>');
				inRadioEle2.attr({"class":"form-control",name:"status",id:"radiofalse",value:"false"});
				label32.append([inRadioEle2,"隱藏"]);
				if(data.status==true){
					inRadioEle1.attr("checked","checked");
				}else{
					inRadioEle2.attr("checked","checked");
				}
				div31.append([label31,label32]);
				//123132
				div3.append([label3,div31]);
				
				var div4 = $("<div></div>");
				div4.attr('class',"form-group row");
				var label4 = $("<label></label>");
				label4.attr("class","col-sm-2 col-form-label");
				label4.text("圖片");
				var div41 = $("<div></div>");
				div41.attr('class',"col-sm-10");
				div41.html('<img height="210" width="450" id="adImg" src="${pageContext.servletContext.contextPath}/getImage?id='+data.id+'&type=ADVERTISEMENT"/>');
				div41.append('<input type="file" class="form-control-file"  name="adImgFile" id="adImgFile" value="">');
				div4.append([label4,div41]);
				
				var btnUpEle =$('<input type="submit">');
				btnUpEle.attr({value:"修改",id:"btnUpdate","class":"btn btn-info"});
				
				var btnDelEle =$('<input type="button">');
				btnDelEle.attr({value:"刪除",id:"btnDelete","class":"btn btn-danger offset-md-4"});
				maindiv.append(div1,div2,div3,div4,btnUpEle,btnDelEle);					
			})
		})
	
		//預覽圖片(Ajax動態加入版)
		$("#contentDiv").on('change','#adImgFile',function(){
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
 		})
 		//按下修改紐時觸發	
 		$("#contentDiv").on('click','#btnUpdate',function(){
			//呼叫AdverUpdate.do 更新廣告
			$("#contentForm").attr("action","AdverUpdate.do");
						
 		})
 		
 		$("#contentDiv").on('click','#btnDelete',function(){
			//呼叫AdverUpdate.do 刪除廣告
			$("#contentForm").attr("action","AdverDelete.do");
			$("#contentForm").attr("enctype","");
			$("#contentForm").submit();
			
 		})
		
 	})
	</script>

  </body>
</html>