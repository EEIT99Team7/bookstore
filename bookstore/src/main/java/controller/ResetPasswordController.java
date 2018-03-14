package controller;

import java.util.HashMap;
import java.util.Map;

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
@RequestMapping(path = {"resetpassword"})
public class ResetPasswordController {

	private String verify;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDaoJdbc memberDao;
	
	@RequestMapping(method = { RequestMethod.GET })
	public ModelAndView get(String verify) {
		//沒有verify碼，轉向首頁
		if(verify == null) {
			return new ModelAndView("index");
		} 
		
		//檢查verify是否有效
		boolean correct = memberService.checkResetId(verify);
		//有效，轉向重設頁面
		if(correct) {
			this.verify = verify;
			return new ModelAndView("resetPassword");
		}else {//無效,轉向首頁
			return new ModelAndView("index");
		}
		
	}

	@RequestMapping(method = { RequestMethod.POST })
	public ModelAndView processResetPassword(String newPassword, String pwdcomfirm, Model model) {
			
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsgMap);// 顯示錯誤訊息
		//準備存放成功訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		model.addAttribute("msgOK", msgOK); // 顯示正常訊息

		// 檢查使用者輸入資料
		// 如果 password 欄位為空白，放一個錯誤訊息到 ErrorMsgKey 之內
		if (newPassword == null || newPassword.trim().length() == 0) {
			errorMsgMap.put("errorPasswordEmpty", "請輸入新密碼");
		}

		if (pwdcomfirm == null || pwdcomfirm.trim().length() == 0) {
			errorMsgMap.put("errorPassword2Empty", "請再次輸入新密碼");
		}

		if (newPassword != null && pwdcomfirm != null ) {
			if (newPassword.trim().length() > 0 && pwdcomfirm.trim().length() > 0) {
				if (!newPassword.trim().equals(pwdcomfirm.trim())) {
					errorMsgMap.put("errorPasswordEmpty", "*");
					errorMsgMap.put("errorPassword2Empty", "密碼欄必須與確認欄一致");
				}
			}
		}

		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給resetPassword.jsp
		if (errorMsgMap != null && !errorMsgMap.isEmpty()) {
			return new ModelAndView("resetPassword");
		}
		
		
		//沒有錯誤
		//呼叫model，
		// 1. 檢查帳號是否已經存在
		// 2. 更新密碼 
		MemberBean memberBean = memberDao.selectByResetId(verify);
		Boolean success = memberService.changePassword(memberBean.getUserName(), memberBean.getPw(), newPassword);
		
		if(success) {
			memberDao.updateRestStatus(memberBean.getEmail(), false, null);
			String resetOK = "<script>alert(\"已重設密碼，請使用新密碼登入\");window.location.href = './index.jsp';</script>";
			msgOK.put("ResetOK", resetOK);
			return new ModelAndView("resetPassword");
		}else {
			
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給resetPassword
			return new ModelAndView("resetPassword");
		}
	
	}

}
