<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

MemberDAOHibernate memberDao = (MemberDAOHibernate) context.getBean("memberDAOHibernate");
MemberBean ii= memberDao.selectByEmail("John@yahoo.com.tw");
// Integer ii= memberDao.selectByEmail("John@yahoo.com.tw");
out.println("<h3>ii= "+ii+"</h3>");
// MemberBean bean3 = memberDao.select(2);
// out.println("<h3>select="+bean3+"</h3>");
// List<MemberBean> bean4 = memberDao.select();
// out.println("<h3>select="+bean4+"</h3>");
%>
</body>
</html>