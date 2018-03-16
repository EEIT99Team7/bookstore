package controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.ProductBean;
import model.dao.ProductDAO;

@Controller
public class bookNoController {

	@Autowired
	private ProductDAO productDAOHibernate = null;
	
	@Autowired //spring管理bean物件所需要的環境
	private ApplicationContext context;

	private static Gson gson = new Gson();  
	
	@RequestMapping(path="/book.controller",produces="application/json;charset=UTF-8")
	public  @ResponseBody String doGet(@RequestParam("bookNo") Integer dcnNo,ProductBean bean,Model model) {
		 
		       List<ProductBean> result = productDAOHibernate.selectbookNo(dcnNo);
		      String json=gson.toJson(result);
		  
		  return json; 
		  
		
		
	}
}
