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
@RequestMapping(path = "/customerMessageReply.controller")
public class CustomerServiceReplyController {

	@Autowired
	private CustomerServiceDao customerServiceDao;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public String newMessage(HttpSession session, String replyMessage, String csId) {

		MemberBean memberbean = (MemberBean) session.getAttribute("LoginOK");
		Integer memid = memberbean.getMemId();
		
		CustomerServiceBean bean = customerServiceDao.selectByCsId(Integer.parseInt(csId));
		
		bean.setReplyMsg(replyMessage);
		bean.setResponseTime(new Date());
		bean.setProcessStatus("已處理");
		
		customerServiceDao.addMessage(bean);
		
		System.out.println("done");


		return "customerServiceReply";
	}
}
