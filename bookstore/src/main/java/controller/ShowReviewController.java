package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;

import model.LikeBean;
import model.MemberBean;
import model.ProductBean;
import model.ReviewBean;
import model.dao.LikeDAOHibernate;
import model.dao.ReviewDAOHibernate;

@Controller
@RequestMapping(path = { "/Showreview.controller" })
public class ShowReviewController {
	@Autowired
	private ReviewDAOHibernate reviewDAOHibernate = null;

	// spring管理bean物件所需要的環境
	@Autowired
	private ApplicationContext context;

	@RequestMapping(method = {RequestMethod.GET})
	public String doGet(String memId, Model model) {
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		List<Object[]> sm = reviewDAOHibernate.selectByMemId(Integer.valueOf(memId));
		if (sm.size() != 0) {
			List<HashMap<String, String>> rlist = new ArrayList<>();
			for (int i = 0; i < sm.size(); i++) {
				HashMap<String, String> temp = new HashMap<>();
				temp.put("title", sm.get(i)[0].toString());
				temp.put("content", sm.get(i)[1].toString());
				temp.put("make", sm.get(i)[2].toString());
				if(sm.get(i)[3]!=null) {
					temp.put("score", sm.get(i)[3].toString());
				}
				temp.put("reviewId", sm.get(i)[4].toString());
				temp.put("memId", memId);
				rlist.add(temp);
			}
			model.addAttribute("review", rlist);
		}else {
			errors.put("noreivew", "沒有評論");
		}
		
		return "review.myreivew";
	}
	
	@RequestMapping(method = {RequestMethod.POST})
	public ModelAndView doPost(Integer reviewId,Integer memId,String content, Model model) {
			
			ReviewBean bean = reviewDAOHibernate.update(reviewId, content);
			String url= "/bookstore/Showreview.controller?memId=" + memId+ "";
			return new ModelAndView( new RedirectView(url));

	}
}
