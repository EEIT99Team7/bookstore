<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--用於管理書籍、廣告的左方導覽列 -->
<div class="col-lg-3">
	<h1 class="my-4">管理系統</h1>
	<div class="list-group">
	  <a href="${pageContext.request.contextPath}/MaintainProductServlet?type=BOOK" class="list-group-item">書籍管理</a>
	  <a href="#" class="list-group-item">類別管理</a>
	  <a href="${pageContext.request.contextPath}/MaintainProductServlet?type=ADVER" class="list-group-item">廣告管理</a>
	  <a href="${pageContext.request.contextPath}/MaintainProductServlet?type=REVIEW" class="list-group-item">書評管理</a>
	</div>
</div>