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
import model.AdverBean;
import model.ProductBean;
import model.dao.AdverDaoJdbc;
import model.dao.ProductDaoJdbc;

//此為廣告新增servlet
@WebServlet("/AdverInsert.do")
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024
		* 1024 * 500 * 5)
public class AdverInsertServlet extends HttpServlet {
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

	//
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("adinsert Test");
		// if (!session.isNew()) {
		// adverBean = (AdverBean) session.getAttribute("bean");
		// } else {
		// adverBean = new AdverBean();
		// }
		// 儲存錯誤及成功訊息
		// 暫時還沒用到
		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 將訊息放置requestScope
		request.setAttribute("ErrMsg", errorMsgs);
		session.setAttribute("successMsg", successMsgs);
		try {
			Integer adverId = 0;
			String imgFilename = "";
			Blob adverImage = null;
			Boolean status = null;

			long sizeInBytes = 0;
			String fileName = "";
			InputStream is = null;

			// request.getParts()方法傳回一個由javax.servlet.http.Part物件所組成的Collection
			Collection<Part> parts = request.getParts();

			if (parts != null) { // 如果這是一個上傳資料的表單
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					if (p.getContentType() == null) {
						if (fldName.equals("imgFilename")) {// 圖片名稱
							imgFilename = value;
							if (value == null || imgFilename.trim().length() == 0) {
								errorMsgs.put("errimgName", "必須輸入圖片檔名");
							} else {
								request.setAttribute("imgName", imgFilename);
							}
						} else if (fldName.equals("status")) {// 狀態
							String statusStr = value;
							statusStr.trim();
							if (statusStr == null || statusStr.trim().length() == 0) {
								errorMsgs.put("errStatus", "必須選擇圖片狀態");
							} else {
								try {
									status = Boolean.parseBoolean(statusStr);
								} catch (NumberFormatException e) {
									errorMsgs.put("errStatus", "必須選擇圖片狀態");
								}
							}
							request.setAttribute("status", status);
						} else if (fldName.equals("adverId")) {// 廣告ID 主鍵
							String adverIdStr = value;
							adverIdStr.trim();

							try {
								adverId = Integer.parseInt(adverIdStr);
							} catch (NumberFormatException e) {
								errorMsgs.put("erradverId", "抓取圖片ID出問題了");
							}
							// 大致上都寫好了 待會將修改紐綁上呼叫adverUpdateSerlvet試試看正不正常
							request.setAttribute("adverId", adverId);
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

			if (sizeInBytes != -1) {

				blob = SystemUtils.fileToBlob(is, sizeInBytes);
			}

			AdverBean newBean = new AdverBean(null, imgFilename, blob, status);
			adj.insertAdv(newBean);
			successMsgs.put("success", "資料修改成功");

			Collection<AdverBean> coll = adj.getAdvertisementsAll();
			request.setAttribute("AdverBeans", coll);

			response.sendRedirect(response.encodeRedirectURL("MaintainProductServlet?type=ADVER"));
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
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
