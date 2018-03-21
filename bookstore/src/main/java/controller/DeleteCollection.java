package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import model.CollectionBean;
import model.dao.CollectionDAO;

@Controller
public class DeleteCollection {
	
	
	@Autowired
	private  CollectionDAO collectionDAO= null ;
	
	
	
	@RequestMapping(path="/deleteCollection.controller",produces="application/json;charset=UTF-8")
	public  @ResponseBody  boolean method(CollectionBean bean,Model model) {
		 
		boolean result = collectionDAO.delete(bean.getMemID(),bean.getBookId());
			 
					
					return result;
										
			 
			
		
		
	}



}
