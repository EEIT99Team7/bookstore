package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.BookcaseBean;
import model.BookstatusBean;
import model.CollectionBean;
import model.dao.BookstatusDAO;
import model.dao.CollectionDAO;

@Controller
public class SelectBookstatus {
	@Autowired
	private  BookstatusDAO bookstatusDAO= null;
	
	private static Gson gson = new Gson();
	
	@RequestMapping(path="/SelectBookstatus.controller",produces="application/json;charset=UTF-8")
	public @ResponseBody  String selectbookcase(BookstatusBean bean,Model model) {
		 
		
			
			 List<BookstatusBean> result = bookstatusDAO.select(bean);
			 String json=gson.toJson(result);
			 System.out.println(json);
			 // model.addAttribute("bkcase",result);
			   //return "select.Bookc";
			 return json; 							
			 
			 }
						 
			
		
		
}
