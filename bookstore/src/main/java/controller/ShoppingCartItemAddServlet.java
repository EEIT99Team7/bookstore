package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _04_ShoppingCart.model.OrderItem;
import _04_ShoppingCart.model.ShoppingCart;

@WebServlet("/ShoppingCartItemAddServlet")
public class ShoppingCartItemAddServlet extends HttpServlet {
	// 當使用者按下『加入購物車』時，瀏覽器會送出請求到本程式
	private static final long serialVersionUID = 1L;

	public ShoppingCartItemAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}

		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);
		}

		String bookIdSTr = request.getParameter("bookId");
		String title = request.getParameter("title");
		String priceStr = request.getParameter("price");
		Integer qty = 1;
		Integer bookID;
		Double price;
		try {
			bookID = Integer.parseInt(bookIdSTr.trim());
			price = Double.parseDouble(priceStr.trim());
		} catch (NumberFormatException e) {
			throw new ServletException(e);
		}

		// 將訂單資料封裝到OrderItemBean內
		OrderItem oi = new OrderItem(title, qty, bookID, price);
		cart.addToCart(bookID, oi);

		// 將顯示購物車內容物比數轉成字串
		String cartAmount = cart.getItemNumber().toString();
		// out輸出一筆字串資料，配合jQueryAjax做到非同步更新購物車圖示的購買數量
		PrintWriter out = response.getWriter();
		out.write(cartAmount);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
