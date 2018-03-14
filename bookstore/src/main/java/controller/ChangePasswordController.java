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

import model.MemberBean;
import model.MemberService;
import model.dao.MemberDaoJdbc;

@Controller
@RequestMapping(path = "webs/member/changepassword.controller")
public class ChangePasswordController {

	@Autowired
	MemberService memberService;

	@Autowired
	MemberDaoJdbc memberDao;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView process(String oldpswd, String newpwsd, String newpwsd2, Model model, HttpSession session) throws InterruptedException {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsg);
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		model.addAttribute("OkMsgKey", msgOK);

		// 讀入欄位
		MemberBean originBean = (MemberBean) session.getAttribute("LoginOK");
		String originPwd = originBean.getPw();
		MemberBean newBean = memberDao.selectBymemberID(originBean.getMemId());

		// 檢查欄位
		if (oldpswd == null || oldpswd.trim().length() == 0) {
			errorMsg.put("erroroldpswdEmpty", "密碼欄必須輸入");
			return new ModelAndView("changePassword");
		}

		if (newpwsd == null || newpwsd.trim().length() == 0) {
			errorMsg.put("errornewpwsdEmpty", "密碼欄必須輸入");
			return new ModelAndView("changePassword");
		}
		if (newpwsd2 == null || newpwsd2.trim().length() == 0) {
			errorMsg.put("errornewpwsd2Empty", "密碼欄必須輸入");
			return new ModelAndView("changePassword");
		}

		if (oldpswd != null && !oldpswd.equals(originPwd)) {
			errorMsg.put("PWDNotCorrectError", "密碼不正確");
			return new ModelAndView("changePassword");
		}

		if (oldpswd.trim().length() > 0 && newpwsd.trim().length() > 0) {
			if (oldpswd.trim().equals(newpwsd.trim())) {
				errorMsg.put("errorPasswordDuplicate", "新密碼與舊密碼一樣");
			}
		}

		if (newpwsd.trim().length() > 0 && newpwsd2.trim().length() > 0) {
			if (!newpwsd.trim().equals(newpwsd2.trim())) {
				errorMsg.put("errorPassword2Match", "密碼欄必須與確認欄一致");
				errorMsg.put("errorPasswordMatch", "*");
			}
		}
		// 如果 errorMsgMap 不是空的，表示有錯誤
		if (errorMsg != null && !errorMsg.isEmpty()) {
			return new ModelAndView("changePassword");
		}

		// 更新會員資料
		session.setAttribute("LoginOK", newBean);
		Boolean success = memberService.changePassword(originBean.getUserName(), oldpswd, newpwsd);
		
		
		
		if (success) {
			String changeOK = "<script>alert(\"已更新密碼，請使用新密碼登入\");window.location.href = './index.jsp';</script>";
			msgOK.put("ChangeOK", changeOK);
			Thread.sleep(1000);
			session.invalidate();
			return new ModelAndView("changePassword");
			
		} else {
			errorMsg.put("errorPasswordChangeFailed", "密碼變更失敗，請稍後再試");
			return new ModelAndView("changePassword");
		}

	}

}
