<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的書評</title>
<!-- Bootstrap core CSS -->
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/shop-homepage.css"
	rel="stylesheet">
<!-- 限制內容字數 css  -->
<link href="${pageContext.request.contextPath}/css/ellipsis.css"
	rel="stylesheet">
<!-- 顯示邊界 調整DIV用 -->

<link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">

</head>
<body>
	<!-- 引用共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />
	<br><br>
	
	<div class="container">
		<div id='content'>
<%-- 			<Form action="<c:url value="/Showreview.controller" />" method="get"> --%>
				<div> </div>
				<table class="table" id="reviewTb">
					<thead class="thead-dark">
						<tr>
							<th scope="col" width="370px">書名</th>
							<th scope="col">內容</th>
							<th scope="col" width="230px">評論時間</th>
							<th scope="col" width="70px">評分</th>
							<th scope="col" width="120px"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${review}" varStatus="var">
							<tr>
								<td>${review.title}</td>
								<td>${review.content}</td>
								<td>${review.make}</td>
								<td>${review.score} 分</td>
								<td>
									<Form action="<c:url value="/reviewstatus.controller" />" method="post">
									<button type="button" class="btn btn-success"
										data-toggle="modal" data-target="#exampleModal"
										data-title="${review.title}" data-content="${review.content}" data-review="${review.reviewId}" data-mem="${review.memId}"><i class="fas fa-pencil-alt"></i></button>
									<input type="hidden" name="reviewId" value="${review.reviewId}">
									<input type="hidden" name="memId" value="${review.memId}">
									<button type="submit" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
									</Form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div style="text-align:center">
				<button type="button" class="btn btn-info" onclick="gopage()">上一頁</button>
				</div>
<!-- 			</Form> -->
		</div>
	</div>
	<form action="<c:url value="/Showreview.controller" />" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">修改書評</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">書名:</label>
							<div>
								<input type='hidden' name='reviewId' id="hidden">
								<input type='hidden' name='memId' id="hidden1">
								
								<span id="recipient-name"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">內容:</label>
							<textarea class="form-control" id="message-text"
								style="resize: none; height: 150px" name="content"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="send">送出</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 引用共同footer -->
	<jsp:include page="/webs/nav/footer.jsp" />
	<!-- Bootstrap core JavaScript -->

	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var title = button.data('title')
			var content = button.data('content')
			var review = button.data('review')
			var memId = button.data('mem')
			var modal = $(this)
			modal.find('.modal-body span').text(title)
			modal.find('.modal-body textarea').val(content)
			modal.find('#hidden').val(review)
			modal.find('#hidden1').val(memId)
			
		})
		
		function gopage(){
			window.location.href = "${pageContext.request.contextPath}/Members/Self.jsp";
		}
		
		
		
	</script>
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>