package controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.MemberBean;
import model.dao.MemberDaoJdbc;

@Controller

public class MemberController {

	@Autowired
	private MemberDaoJdbc memberDaoJdbc = null;
	
	@Autowired //spring管理bean物件所需要的環境
	private ApplicationContext context;
	///Page/bookeach.controller
	@RequestMapping("/member.controller")
	public String method(@RequestParam("memberID") Integer dcnNo,MemberBean bean,Model model) {

		MemberBean result =memberDaoJdbc.selectBymemberID(dcnNo);
        model.addAttribute("member",result);
		return "selectmem";
			
	}
		
		
			
		
	
}
