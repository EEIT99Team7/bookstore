package _04_ShoppingCart.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.OrderItem;
import _04_ShoppingCart.model.OrderItemBean;
import _04_ShoppingCart.model.ShoppingCart;
import _04_ShoppingCart.model.facade.OrderService;
import _04_ShoppingCart.model.facade.OrderServiceImpl;
import model.MemberBean;
import model.dao.ProductDaoJdbc;

// OrderConfirm.jsp 呼叫本程式
@WebServlet("/ProcessOrder.do")
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OrderServiceImpl orderService;
	
	@Override
	public void init() throws ServletException {
		//此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext().getAttribute(
				WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		orderService = (OrderServiceImpl)context.getBean("orderService");
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// String finalDecision = request.getParameter("finalDecision");
		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		if (mb == null) {// 逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		ShoppingCart sc = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (sc == null) {
			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		// 取消訂單
		// if (finalDecision.equals("CANCEL")){
		// session.removeAttribute("ShoppingCart");
		// response.sendRedirect(response.encodeRedirectURL (request.getContextPath()));
		// return; // 一定要記得 return
		// }

		// 會員帳號
		String memberId = mb.getUserName();
		// 付款方式
		String payment = request.getParameter("payment");
		// 使用sc裡面的計算總金額方法
		double totalAmount = Math.round(sc.getSubtotal() * 1.05);
		// 收件人
		String customer = request.getParameter("receiverName");
		// 收件地址
		String shippingAddress = request.getParameter("receiverAddress");
		if("超商取貨".equals(payment)){
			shippingAddress = request.getParameter("storeAddress");	
		}
		// 電話
		String phone = request.getParameter("receiverPhone");
		//超商店名
		String storeName =request.getParameter("storeName");
		//超商地址
		String storeAddress =request.getParameter("storeAddress");
		//超商電話
		String storePhone =request.getParameter("storePhone");
		
		
		Date today = new Date();
	

		OrderBean ob = new OrderBean(memberId, totalAmount, shippingAddress, today, null, payment, storeAddress,
				storeName, customer, phone, null);

		Set<OrderItemBean> items = new HashSet<OrderItemBean>();
		Map<Integer, OrderItem> cart = sc.getContent();

		Set<Integer> set = cart.keySet();
		for (Integer k : set) {
			OrderItem oib = cart.get(k);
			String description = oib.getTitle().substring(0, 12);

			// 主鍵必須是null，而不可以是零(流水號自動產生)
			OrderItemBean oiDAO = new OrderItemBean(null, 0, oib.getBookID(), description, oib.getQty(), oib.getPrice(),
					oib.getDiscount());
			System.out.println("oiDAO:"+oiDAO);
			oiDAO.setOrders(ob);
			System.out.println("after set orderbean in oiDAO:"+oiDAO);
			items.add(oiDAO);
		}
		// OrderBean:封裝一筆訂單資料的容器(包含訂單主檔與訂單明細檔的資料)
		ob.setItems(items);
		try {
//			OrderService orderService = new OrderServiceImpl();
			orderService.processOrder(ob);
			// 判斷是否使用歐付寶
			session.removeAttribute("ShoppingCart");
			if ("歐付寶".equals(payment)) {
				// 設request屬性讓歐付寶讀取產品項目
				request.setAttribute("cart", cart);
				request.getRequestDispatcher("aioCheckOutOneTime").forward(request, response);

				return;
			}
			// 暫時導向至首頁 到資料庫select看是否有新增訂單 (做一個訂單成功的畫面)
			response.sendRedirect(response.encodeRedirectURL("index.jsp"));
			System.out.println("訂單處理成功 請至資料庫查詢");
			return;
		} catch (RuntimeException ex) {
			String message = ex.getMessage();
			String shortMsg = "";
			shortMsg = message.substring(message.lastIndexOf(":") + 1);
			System.out.println(shortMsg);
			session.setAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg + "，請調正訂單內容");
			// System.out.println("處理訂單時發生異常: " + message);
			response.sendRedirect(response.encodeRedirectURL("ShowCartContentTest.jsp"));
			return;
		}
	}
}