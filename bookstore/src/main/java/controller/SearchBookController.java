package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.ProductBean;
import model.dao.ProductDAO;

@Controller
public class SearchBookController {

	@Autowired
	private ProductDAO productDAOHibernate = null;

	@Autowired // spring管理bean物件所需要的環境
	private ApplicationContext context;

	@RequestMapping(path = { "/searchBook.controller" })
	public ModelAndView method(String bookName, Model model) {
		if (bookName != null) {
			
			List<ProductBean> result = productDAOHibernate.selectBookbyName(bookName);
			System.out.println(result);
			if(result.size()!=0) {
			model.addAttribute("bookBeans", result);
			model.addAttribute("searchReasultNumber", result.size());
			}else {
			model.addAttribute("searchReasultNumber", 0);
			model.addAttribute("searchResult", "沒有與 "+bookName+" 名稱相符合的相關書籍唷");
			}
			model.addAttribute("bookName", bookName);
			
		}			
		return new ModelAndView("book.search");
	}

}
