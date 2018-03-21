package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.CategoryBean;
import model.ProductBean;
import model.dao.CategoryDaoJdbc;
import model.dao.ProductDAO;
//透過導覽列的搜尋鈕或找書去時呼叫的Controller
//顯示搜尋結果頁面或所有產品頁面
@Controller
public class SearchBookController {

	@Autowired
	private ProductDAO productDAOHibernate = null;

	@Autowired // spring管理bean物件所需要的環境
	private ApplicationContext context;

	@Autowired
	private CategoryDaoJdbc categoryDaoJdbc;
	@RequestMapping(path = { "/searchBook.controller" })
	public ModelAndView method(String bookName, String displayType, String category, Model model) {

		int cate = 0;
		if (category.trim() != "" && category != null) {
			cate = Integer.parseInt(category);
		}
		// 透過search判斷顯示搜尋結果或是所有產品頁面
		// 產品頁面
		if ("allbooks".equalsIgnoreCase(displayType)) {
			List<ProductBean> result = productDAOHibernate.selectBookbyName("");
			model.addAttribute("bookBeans", result);
			model.addAttribute("searchReasultNumber", result.size());
			model.addAttribute("bookBeans", result);
			model.addAttribute("displayType", "allbooks");

		} else if (cate != 0) {
			List<ProductBean> result = productDAOHibernate.selectbookNo(cate);
			model.addAttribute("bookBeans", result);
			model.addAttribute("searchReasultNumber", result.size());
			model.addAttribute("bookBeans", result);
			model.addAttribute("displayType", "displayBycategory");
			CategoryBean categoryBean= categoryDaoJdbc.getCategoryById(cate);
			model.addAttribute("categoryBean", categoryBean);
			
		} else {
			// 搜尋結果
			if (bookName != null) {
				List<ProductBean> result = productDAOHibernate.selectBookbyName(bookName);
				System.out.println(result);
				// 有撈到書籍
				if (result.size() != 0) {
					model.addAttribute("bookBeans", result);
					model.addAttribute("searchReasultNumber", result.size());
				} else {
					// 沒撈到書籍
					model.addAttribute("searchReasultNumber", 0);
					model.addAttribute("searchResult", "沒有與 " + bookName + " 名稱相符合的相關書籍");
				}
				model.addAttribute("bookName", bookName);

			}
		}
		return new ModelAndView("book.search");
	}

}
