package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

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
import model.dao.GetImageImpl;

/**
 * Servlet implementation class RetrieveImageServlet
 */
@WebServlet("/getImage")
public class RetrieveImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 產生專門讀取圖片的GetImageImpl物件
	private GetImageImpl getImageImpl;

	public void init() throws ServletException {
		// 此為sping版本的初始化方法。
		ApplicationContext context = (ApplicationContext) this.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		getImageImpl = (GetImageImpl) context.getBean("getImageImpl");

	}

	public RetrieveImageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutputStream os = null;
		InputStream is = null;
		try {
			// 讀取瀏覽器傳送來的代號(Id)
			String id = request.getParameter("id");
			// 分辨讀取哪個表格的圖片欄位
			String type = request.getParameter("type");

			if (type.equalsIgnoreCase("ADVERTISEMENT")) { // 讀取ADVERTISEMENT表格
				Integer nId = 0;
				try {
					nId = Integer.parseInt(id);
				} catch (NumberFormatException ex) {
					;
				}
				AdverBean mBean = getImageImpl.getAdImage(nId);

				if (mBean.getAdverImage() != null) {
					is = mBean.getAdverImage().getBinaryStream();
				}

			} else if (type.equalsIgnoreCase("BOOK")) { // 讀取Book表格
				Integer nId = 0;
				try {
					nId = Integer.parseInt(id);
				} catch (NumberFormatException ex) {
					;
				}
				ProductBean mBean = getImageImpl.getBookImage(nId);

				if (mBean.getCoverImage() != null) {
					is = mBean.getCoverImage().getBinaryStream();
				}
			} else if (type.equalsIgnoreCase("MEMBER")) { // 讀取會員圖片
				Integer nId = 0;
				try {
					nId = Integer.parseInt(id);
				} catch (NumberFormatException ex) {
					;
				}
				MemberBean mBean = getImageImpl.getMemberImage(nId);
				if (mBean.getMemberImage() != null) {
					is = mBean.getMemberImage().getBinaryStream();
				}
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			// String mimeType = getServletContext().getMimeType();
			// 設定輸出資料的型態
			response.setContentType(null);
			// 取得能寫出非文字資料的OutputStream物件
			os = response.getOutputStream();
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.jpg)
			if (is == null) {
				//針對會員沒上傳圖片的回傳預設圖片
				if(type.equalsIgnoreCase("MEMBER")) {
					is = getServletContext().getResourceAsStream("/images/default-member-image.png");
				}else { //針對其他沒上傳圖片的回傳
				is = getServletContext().getResourceAsStream("/images/Noimage.jpg");
				}
			}
			int len = 0;
			byte[] bytes = new byte[8192];
			while ((len = is.read(bytes)) != -1) {
				os.write(bytes, 0, len);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			// os.flush();
			// is.close();
			// os.close();

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
