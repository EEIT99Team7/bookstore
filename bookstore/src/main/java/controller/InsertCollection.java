package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.CollectionBean;
import model.ProductBean;
import model.dao.CollectionDAO;

@Controller
public class InsertCollection {
	
	
	@Autowired
	private  CollectionDAO collectionDAO= null ;
	
	private static Gson gson = new Gson(); 
	
	@RequestMapping(path="/InsertCollection.controller",produces="application/json;charset=UTF-8")
	public  @ResponseBody  String method(CollectionBean bean,Model model) {
		 
			 CollectionBean result = collectionDAO.insert(bean);
			 System.out.println(result);
			 if(result!=null) {
				 String json =gson.toJson(result);
					
					return json;
										
			 
			 }
						 
			 return null;
		 
		
		
	}



}
