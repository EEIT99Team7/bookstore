package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import model.ProductBean;
import model.dao.ProductDaoJdbc;


@WebServlet("/ShowSingleProductServletTest")
public class ShowSingleProductServletTest extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private ProductDaoJdbc pdj;
    
    public ShowSingleProductServletTest() {
      
    }

    
	@Override
	public void init() throws ServletException {
		//此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext().getAttribute(
				WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		pdj = (ProductDaoJdbc)context.getBean("productDaoJdbc");
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookIdStr = request.getParameter("bookId");
		Integer bookId = 0;
		if(bookIdStr!=null){
			bookId = Integer.parseInt(bookIdStr);
		}
		try {
			
			ProductBean productBean= pdj.queryBookById(bookId);
			request.setAttribute("bookBean", productBean);
			request.getRequestDispatcher("showsingleProductTest.jsp")
					.forward(request, response);
		}catch(SQLException e){
			System.out.println("查不到單本書");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
