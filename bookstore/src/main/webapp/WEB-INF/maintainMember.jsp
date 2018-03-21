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

    <title>會員管理</title>

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
				   <h2 class="col-lg-4" >會員管理</h2>			
			   </div>
		   </div>
		   <form id="contentForm" >
		   <div id="contentDiv">		  
		   			<!-- table放置區 -->
							<select id="select1">
							<option value="全部">全部</option>
							<option value="未處理">未處理</option>
							<option value="已處理">已處理</option>
							</select>
							
							<table class="table" id="memberTb">
								<thead>
									<tr>
										<th scope="col" width ="120px">發起時間</th>
										<th scope="col" width ="100px">會員名稱</th>
										<th scope="col" width ="120px">標題</th>
										<th scope="col" width ="300px">內容</th>
										<th scope="col" width ="80px">狀態</th>
										<th scope="col" width ="40px" >回覆</th>
										
									</tr>
								</thead>
								<tbody id="memberMsg">
									
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
    <!-- Modal -->
<div class="modal fade" id="replyMsg" tabindex="-1" role="dialog" aria-labelledby="replyMsgLable" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <Form action="<c:url value='customerMessageReply.controller' />" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="replyMsgLable">新增訊息</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	  <div class="form-group">
            <label for="recipient-name" class="col-form-label">標題:</label>
          <h5 id="replyMsgTitle"></h5>  <input id="csidcall" type="hidden" name="csId">
        
          </div>
   		 <div class="form-group">
            <label for="message-text" class="col-form-label">內文:</label>
         <h6 id="replyMsg1"></h6>
          </div>
   		  <div class="form-group">
            <label for="message-text" class="col-form-label">回覆:</label>
            <textarea class="form-control" id="message-text" name="replyMessage"></textarea>
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal" >取消</button>
        <button type="submit" class="btn btn-primary" id="replySubmit">送出</button>
      </div>
      </Form>
    </div>
  </div>
</div>	
	


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
	
<script>
	$(document).ready(function(){
		var status = '全部';
		loadMsg(status);
		
	});
	
	$('#select1').change(function(){
		var status = $('#select1').find("option:selected").val();
		var Msgs = $('#memberMsg');
		 $("#memberMsg tr").remove(); 
		loadMsg(status);
	});

	//讀取產品
	function loadMsg(status){
		var Msgs = $('#memberMsg');
			$.getJSON('webs/member/customerserviceadmin?status=' + status, function(data){
				$.each(data,function(idx,Msg){
					Msgs.append("<tr><td>" + Msg.requestTime + "</td>" +
	                          "<td>" + Msg.userName + "</td>"+
	                          "<td>" + Msg.csTitle + "</td>"+
	                          "<td>" + Msg.csMessage + "</td>"+
	                          "<td>" + Msg.processStatus + "</td>" +
	                          "<td> <button" +
	                          "type='button' class='btn btn-primary' data-toggle='modal' data-target='#replyMsg'"+
	                          "data-csId='"+ Msg.csId +"'" +
	                          "data-title='"+ Msg.csTitle +"'" +
	                          "data-message='"+ Msg.csMessage +"'" +
	                          ">回覆</button> </td></tr>"
	                          
					);
				});				
			});
		};
	
	//個別畫面
	$('#replyMsg').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) ;
		  var id = button.attr('data-csId') ;
		  var title = button.attr('data-title') ;
		  var message = button.attr('data-message') ;
		  
		  var modal = $(this)
		  modal.find('.modal-title').text('回覆訊息至：' + id);
		  modal.find('#csidcall').val(id);
		  modal.find('#replyMsgTitle').text(title);
		  modal.find('#replyMsg1').text(message);
		})
	</script>
  </body>
</html>