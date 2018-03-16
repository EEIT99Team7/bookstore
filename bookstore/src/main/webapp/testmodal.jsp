<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" >
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" ></script>

	<script src="${pageContext.request.contextPath}/bootstrap4/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 引用上方共同導覽列 -->
	<jsp:include page="/webs/nav/top.jsp" />


<!-- Button trigger modal -->
<br><br><br>
<!-- fdsfdsa -->
<br>
<br>
<br>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- 使用非按鈕的方式呼叫modal -->
<!-- data-target對應要呼叫的modal的id屬性 -->
<div data-toggle="modal" data-target="#exampleModal">test</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<!--modal內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


</body>