package controller;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import model.AdverBean;
import model.ProductBean;
import model.dao.AdverDaoJdbc;
import model.dao.ProductDaoJdbc;

//動態產生的首頁servlet
@WebServlet("/index.jsp")
public class FrontpageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private AdverDaoJdbc adverDaoJdbc;
	private ProductDaoJdbc productDaoJdbc;
//	private MemberDAOHibernate memberDAOHibernate;
    public FrontpageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		//此為sping版本的初始化方法。
			ApplicationContext context = (ApplicationContext) this.getServletContext().getAttribute(
					WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			adverDaoJdbc = (AdverDaoJdbc) context.getBean("adverDaoJdbc");
			productDaoJdbc = (ProductDaoJdbc)context.getBean("productDaoJdbc");
//			memberDAOHibernate = (MemberDAOHibernate)context.getBean("memberDAOHibernate");
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//測試用 取得一個session，存放訪客未登入時購物資訊
		HttpSession session;
		if(request.getSession(false)==null) {

		session	= request.getSession();	

		}else {
			session=request.getSession(false);
		}
		
		//測試用 假裝會員已經登入
//		MemberBean memberBean = memberDAOHibernate.select(1);
//		session.setAttribute("LoginOK", memberBean);
		
		//取得廣告圖總數量
		long adcounts = adverDaoJdbc.getRecordCounts();
		request.setAttribute("adcounts", adcounts);

		//取得裝滿廣告的Bean 每一個Bean裝有單一廣告的所有資訊。
		Collection<AdverBean> coll = adverDaoJdbc.getAdvertisements();
		//將Bean放入Request Scope， 讓首頁能使用EL讀取。
		request.setAttribute("adver_FPS", coll);
		//取得裝滿書籍資訊的Bean 每一個Bean裝有單一書籍的所有資訊。
		Collection<ProductBean> ProductBeans = productDaoJdbc.selectAll();
		request.setAttribute("ProductBeans", ProductBeans);
		
		
		request.getRequestDispatcher("WEB-INF/index.jsp")
		 	.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
