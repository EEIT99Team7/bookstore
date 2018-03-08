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

import model.EmailService;
import model.MemberBean;
import model.MemberService;

//忘記密碼 功能
@Controller
@RequestMapping(path = { "/webs/forgot.controller" })
public class ForgotController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private EmailService emailService;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView processForgot(String email, Model model, HttpSession session) {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsgMap);// 顯示錯誤訊息
		model.addAttribute("msgOK", msgOK); // 顯示正常訊息

		// 檢查使用者輸入資料
		// 如果 email 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (email == null || email.trim().length() == 0) {
			errorMsgMap.put("EmailEmptyError", "請輸入Email");
		}
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return new ModelAndView("forgot");
		}

		// 進行 Business forgot 運算
		// 呼叫 memberService物件的 forgotPassword()，傳入email
		MemberBean memberBean = memberService.forgotPassword(email);

		if (memberBean == null) {
			// NG, email搜尋不到結果，放一個錯誤訊息到 errorMsgMap 之內
			errorMsgMap.put("EmailNotFoundError", "Email輸入錯誤或是帳號不存在");
		}

		if (errorMsgMap.isEmpty()) {
			// 如果errorMsgMap是空的，msgOK寫入彈出訊息框
			 String result = emailService.sendForgotPasswordEmail(email);
			// 測試用
			// String result = "<script>alert(\"已寄出認證信\");window.location.href =
			// '../index.jsp';</script>";
			msgOK.put("QueryOK", result);

			// 交棒給forgot，顯示彈出訊息框並回到首頁
			return new ModelAndView("forgot");
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給forgot.fail
			return new ModelAndView("forgot");
		}

	}
}
