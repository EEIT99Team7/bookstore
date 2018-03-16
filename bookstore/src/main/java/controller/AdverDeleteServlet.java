package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import model.dao.AdverDaoJdbc;
import model.dao.ProductDaoJdbc;

@WebServlet("/AdverDelete.do")
public class AdverDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private AdverDaoJdbc adj;
		
	@Override
	public void init() throws ServletException {
		//此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext().getAttribute(
				WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		adj = (AdverDaoJdbc)context.getBean("adverDaoJdbc");
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	System.out.println("adverdelete test");
//        	HttpSession session = request.getSession();
        	String aIDStr = request.getParameter("adverId");
    		request.setCharacterEncoding("UTF-8");
    		response.setContentType("text/html; charset=UTF-8");
        	      	
        	int adverID = Integer.parseInt(aIDStr);

			int n = adj.deleteAdver(adverID);
			
//			if (n == 1) {
//				session.setAttribute("BookDeleteMsg", "書籍(" + bID + ")刪除成功");
//			} else {
//				session.setAttribute("BookDeleteMsg", "書籍(" + bID + ")刪除失敗");
//			}
			response.sendRedirect("MaintainProductServlet?type=Adver");
			return;
		}  catch (Exception e) {
			throw new ServletException(e);
		}
        
	}

}
