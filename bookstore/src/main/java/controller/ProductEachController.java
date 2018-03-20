package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.LikeBean;
import model.MemberBean;
import model.ProductBean;
import model.ReviewBean;
import model.dao.LikeDAOHibernate;
import model.dao.MemberDaoJdbc;
import model.dao.ProductDAO;
import model.dao.ReviewDAOHibernate;

@Controller

public class ProductEachController {

	@Autowired
	private ProductDAO productDAOHibernate = null;
	@Autowired
	private MemberDaoJdbc memberDaoJdbc = null;
	@Autowired
	private ReviewDAOHibernate reviewDAOHibernate = null;
	@Autowired
	private LikeDAOHibernate likeDAOHibernate = null;

	@Autowired // spring管理bean物件所需要的環境
	private ApplicationContext context;

	/// Page/bookeach.controller

	@RequestMapping("/bookPages.controller")
	public String method(@RequestParam("bookId") Integer dcnNo, ProductBean bean, LikeBean lbean, HttpSession session,
			Model model) {

		System.out.println("bookPages.controller test");
		ReviewBean rbean =null;
		MemberBean mbean = (MemberBean) session.getAttribute("LoginOK");
		
		ProductBean result = productDAOHibernate.selectbookId(dcnNo);
		model.addAttribute("book", result);

		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		List<Object[]> sb = reviewDAOHibernate.selectByBookId(dcnNo);
		if (sb.size() != 0) {
			List<HashMap<String, String>> rlist = new ArrayList<>();
			for (int i = 0; i < sb.size(); i++) {
				HashMap<String, String> temp = new HashMap<>();
				temp.put("nickname", sb.get(i)[0].toString());
				temp.put("content", sb.get(i)[1].toString());
				temp.put("make", sb.get(i)[2].toString());
				temp.put("score", sb.get(i)[3].toString());
				Integer rid = Integer.parseInt(sb.get(i)[4].toString());
				Long templike = likeDAOHibernate.sumLike(rid);
				temp.put("like", templike.toString());
				temp.put("reviewId", sb.get(i)[4].toString());
				temp.put("memId", sb.get(i)[5].toString());
				if(mbean!=null) {
					// 檢查memLike
					Long tempmemlike = likeDAOHibernate.checkmemlike(rid, mbean.getMemId());
					temp.put("memlike", tempmemlike.toString());					
				}
				rlist.add(temp);
			}
			model.addAttribute("review", rlist);
		} else {
			errors.put("noreivew", "沒有評論");
		}
		if(mbean!=null) {
			rbean = reviewDAOHibernate.select(mbean.getMemId(), dcnNo);
		}
		
		if (rbean == null) {
			errors.put("nobody", "沒有評論過");
		}
		return "book.select";
	}

}
