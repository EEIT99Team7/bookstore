package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.CollectionBean;
import model.dao.CollectionDAO;


@Controller
public class SelectAllBook {
	@Autowired
	private  CollectionDAO  collectionDAO = null;
private static Gson gson = new Gson();  
	
	@RequestMapping(path="/selectallbook.controller",produces="application/json;charset=UTF-8")
	public  @ResponseBody String doGet2(@RequestParam("memID") Integer dcnNo,CollectionBean bean,Model model) {
		 
		 List<CollectionBean> result = collectionDAO.selectallbook(dcnNo);
	      String json=gson.toJson(result);
		  
		  return json; 
		  
		
		
	}

	

}
