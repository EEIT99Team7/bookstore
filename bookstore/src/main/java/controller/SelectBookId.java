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
import model.CollectionBean;

import model.dao.CollectionDAO;

@Controller
public class SelectBookId {
	@Autowired
	private  CollectionDAO collectionDAO= null;
	
	private static Gson gson = new Gson();
	
	@RequestMapping(path="/selectcollectionBookId.controller",produces="application/json;charset=UTF-8")
	public @ResponseBody  String selectbookcase(BookcaseBean bean,Model model) {
		 
		
			
			  List<CollectionBean> result = collectionDAO.selectbook(bean);
			 String json=gson.toJson(result);
			 System.out.println(json);
			 // model.addAttribute("bkcase",result);
			   //return "select.Bookc";
			 return json; 							
			 
			 }
						 
			
		
		
}
