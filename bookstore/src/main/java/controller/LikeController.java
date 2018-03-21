package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping("/presslike.controller")
	public String method(String like, String review, String memId, ReviewBean rbean, LikeBean lbean, Model model) {

//		System.out.println(like);
//		System.out.println(review);
//		System.out.println(memId);
		
		LikeBean bean = new LikeBean();
		bean.setMemID(Integer.valueOf(memId));
		bean.setReviewId(Integer.valueOf(review));

		if (like == "0") {
			likeDAOHibernate.check(bean);
			return "1";
		} else if (like == "1") {
			bean.setMemlike(true);
			likeDAOHibernate.delete(bean);
			return "0";
		}

		return "0";
	}
}
