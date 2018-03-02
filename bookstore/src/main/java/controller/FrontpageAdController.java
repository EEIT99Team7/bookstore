package controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//暫時沒用到
@Controller
public class FrontpageAdController {
//	@Autowired
//	private AdvertisementService advertisementService;
	
//	@Autowired
	private ApplicationContext context;
	@RequestMapping(
			path={"/Frontpage.controller"},
			method={RequestMethod.GET, RequestMethod.POST}
	)
	public String method(String username, String password, Model model, HttpSession session) {
		
		Locale locale = LocaleContextHolder.getLocale();
//接收資料
//驗證資料
//		Map<String, String> errors = new HashMap<>();
//		model.addAttribute("errors", errors);		
//		
//		if(username==null || username.trim().length()==0) {
//			errors.put("username", context.getMessage("login.username.required", null, locale));
//		}
//		if(password==null || password.trim().length()==0) {
//			errors.put("password", context.getMessage("login.password.required", null, locale));
//		}
//
//		if(errors!=null && !errors.isEmpty()) {
//			return "login.fail";
//		}
//		
//呼叫model
			
//根據model執行結果呼叫view元件
//		if(bean==null) {
//			errors.put("password", context.getMessage("login.action.failed", null, locale));
//			return "login.fail";
//		} else {
//			session.setAttribute("user", bean);
//			return "login.success";
//		}
		return null;
	}
	
}
