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

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import misc.SystemUtils;
import model.MemberBean;
import model.MemberService;
import model.dao.RegisterServiceDaojdbc;

@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/webs/register.controller")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要
		// session物件來存放共用資料。
		HttpSession session = request.getSession();
		request.setAttribute("MsgError", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		String userName = "";
		String password = "";
		String password2 = "";
		String email = "";
		String fileName = "";
		long sizeInBytes = 0;
		InputStream is = null;
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart request內所有的parts

		// 由parts != null來判斷此上傳資料是否為HTTP multipart request
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("username")) {
						userName = value;
					} else if (fldName.equals("pwd")) {
						password = value;
					} else if (fldName.equalsIgnoreCase("pwd2")) {
						password2 = value;
					} else if (fldName.equalsIgnoreCase("email")) {
						email = value;
					}
				} else {
					fileName = MemberService.getFileName(p); // 此為圖片檔的檔名
					fileName = MemberService.adjustFileName(fileName, MemberService.IMAGE_FILENAME_LENGTH);
					if (fileName != null && fileName.trim().length() > 0) {
						sizeInBytes = p.getSize();
						is = p.getInputStream();
						System.out.println(fileName);
					}
				}
			}

			// 3. 檢查使用者輸入資料
			if (userName == null || userName.trim().length() == 0) {
				errorMsg.put("errorIDEmpty", "帳號欄必須輸入");
			}
			if (password == null || password.trim().length() == 0) {
				errorMsg.put("errorPasswordEmpty", "密碼欄必須輸入");
			}
			if (password2 == null || password2.trim().length() == 0) {
				errorMsg.put("errorPassword2Empty", "密碼確認欄必須輸入");
			}
			if (password.trim().length() > 0 && password2.trim().length() > 0) {
				if (!password.trim().equals(password2.trim())) {
					errorMsg.put("errorPassword2Empty", "密碼欄必須與確認欄一致");
					errorMsg.put("errorPasswordEmpty", "*");
				}
			}

			if (email == null || email.trim().length() == 0) {
				errorMsg.put("errorEmail", "電子郵件欄必須輸入");
			}

		} else {
			errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
		}
		// 如果有錯誤
		if (!errorMsg.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
			return;

		}
		try {
			// 4. 進行Business Logic運算
			// RegisterServiceFile類別的功能：
			// 1.檢查帳號是否已經存在
			// 2.儲存會員的資料

			// 交給Spring控管Bean元件包括DAO，Service等類別
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

			// RegisterServiceDAO rs = new RegisterServiceDAO_JDBC();
			RegisterServiceDaojdbc rs = context.getBean(RegisterServiceDaojdbc.class);
			if (rs.userNameExists(userName)) {
				errorMsg.put("errorIDDup", "此帳號已存在，請換新代號");
			} else {
				// password =
				// GlobalService.getMD5Endocing(GlobalService.encryptString(password));
				// Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
				
				Blob blob = null;
				if(sizeInBytes != 0 && is != null ) {
					 blob = SystemUtils.fileToBlob(is, sizeInBytes);
					System.out.println("do filetoblob");
				}
				

				MemberBean memberBean = new MemberBean(null, userName, email, password, null, null, null, null,
						"member", blob, fileName, 0.0);

				int n = rs.addMember(memberBean);
				if (n == 1) {
					msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
					response.sendRedirect("../index.jsp");
					return;
				} else {
					errorMsg.put("errorIDDup", "新增此筆資料有誤(RegisterServlet)");
				}
			}
			 // 5.依照 Business Logic 運算結果來挑選適當的畫面
			 if (!errorMsg.isEmpty()) {
			 // 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			 RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			 rd.forward(request, response);
			 return;
			 }
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorIDDup", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);

		}
	}
}
