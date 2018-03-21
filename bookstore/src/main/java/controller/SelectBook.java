package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.ProductBean;
import model.dao.ProductDAO;

@Controller
public class SelectBook {
	@Autowired
	private ProductDAO productDAOHibernate = null;
private static Gson gson = new Gson();  
	
	@RequestMapping(path="/selectbook.controller",produces="application/json;charset=UTF-8")
	public  @ResponseBody String doGet(@RequestParam("bookId") Integer dcnNo,ProductBean bean,Model model) {
		 
		ProductBean result = productDAOHibernate.selectbookId(dcnNo);
	      String json=gson.toJson(result);
		  
		  return json; 
		  
		
		
	}

	

}
