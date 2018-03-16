package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import model.AdverBean;
import model.dao.AdverDaoJdbc;

//此為廣告上傳修改servlet Ajax版
@WebServlet("/AdverShowUpdate.do")
public class AdverShowUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdverDaoJdbc adj;

	public void init() throws ServletException {
		// 此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		adj = (AdverDaoJdbc) context.getBean("adverDaoJdbc");

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String idStr = request.getParameter("adverID");
		Integer adverId;
		// 確保不會是null
		if (idStr != null) {
			adverId = Integer.parseInt(idStr);
		} else {
			adverId = 1;
		}

		AdverBean adverBean = adj.queryAdById(adverId);
		adverBean.setAdverImage(null);
//		System.out.println("adverBean"+adverBean);
		Gson gson1 = new Gson();
		String jsonString1 = gson1.toJson(adverBean);
		out.println(jsonString1);

	}
}
