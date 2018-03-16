package controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import model.ProductBean;
import model.dao.ProductDAO;

@Controller

public class ProductEachController {

	@Autowired
	private ProductDAO productDAOHibernate = null;
	
	@Autowired //spring管理bean物件所需要的環境
	private ApplicationContext context;
	///Page/bookeach.controller
	@RequestMapping("/bookPages.controller")
	public String method(@RequestParam("bookId") Integer dcnNo,ProductBean bean,Model model) {

		ProductBean result =productDAOHibernate.selectbookId(dcnNo);
        model.addAttribute("book",result);
		return "book.select";
			
	}
		
		
			
		
	
}
