<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>聯絡客服</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/myaccount.css"
	rel="stylesheet">
<style>
#loadingImg {
	display: none;
}


</style>
</head>
<body>
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<!-- Page Content -->
	<div class="container">
		<span>${OkMsgKey.ChangeOK}</span>
		<div class="row">
			<!--左側方導覽列 -->
			<div class="col-lg-3">
				<h1 class="my-4">會員中心</h1>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/editprofile.jsp"
						class="list-group-item">修改會員資料</a>
				</div>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/changepassword.jsp"
						class="list-group-item">修改密碼</a>
				</div>
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/webs/member/customerservice.jsp"
						class="list-group-item  active">聯絡客服</a>
				</div>

			</div>

			<!-- /.col-lg-9 頁面主內容-->
			<div class="col-lg-9">
				<div class="row">
					<h2 class="col-lg-4">聯絡客服</h2>
				
				</div>
				<Form action="<c:url value='webs/member/customerServiceShow.controller' />"
					method="post" >
					<div class="form-horizontal rm-form form-profile">
						<div id="contentDiv">
							<!-- table放置區 -->
							<select id="select1">
							<option value="全部">全部</option>
							<option value="未處理">未處理</option>
							<option value="已處理">已處理</option>
							</select>
								<!-- Button trigger modal -->
								<button type="button" id="addMsg-btn" class="btn-sm btn-primary" data-toggle="modal" data-target="#addMsg">
								 新增訊息
								</button>	
							<table class="table" id="memberTb">
								<thead>
									<tr>
										<th scope="col" width ="120px">發起時間</th>
										<th scope="col" width ="120px">標題</th>
										<th scope="col" width ="300px">內容</th>
										<th scope="col" width ="80px">狀態</th>
										<th scope="col" width ="120px">回覆時間</th>
										<th scope="col" width ="80px">查看</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody id="memberMsg">
									
								</tbody>
							</table>
						</div>

					</div>
				</Form>
			</div>

			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- Modal 發起 -->
<div class="modal fade" id="addMsg" tabindex="-1" role="dialog" aria-labelledby="addMsgLable" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <Form action="<c:url value='customerMessage.controller' />" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="changeEmailLable">新增訊息</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	  <div class="form-group">
            <label for="recipient-name" class="col-form-label">標題:</label>
            <input type="text" class="form-control" id="recipient-name" name="csTitle">
          </div>
  
   		  <div class="form-group">
            <label for="message-text" class="col-form-label">內文:</label>
            <textarea class="form-control" id="message-text" name="csMessage"></textarea>
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal" >取消</button>
        <button type="submit" class="btn btn-primary" id="changeEmailSubmit">送出</button>
      </div>
      </Form>
    </div>
  </div>
</div>	
	
	
	 <!-- Modal 查看 -->
<div class="modal fade" id="readMsg" tabindex="-1" role="dialog" aria-labelledby="replyMsgLable" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <Form >
      <div class="modal-header">
        <h5 class="modal-title" id="replyMsgLable">查看訊息</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	  <div class="form-group">
            <label for="recipient-name" class="col-form-label">標題:</label>
          <h5 id="readMsgTitle"></h5>  <input id="csidread" type="hidden" name="csId">
        	
          </div>
   		 <div class="form-group">
            <label for="message-text" class="col-form-label">內文:</label>
         <h6 id="originMsg"></h6>
          </div>
   		  <div class="form-group">
            <label for="message-text" class="col-form-label">回覆:</label>
             <h6 id="replyMsg"></h6>
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-dismiss="modal" >關閉</button>
      </div>
      </Form>
    </div>
  </div>
</div>	
	
	
	
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />


	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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

	
	function loadMsg(status){
		var Msgs = $('#memberMsg');
			$.getJSON('customerservice?status=' + status, function(data){
				$.each(data,function(idx,Msg){
					if(Msg.responseTime == null){
						Msg.responseTime = " ";
					}
					if(Msg.replyMsg == null){
						Msg.replyMsg = " ";
					}
					Msgs.append("<tr><td>" + Msg.requestTime + "</td>" +
	                          "<td>" + Msg.csTitle + "</td>"+
	                          "<td>" + Msg.csMessage + "</td>"+
	                          "<td>" + Msg.processStatus + "</td>"+
	                          "<td>" + Msg.responseTime + "</td> "+
	                          "<td> <button" +
	                          "type='button' class='btn btn-primary' data-toggle='modal' data-target='#readMsg'"+
	                          "data-csId='"+ Msg.csId +"'" +
	                          "data-title='"+ Msg.csTitle +"'" +
	                          "data-message='"+ Msg.csMessage +"'" +
	                          "data-replymessage='"+ Msg.replyMsg +"'" +
	                          "data-rspTime='"+ Msg.responseTime +"'" +
	                          ">查看</button> </td></tr>"
					);
				});				
			});
		};
		//個別畫面
		$('#readMsg').on('show.bs.modal', function (event) {
			  var button = $(event.relatedTarget) ;
			  var id = button.attr('data-csId') ;
			  var title = button.attr('data-title') ;
			  var message = button.attr('data-message') ;
			  var replyMsg = button.attr('data-replymessage');
			  var rspTime = button.attr('data-rspTime');
			  
			  var modal = $(this)
			  modal.find('.modal-title').text('回覆時間：' + rspTime);
			  modal.find('#csidread').val(id);
			  modal.find('#readMsgTitle').text(title);
			  modal.find('#originMsg').text(message);
			  modal.find('#replyMsg').text(replyMsg);
			  modal.find('#replyMsg').text(replyMsg);
			})
	</script>
</body>
</html>