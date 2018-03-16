package controller;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.ProductBean;
import model.dao.ProductDAO;
import model.spring.PrimitiveNumberEditor;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO productDAOHibernate = null;
	
	@Autowired //spring管理bean物件所需要的環境
	private ApplicationContext context;
	
	@RequestMapping(path={"/bookpage.controller"})
	public String method(String prodaction,ProductBean bean,Model model) {
		
		
//接收資料
//驗證資料
		
//根據model執行結果呼叫view元件
           if("語言電腦".equals(prodaction)) {

			List<ProductBean> result = productDAOHibernate.selectbookNo(1);
            model.addAttribute("computer", result);
			return "product.select";
		  }
            if("各國旅遊".equals(prodaction)) {
          List<ProductBean> result = productDAOHibernate.selectbookNo(2);
          model.addAttribute("tourism", result);
		 return "product.select";
		}
         if("人文小說".equals(prodaction)) {
           List<ProductBean> result = productDAOHibernate.selectbookNo(3);
            model.addAttribute("fiction", result);
			return "product.select";
		}
          if("大眾心理".equals(prodaction)) {
			List<ProductBean> result = productDAOHibernate.selectbookNo(4);
            model.addAttribute("psychological", result);
			return "product.select";
			
		}
		return "product.select";
		
			
		
	}
}
