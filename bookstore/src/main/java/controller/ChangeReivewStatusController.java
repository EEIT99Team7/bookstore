package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.LikeBean;
import model.ReviewBean;
import model.dao.LikeDAOHibernate;
import model.dao.ReviewDAOHibernate;

@Controller
public class ChangeReivewStatusController {
	@Autowired
	private ReviewDAOHibernate reviewDAOHibernate = null;

	// spring管理bean物件所需要的環境
	@Autowired
	private ApplicationContext context;

	@RequestMapping(method = { RequestMethod.GET },path="/reviewstatus.controller")
	@ResponseBody
	public void doGet(String status,String reviewId, Model model) {
		
		System.out.println(status);
		System.out.println(reviewId);
		
		
//		ReviewBean bean = reviewDAOHibernate.select(Integer.valueOf(reviewId));
//		System.out.println(bean);
		
		if("0".equals(status)) {	
			reviewDAOHibernate.changeStatus(Integer.valueOf(reviewId));
		}else if("1".equals(status)) {
			reviewDAOHibernate.changeStatus(Integer.valueOf(reviewId));
		}
//		return "1";
	}
}
