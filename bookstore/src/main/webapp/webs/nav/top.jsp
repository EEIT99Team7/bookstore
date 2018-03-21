<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container navcontainer" >
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">社群書店</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
		<form class="form-inline" action="searchBook.controller" method="GET">
    		<input class="form-control mr-sm-2 mysearchcss" type="search" name="bookName" placeholder="輸入書名" aria-label="Search">
    		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">找書</button>
    		<input type="hidden" name="displayType" value="searchBybookName">
    		<input type="hidden" name="category" value="0">
  		 </form>
		<!--上方導覽列 -->
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/searchBook.controller?displayType=allbooks&category=0">找書去</a>
            </li>

            <li class="nav-item active">
              <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">首頁
                <span class="sr-only">(current)</span>
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
          <a class="dropdown-item" href="${pageContext.request.contextPath}/Members/Self.jsp">個人頁面</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/webs/member/editprofile.jsp">會員中心</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/OrderList.jsp">查詢訂單</a>
	    <c:if test="${LoginOK.userType == 'admin'}">
          	<a class="dropdown-item" href="${pageContext.request.contextPath}/MaintainProductServlet">管理資料庫</a>
        </c:if>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/webs/logout.jsp">登出</a>
        </div>
      </li>
           
      </c:if>
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link" href="#">聯絡我們</a> -->
<!--             </li> -->
			<li>
       			<div style=" cursor: pointer;">
<%--        				<A href="<c:url value='ShowCartContentTest.jsp' />" > --%>
	      				<span class="mbr-iconfont mbri-cart-add" style="color: rgb(20, 157, 204); font-size: 40px;"
							media-simple="true" data-toggle="modal" data-target="#exampleModal"></span>
          				<span class="badge badge-notify my-cart-badge" id="shoppingAmount">${ShoppingCart.itemNumber}</span>
<!--         			</A> -->
        			</div>
			</li>
          </ul>
        </div>
      </div>
    </nav>