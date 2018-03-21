package controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;



import model.BookcaseBean;
import model.dao.BookcaseDAO;
import model.dao.CollectionDAO;


@Controller
public class BookCaseDelete {
	@Autowired
	private  BookcaseDAO  bookcaseDAO = null;
	@Autowired
	private  CollectionDAO  collectionDAO = null;
	
	@RequestMapping(path="/bookcasedelete.controller",produces="application/json;charset=UTF-8")
	public @ResponseBody boolean bookdelete(BookcaseBean bean,Model model) {
		
		    collectionDAO.upde(bean.getBCID());
		    boolean result = bookcaseDAO.delete(bean.getBCID());
			return result;
			
								
			 
			 }
						 
			
		
		
	
	
	
	
}
