package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import misc.SystemUtils;
import model.CategoryBean;
import model.ProductBean;
import model.dao.CategoryDaoJdbc;
import model.dao.ProductDaoJdbc;

@WebServlet("/BookUpdate.do")
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
public class BookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDaoJdbc pdj;
	private CategoryDaoJdbc cdj;
	public void init() throws ServletException {
		//此為sping版本的初始化方法。
			ApplicationContext context = (ApplicationContext) this.getServletContext().getAttribute(
					WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			pdj = (ProductDaoJdbc)context.getBean("productDaoJdbc");
			cdj = (CategoryDaoJdbc)context.getBean("categoryDaoJdbc");
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
//
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductBean pb;
		if (!session.isNew())  {
			pb = (ProductBean) session.getAttribute("bookbean");
		} else {
			pb = new ProductBean();
		}
		//儲存錯誤及成功訊息
		//暫時還沒用到
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//將訊息放置requestScope
		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
		try {
			String title = "";
			String author = "";
			String priceStr = "";//驗證price型別用的暫時變數
			double price = 0;
			String content = "";
			int bookNo = 0; //REFERENCES Category(bookNo),   --類型
			String press = ""; 
			int stock = 0;
			int	sells = 0;
			long sizeInBytes = 0;
			String fileName = "";
			InputStream is = null;
			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
			Collection<Part> parts = request.getParts();
		
			if (parts != null) {   // 如果這是一個上傳資料的表單				
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
						if (fldName.equals("title")) {//書名
							title = value;
							pb.setTitle(title);
							if (value == null || title.trim().length() == 0) {
								errorMsgs.put("errTitle", "必須輸入書名");
							} else {
								request.setAttribute("title", title);
							}
						} else if (fldName.equals("author")) {//作者
							author = value;
							pb.setAuthor(author);
							if (author == null || author.trim().length() == 0) {
								errorMsgs.put("errAuthor", "必須輸入作者");
							} else {
								request.setAttribute("author", author);
							}
						} else if (fldName.equals("price")) {//價格
							priceStr = value;
							priceStr = priceStr.trim();
							if (priceStr == null
									|| priceStr.trim().length() == 0) {
								errorMsgs.put("errPrice", "必須輸入價格");
							} else {
								try {
									price = Double.parseDouble(priceStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errPrice", "價格必須是數值");
								}
							}
							request.setAttribute("price", priceStr);
						} else if (fldName.equals("bookNo")) {
							String bookNoStr  = value; //驗證bookNo型別用的暫時變數

							pb.setBookNo(bookNo);
							if (bookNoStr == null || bookNoStr.trim().length() == 0) {
								errorMsgs.put("errBookNo", "必須輸入類別");
							} else {
								try {
									bookNo = Integer.parseInt(bookNoStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errBookNo", "類別必須是數字");
								}	
							}
							request.setAttribute("bookNo", bookNoStr);
						} else if (fldName.equals("press")) {
							press = value;
							if (press == null
									|| press.trim().length() == 0) {
								errorMsgs.put("errPress", "必須輸入出版社");
							}
							request.setAttribute("cID", press);
						}else if(fldName.equals("stock")){
							String stockStr = value;
							stockStr = stockStr.trim();
							if (stockStr == null
									|| stockStr.trim().length() == 0) {
								errorMsgs.put("errStock", "必須輸入數字");
							} else {
								try {
									stock = Integer.parseInt(stockStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errStock", "庫存必須是數字");
								}
							}
							request.setAttribute("stock", stockStr);
						}else if(fldName.equals("sells")) {
							String sellsStr = value;
							sellsStr = sellsStr.trim();
							if (sellsStr == null
									|| sellsStr.trim().length() == 0) {
								errorMsgs.put("errSells", "必須輸入數字");
							} else {
								try {
									sells = Integer.parseInt(sellsStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errSells", "銷售量必須是數字");
								}
							}
							request.setAttribute("stock", sellsStr);
						}else if(fldName.equals("content")) {
							content = value;
							pb.setContent(content);//這行幹嘛用的??
							if (content == null || content.trim().length() == 0) {
								errorMsgs.put("errContent", "必須輸入內容");
							} else {
								request.setAttribute("content", content);
							}
						}

					} else {
						fileName = getFileName(p); // 此為圖片檔的檔名
						if (fileName != null && fileName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
						} else {
							sizeInBytes = -1;
						}
					} 
				}
			} else {
				errorMsgs.put("errTitle", "此表單不是上傳檔案的表單");
			}
			if (!errorMsgs.isEmpty()) {
			   RequestDispatcher rd = request.getRequestDispatcher("BookUp.jsp");
			   rd.forward(request, response);
			   return;
			} 			
			
			Blob blob = null;

			if (sizeInBytes != -1){
				blob = SystemUtils.fileToBlob(is, sizeInBytes);
			}
			
			ProductBean newBean = new ProductBean(pb.getBookId(), title, 
					author,press, price, stock, bookNo, blob, content);
			pdj.updateBook(newBean, sizeInBytes); 
			successMsgs.put("success" , "資料修改成功");
			RequestDispatcher rd = request.getRequestDispatcher("MaintainProductServlet");
			rd.forward(request, response);
			return;
		
		
		} catch (Exception e) {
			e.printStackTrace();
			errorMsgs.put("errDBMessage", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("BookError.jsp");
			rd.forward(request, response);
		}
	}
	private String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
}
