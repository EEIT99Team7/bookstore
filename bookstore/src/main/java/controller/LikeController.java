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

@Controller
public class LikeController {
	@Autowired
	private LikeDAOHibernate likeDAOHibernate = null;

	// spring管理bean物件所需要的環境
	@Autowired
	private ApplicationContext context;

	@RequestMapping(method = { RequestMethod.GET },path="/presslike.controller",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String doGet(Integer like, String review, String memId, Model model) {

//		System.out.println(like);
//		System.out.println(review);
//		System.out.println(memId);

		
		LikeBean bean = new LikeBean();
		bean.setMemID(Integer.valueOf(memId));
		bean.setReviewId(Integer.valueOf(review));

		if (like == 0) {
			bean.setMemlike(true);
			likeDAOHibernate.likeplus(bean);

			return "1";
		} else if (like == 1) {
			likeDAOHibernate.delete(bean);
			return "0";
		}
		
		return "0";
	}
}
