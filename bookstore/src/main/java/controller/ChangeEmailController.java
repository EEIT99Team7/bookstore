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
import model.dao.MemberDaoJdbc;

@Controller
@RequestMapping(path = "webs/member/changeemail.controller")
public class ChangeEmailController {

	@Autowired
	MemberDaoJdbc memberDao;

	@Autowired
	private EmailService emailService;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView process(String email, Model model, HttpSession session) throws InterruptedException {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsg);
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		model.addAttribute("OkMsgKey", msgOK);
		// 讀入欄位
		MemberBean originBean = (MemberBean) session.getAttribute("LoginOK");
		String oldEmail = originBean.getEmail();
		MemberBean newBean = memberDao.selectBymemberEmail(oldEmail);

		// 寫入更新資料
		if (email != null && !email.isEmpty()) {
			if (!email.equals(oldEmail)) {
				newBean.setAddr(email);
			} else {
				errorMsg.put("EmailDuplicationError", "Email與現在相同");
			}
		}

		// 如果 errorMsgMap 不是空的，表示有錯誤
		if (errorMsg != null && !errorMsg.isEmpty()) {
			return new ModelAndView("editProfile");
		}

		// 寄出認證信
		System.out.println(email);
		Boolean result = emailService.sendChangeEmailConfirm(email);

		if (result) {
			String msg = "<script>alert(\"已寄出確認信\");window.location.href = '../../index.jsp';</script>";
			msgOK.put("ChangeEmailOK", msg);
			Thread.sleep(1000);

			// 更新會員資料
			session.setAttribute("LoginOK", newBean);
			memberDao.updateEmail(oldEmail, email);

			// 會員登出
			session.invalidate();
			return new ModelAndView("editProfile");

		} else {
			String msg = "<script>alert(\"信件寄發錯誤，請稍後再試\");</script>";
			msgOK.put("ChangeEmailOK", msg);
			return new ModelAndView("editProfile");
		}

	}

}
