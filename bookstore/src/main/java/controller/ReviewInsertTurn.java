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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;

import model.ProductBean;
import model.ReviewBean;
import model.dao.ProductDAO;
import model.dao.ReviewDAOHibernate;

@Controller
@RequestMapping(path = { "/TurnReivew.controller" })
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
	
	private static Gson gson = new Gson();

	
	@RequestMapping(method = { RequestMethod.GET})
	public String processGet(Integer bookId, Model model) {
			System.out.println("bookID="+bookId);
		
		ProductBean book = productDAOHibernate.selectbookId(bookId);
		model.addAttribute("book", book);
		return "review.insert";
		
	}
	@RequestMapping(method = { RequestMethod.POST })
 public ModelAndView processPost( String content,String score, String memID,Model model, ReviewBean bean,Integer bookId) {
		System.out.println("memID="+memID);
		System.out.println("content="+content);
		System.out.println("bean="+bean);

		ProductBean book = productDAOHibernate.selectbookId(bookId);
		model.addAttribute("books", book);

		// 接收資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		// 轉換資料

		// 驗證資料
		if (content == null || content.length() == 0) {
			errors.put("contenterror", "請輸入Content");
		} else {
			bean.setMemID(Integer.valueOf(memID));
			// 預設值
			bean.setMake(new Date());
			bean.setGoodlike(0);
			bean.setStatusNo(true);
			ReviewBean insert = reviewDAO.insert(bean);
			if (insert == null) {
				errors.put("action", "Insert fail");
			} else {
				model.addAttribute("insert", insert);
				String url= "/bookstore/bookPages.controller?bookId=" + bookId+ "";
				return new ModelAndView( new RedirectView(url));
			}
			if (errors != null && !errors.isEmpty()) {
				return new ModelAndView("book.select");
			}

		}
		return new ModelAndView("book.select");
		
	 }
 }

