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
<%@ page import="java.util.*" %>
<%@ page import="model.dao.*" %>
<%

ApplicationContext context = (ApplicationContext)
application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

// AdverDaoJdbc memberDao = (AdverDaoJdbc) context.getBean("adverDaoJdbc");
// AdverBean ab = memberDao.queryAdById(4);
// out.println("<h3>"+ab+"</h3>");
// ProductDAO productDao = (ProductDAO) context.getBean("productDAO");
// List<ProductBean> bean= productDao.selectBookbyName("論文");
// out.println("<h3>select="+bean+"</h3>");
// out.println("<h3>select="+bean+"</h3>");
// MemberDAOHibernate memberDao = (MemberDAOHibernate) context.getBean("memberDAOHibernate");
// MemberBean ii= memberDao.selectByEmail("John@yahoo.com.tw");
// // Integer ii= memberDao.selectByEmail("John@yahoo.com.tw");
// out.println("<h3>ii= "+ii+"</h3>");
// MemberBean bean3 = memberDao.select(2);
// out.println("<h3>select="+bean3+"</h3>");
// List<MemberBean> bean4 = memberDao.select();
// out.println("<h3>select="+bean4+"</h3>");

CollectionDAO collectionDAO= (CollectionDAO)context.getBean("collectionDAO");
List<Object[]> temp= collectionDAO.selectmemByBookId(1);
out.println(temp.get(0)[1]);
%>

</body>
</html>