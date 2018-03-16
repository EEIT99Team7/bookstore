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
import model.dao.MemberDaoJdbc;

//忘記密碼 功能
@Controller
@RequestMapping(path = { "/webs/forgot.controller" })
public class ForgotController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDaoJdbc memberDao;

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
			return new ModelAndView("forgot");
		}

		// 進行 Business forgot 運算
		// 呼叫 memberService物件的 forgotPassword()，傳入email
		MemberBean memberBean = memberDao.selectBymemberEmail(email);

		if (memberBean == null) {
			// NG, email搜尋不到結果，放一個錯誤訊息到 errorMsgMap 之內
			errorMsgMap.put("EmailNotFoundError", "Email輸入錯誤或是帳號不存在");
			return new ModelAndView("forgot");
		}

		// 如果errorMsgMap是空的，表示驗證無誤
		if (errorMsgMap.isEmpty()) {
			// 檢查resetState，如已經是true 則再寄一次信
			if (memberBean.getResetState() == true) {
				String resetId = memberBean.getResetId();
				// String result = "測試 再寄一次";
				String result = emailService.sendForgotPasswordEmail(email, resetId);

				// msgOK寫入彈出訊息框
				msgOK.put("QueryOK", result);
				// 交棒給forgot，顯示彈出訊息框並回到首頁(由result中的<script>跳轉)
				return new ModelAndView("forgot");

			} else { // resetState，如股是false， 產生新信件

				// 產生專用url
				String resetId = memberService.createResetId(email);

				// 用新的resetId寄出信件
				// String result = "測試 成功寄信";
				String result = emailService.sendForgotPasswordEmail(email, resetId);
				// msgOK寫入彈出訊息框
				msgOK.put("QueryOK", result);
				// 交棒給forgot，顯示彈出訊息框並回到首頁(由result中的<script>跳轉)
				return new ModelAndView("forgot");
			}

		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給forgot.fail
			return new ModelAndView("forgot");
		}
	}
}