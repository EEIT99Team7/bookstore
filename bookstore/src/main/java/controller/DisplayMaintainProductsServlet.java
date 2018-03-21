package controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import model.AdverBean;
import model.MemberBean;
import model.ProductBean;
import model.ReviewBean;
import model.dao.AdverDaoJdbc;
import model.dao.MemberDaoJdbc;
import model.dao.ProductDaoJdbc;
import model.dao.ReviewDAOHibernate;

@WebServlet("/MaintainProductServlet")
public class DisplayMaintainProductsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductDaoJdbc productDaoJdbc;
	private AdverDaoJdbc adverDaoJdbc;
	private ReviewDAOHibernate reviewDAOHibernate;
	private MemberDaoJdbc  memberDaoJdbc;

	public void init() throws ServletException {
		// 此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		adverDaoJdbc = (AdverDaoJdbc) context.getBean("adverDaoJdbc");
		productDaoJdbc = (ProductDaoJdbc) context.getBean("productDaoJdbc");
		reviewDAOHibernate = (ReviewDAOHibernate)context.getBean("reviewDAOHibernate");
		memberDaoJdbc = (MemberDaoJdbc) context.getBean("memberDaoJdbc");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// // 先取出session物件
		// HttpSession session = request.getSession(false);
		// // 紀錄目前請求的RequestURI,以便使用者登入成功後能夠回到原本的畫面
		// String requestURI = request.getRequestURI();
		// //System.out.println("requestURI=" + requestURI);
		// // 如果session物件不存在
		// if (session == null || session.isNew()) {
		// // 請使用者登入
		// response.sendRedirect(response.encodeRedirectURL ("../_02_login/login.jsp"));
		// return;
		// }
		// session.setAttribute("requestURI", requestURI);
		// // 此時session物件存在，讀取session物件內的LoginOK
		// // 以檢查使用者是否登入。
		// MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		// if (mb == null) {
		// response.sendRedirect(response.encodeRedirectURL ("../_02_login/login.jsp"));
		// return;
		// }
		// 本類別負責讀取資料庫內eBook表格內某一頁的紀錄，並能新增紀錄、修改紀錄、刪除記錄等
		// BookDao bab = null;
		String type = request.getParameter("type");

		if ("BOOK".equalsIgnoreCase(type)) {
			try {
				// String pageNoStr = request.getParameter("pageNo");
				// if (pageNoStr == null) {
				// pageNo = 1;
				// } else {
				// try {
				// pageNo = Integer.parseInt(pageNoStr.trim());
				// } catch(NumberFormatException e){
				// pageNo = 1;
				// }
				// }
				// bab = new BookAccessBean;
				//
				// bab = new BookDaoImpl_Jdbc();
				// request.setAttribute("baBean", bab);
				//
				//
				// bab.setPageNo(pageNo);
				// bab.setRecordsPerPage(GlobalService.RECORDS_PER_PAGE);
				Collection<ProductBean> coll = productDaoJdbc.selectAll();
				// request.setAttribute("pageNo", pageNo);
				// request.setAttribute("totalPages", bab.getTotalPages());
				request.setAttribute("ProductBeans", coll);
				// 交由maintainPoducts.jsp來顯示某頁的書籍資料，同時準備『第一頁』、
				// 『前一頁』、『下一頁』、『最末頁』等資料
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/maintainProducts.jsp");
				rd.forward(request, response);
				return;
			} catch (Exception e) {
				throw new ServletException(e);
			}
		} else if ("ADVER".equalsIgnoreCase(type)) {
			Collection<AdverBean> coll = adverDaoJdbc.getAdvertisementsAll();
			request.setAttribute("AdverBeans", coll);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/maintainAdver.jsp");
			rd.forward(request, response);
		}else if("MEMBER".equalsIgnoreCase(type)) {
			Collection<MemberBean> coll = memberDaoJdbc.selectAllMember();
			request.setAttribute("MemberBeans", coll);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/maintainMember.jsp");
			rd.forward(request, response);
			
		} else if("REVIEW".equalsIgnoreCase(type)){
			List<ReviewBean> coll = reviewDAOHibernate.select();
			request.setAttribute("ReviewBeans", coll);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/maintainReview.jsp");
			rd.forward(request, response);
		}else {
			// 預設顯示頁面
			Collection<ProductBean> coll = productDaoJdbc.selectAll();

			request.setAttribute("ProductBeans", coll);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/maintainProducts.jsp");
			rd.forward(request, response);

		}
	}
}