package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;

import model.CustomerServiceBean;
import model.MemberBean;
import model.dao.CustomerServiceDao;
import model.dao.GetImageImpl;

@WebServlet("/webs/member/customerservice")
public class CustomerServiceShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CustomerServiceDao customerServiceDao;

	public void init() throws ServletException {
		// 此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		customerServiceDao = (CustomerServiceDao) context.getBean("customerServiceDao");

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		// 取得選單狀態
		String status = request.getParameter("status");
		// 取得使用使用者資料
		HttpSession session = request.getSession();
		MemberBean memberBean = (MemberBean) session.getAttribute("LoginOK");
		Integer memId = memberBean.getMemId();

		// 取得查詢結果
		List<CustomerServiceBean> list = customerServiceDao.listAllMsgByMemId(memId);

		//時間格式更改
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		for (CustomerServiceBean bean : list) {
			
			Date reqtime = bean.getRequestTime();
			if(reqtime != null) {
				sdf.format(reqtime);
				bean.setRequestTime(reqtime);
				System.out.println(reqtime);
			}
			
			Date reptime = bean.getResponseTime();
			if(reptime != null) {
				sdf.format(reptime);
				bean.setResponseTime(reptime);
				System.out.println(reptime);
			}
			
		}
		
		// 根據需求回傳值
		// "全部顯示"
		if ("已處理".equals(status)) {
			System.out.println("已處理");
			List<CustomerServiceBean> done = new ArrayList<CustomerServiceBean>();

			for (CustomerServiceBean bean : list ) {
				if(bean.getProcessStatus().contains("已處理")) {
					done.add(bean);
				}
			}
			String jsonDone = new Gson().toJson(done);

			out.write(jsonDone);

		} else if ("未處理".equals(status)) {
			System.out.println("未處理");
			List<CustomerServiceBean> done = new ArrayList<CustomerServiceBean>();

			for (CustomerServiceBean bean : list ) {
				if(bean.getProcessStatus().contains("未處理")) {
					done.add(bean);
				}
			}
			
			System.out.println(done);
			String jsonDone = new Gson().toJson(done);

			
			out.write(jsonDone);

		} else {// 全部顯示
			System.out.println("全部");
			String json = new Gson().toJson(list);
			out.write(json);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
