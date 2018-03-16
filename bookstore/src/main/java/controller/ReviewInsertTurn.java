package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import model.ProductBean;
import model.ReviewBean;
import model.dao.ProductDAO;
import model.dao.ReviewDAOHibernate;

@Controller
public class ReviewInsertTurn {
//	@InitBinder
//	public void initializer(WebDataBinder webDataBinder) {
//		webDataBinder.registerCustomEditor(java.util.Date.class,
//				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
//	}
	
	@Autowired
	private ReviewDAOHibernate reviewDAO = null;
	@Autowired
	private ProductDAO productDAOHibernate = null;

	@Autowired
	private ApplicationContext context;

	@RequestMapping(path = { "/TurnReivew.controller" })
	public String method(Integer bookId,String insertp, ReviewBean bean, BindingResult bindingResult, Model model, String content,String score) {
//			System.out.println(score);
		
		ProductBean book = productDAOHibernate.selectbookId(bookId);
		model.addAttribute("book", book);
		return "review.insert";
		
			
	}

}
