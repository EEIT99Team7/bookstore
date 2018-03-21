package controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.CustomerServiceBean;
import model.MemberBean;
import model.dao.CustomerServiceDao;

@Controller
@RequestMapping(path = "webs/member/customerMessage.controller")
public class CustomerServiceInsertController {

	@Autowired
	private CustomerServiceDao customerServiceDao;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String newMessage(HttpSession session, String csMessage, String csTitle) {

		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		Integer memid = memberbean.getMemId();

		CustomerServiceBean bean = new CustomerServiceBean(null, memid, csTitle, csMessage, null, "未處理", new Date(),null);

		customerServiceDao.addMessage(bean);

		return "customerService";
	}
}
