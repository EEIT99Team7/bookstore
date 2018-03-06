package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.LoginService;
import model.MemberBean;

@Controller
@RequestMapping(path = { "/webs/login.controller" })
public class LoginController {

	@Autowired
	private LoginService LoginService;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView processLogin(String username, String pwd, Model model, HttpSession session) {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsgMap);

		// 檢查使用者輸入資料
		// 如果 username 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (username == null || username.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "請輸入帳號");
		}
		// 如果 password 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (pwd == null || pwd.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "請輸入密碼");
		}

		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return new ModelAndView("login.fail");
		}

		// 4. 進行 Business Logic 運算
		// 將LoginServiceDB類別new為物件，存放物件參考的變數為 loginService
		// 交給Spring控管Bean元件包括DAO，Service等類別

		// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
		MemberBean memberBean = LoginService.login(username, pwd);

		if (memberBean != null) {
			// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"
			session.setAttribute("LoginOK", memberBean);
		} else {
			// NG, userid與密碼的組合錯誤，放一個錯誤訊息到 errorMsgMap 之內
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}

		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			return new ModelAndView("login.success");
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			return new ModelAndView("login.fail");
		}

		

	}

}
