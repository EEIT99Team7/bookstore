<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.hibernate.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.*" %>
<%@ page import="model.dao.*" %>
<%@ page import="java.util.*" %>
<%

ApplicationContext context = (ApplicationContext)
application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);


// MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
// MemberBean MemberBean = memberDao.selectBymemberID(1);
// List<MemberBean> beanList = memberDao.selectAll();
// out.println("<h3>select="+MemberBean+"</h3>");


//test forgotpassword
//1. MemberDaoJdbc
MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
MemberBean memberBean1 = memberDao.selectBymemberEmail("11@ddd");
out.println("<h3>1. MemberDaoJdbc  select="+memberBean1+"</h3><br/>");

//2.MemberService
MemberService memberService = (MemberService) context.getBean("memberService");
MemberBean memberBean2 = memberService.forgotPassword("11@ddd");
out.println("<h3>2.MemberService select="+memberBean2+"</h3>");

%>

<c:forEach var="testIde" varStatus="stvar" items="skk,ccc,bbb,ddd,aaa,hehehe,hahaha">
<%-- <h2>${stvar.index}</h2> --%>
<%-- <h2>${stvar.count}</h2> --%>
</c:forEach>
</body>
</html>