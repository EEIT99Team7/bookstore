<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">社群書店</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        
	<!--上方導覽列 -->
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">首頁<span class="sr-only">(current)</span>
              </a>
            </li>
            <c:if test="${empty LoginOK}">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/webs/login.jsp">登入</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/webs/register.jsp">註冊</a>
            </c:if>
            <c:if test="${! empty LoginOK}">
            <li class="nav-item">
             
            </li>
            <li class="nav-item dropdown">
            
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img height='40px' width='40px' src='${pageContext.request.contextPath}/getImage?id=${LoginOK.memId}&type=MEMBER'>&nbsp;${LoginOK.userName}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/webs/member/editprofile.jsp">修改會員資料</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/webs/logout.jsp">登出</a>
        </div>
      </li>
           
             </c:if>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">聯絡我們</a>
            </li>
            <li class="nav-item">
	<!--呼叫controller.DisplayMaintainProducts.java -->
              <a class="nav-link" href="${pageContext.request.contextPath}/MaintainProductServlet?type=BOOK">管理資料庫</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>