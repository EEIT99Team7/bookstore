<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="org.springframework.web.context.WebApplicationContext"%>
	<%@ page import="org.springframework.context.ApplicationContext"%>
	<%@ page import="org.hibernate.*"%>
	<%@ page import="javax.sql.DataSource"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.*"%>
	<%@ page import="model.*"%>
	<%@ page import="model.dao.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="misc.*"%>
	
	<%
		ApplicationContext context = (ApplicationContext) application
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

		// MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
		// MemberBean MemberBean = memberDao.selectBymemberID(1);
		// List<MemberBean> beanList = memberDao.selectAll();
		// out.println("<h3>select="+MemberBean+"</h3>");

		//test forgotpassword
		//1. MemberDaoJdbc
// 		MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
// 		MemberBean memberBean1 = memberDao.selectByResetId("");
// 		out.println("<h3>1. MemberDaoJdbc  select="+memberBean1+"</h3><br/>");

		// //2.MemberService
// 		MemberService memberService = (MemberService) context.getBean("memberService");
// 		Boolean bolean = memberService.checkResetId("cfe33741998ee355fd5f3f019feccd6b");
// 		out.println("<h3>2.MemberService select="+bolean+"</h3>");

// 		// //3. testEmailService
// 		EmailService emailService = (EmailService) context.getBean("emailService");
// 		String result = emailService.sendForgotPasswordEmail("rchin1015@gmail.com","123");
// 		out.println("<h3>result="+result+"</h3>");

		// 測試 加密功能
		// 		String password = "12aasdf6";
		// 		String encodePassword = SystemUtils.encryptString(password);
		// 		out.println("<h3>"+encodePassword+"</h3>");

		// 		//測試UUID
		// 		String uuid = UUID.randomUUID().toString();
		// 		String encodePassword = SystemUtils.encryptString(uuid);
		// 		String md5Password = SystemUtils.getMD5Endocing(uuid);
		// 		byte[] b = Base64.getUrlEncoder().encode(md5Password.getBytes());

		// 		//測試base64
		// 		String test = "test123";
		// 		String base64 = Base64.getUrlEncoder().withoutPadding().encodeToString(test.getBytes());

		// 		out.println("<h3>"+uuid+"</h3>");
		// 		out.println("<h3>"+encodePassword+"</h3>");
		// 		out.println("<h3>"+md5Password+"長度:"+md5Password.length()+"</h3>");
		// 		out.println("<h3>"+b+"</h3>");
		// 		out.println("<h3>base64= "+base64+"</h3>");

		// 		//System.currentTimeMillis();
		// 		Long endTime = (System.currentTimeMillis()+1000*60*60*24*3);
		// 		java.util.Date date = new java.util.Date(endTime);
		// 		SimpleDateFormat sdf = new SimpleDateFormat("E yyyy/MM/dd");

		// 		out.println("<h3>endTime= "+endTime+"</h3>");
		// 		out.println("<h3>date= "+date+"</h3>");
		// 		out.println("<h3>SimpleDateFormat= "+sdf.format(date)+"</h3>");

// 		// 		測試forgetPassword
// 		MemberService memberService = (MemberService) context.getBean("memberService");
// 		String url = memberService.createResetId("11ee@ww");
// 		out.println("<h3>url=" + url + "</h3>");
// 		out.println("<h3>長度:"+url.length()+"</h3>");
		
// 				//測試updateRestStatus
// 				MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
// 				memberDao.updateRestStatus("111@ddd", false, null);

		//尋找預設會員圖片
		// 		TestDefaultImg testDefaultImg = (TestDefaultImg) context.getBean("testDefaultImg");
		// 		testDefaultImg.findDefaultImg();
		
		
		// 測試換密碼
// 		MemberDaoJdbc memberDao = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
// 		memberDao.updatePassword("qqq","456");
// 		MemberService memberService = (MemberService) context.getBean("memberService");
// 		Boolean bolean = memberService.changePassword("qqq", "456", "q123");
// 		out.println("<h3>2.MemberService select="+bolean+"</h3>");
// 		out.println("<script>alert(\"已重設密碼，請使用新密碼登入\");window.location.href = './index.jsp';</script>");
		
		String time = "2018/03/13";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		java.util.Date date = sdf.parse(time);
		out.println("<h3>date="+date+"</h3>");
		String formatdate = sdf.format(date);
		out.println("<h3>date="+formatdate+"</h3>");
		
		
		
		


	%>

	<c:forEach var="testIde" varStatus="stvar"
		items="skk,ccc,bbb,ddd,aaa,hehehe,hahaha">
		<%-- <h2>${stvar.index}</h2> --%>
		<%-- <h2>${stvar.count}</h2> --%>
	</c:forEach>
	
	<div class="input-group date" data-provide="datepicker">
    <input type="text" class="form-control">
    <div class="input-group-addon">
        <span class="glyphicon glyphicon-th"></span>
    </div>
</div>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $('.datepicker').datepicker({
	    format: 'mm/dd/yyyy',
	    startDate: '-3d'
	});
  
 
  </script>
</body>
</html>