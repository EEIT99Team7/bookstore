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
import org.springframework.web.bind.annotation.ResponseBody;

import model.ProductBean;
import model.ReviewBean;
import model.dao.ProductDAO;
import model.dao.ReviewDAOHibernate;

@Controller
public class InsertReviewController {
	// @InitBinder
	// public void initializer(WebDataBinder webDataBinder) {
	// webDataBinder.registerCustomEditor(java.util.Date.class,
	// new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	// }

	@Autowired
	private ReviewDAOHibernate reviewDAO = null;
	@Autowired
	private ProductDAO productDAOHibernate = null;

	@Autowired
	private ApplicationContext context;

	@RequestMapping(path = { "/InsertReivew.controller" })
	public String method(String memID, String review, String bookId, ReviewBean bean, BindingResult bindingResult,
			Model model, String content, String score) {
		System.out.println(memID);

		ProductBean book = productDAOHibernate.selectbookId(Integer.valueOf(bookId));
		model.addAttribute("books", book);

		// 接收資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		// 轉換資料

		// 驗證資料
		if (content == null || content.length() == 0) {
			errors.put("contenterror", "請輸入Content");
		} else {
			ReviewBean insert = reviewDAO.insert(bean);
			if (insert == null) {
				errors.put("action", "Insert fail");
			} else {
				if (score == null) {
					bean.setScore(1);
				}
				bean.setMemID(Integer.valueOf(memID));
				// 預設值
				bean.setMake(new Date());
				bean.setGoodlike(0);
				bean.setStatusNo(true);
				model.addAttribute("insert", insert);
				return "book.select";
			}
			if (errors != null && !errors.isEmpty()) {
				return "book.select";
			}

		}
		return "book.select";

		// 呼叫model
		// 根據model執行結果呼叫view元件
		// if ("Send".equals(review)) {
		//
		//
		// }
		// return "book.select";
		//
		// } else {
		// errors.put("action", "Unknown Action:" + review);
		// return "book.select";
		// }

	}

}
