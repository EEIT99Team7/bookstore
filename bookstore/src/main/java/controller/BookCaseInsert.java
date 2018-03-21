package controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.BookcaseBean;
import model.dao.BookcaseDAO;




@Controller
public class BookCaseInsert {
	@Autowired
	private  BookcaseDAO  bookcaseDAO = null;
	
	
	@RequestMapping(path="/bookcaseInsert.controller",produces="application/json;charset=UTF-8")
	public @ResponseBody boolean BookInsert(BookcaseBean bean,Model model) {

		boolean result = bookcaseDAO.insert(bean);
			return  result;
			
		
			
								
			 
			 }
						 
			
		
		
	
	
	
	
}
