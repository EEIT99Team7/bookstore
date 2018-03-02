package login.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/login.do")
public class LoginController {
	
	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String processGet(@RequestParam Map<String, String> loginInfo) throws Exception{
		
		//接收資料
		String userId = loginInfo.get("userId");
		String pswd = loginInfo.get("pswd");
		
		
		return "";
	}

}
