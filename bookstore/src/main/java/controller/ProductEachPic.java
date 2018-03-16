package controller;




import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.ProductBean;
import model.dao.ProductDAO;

@Controller

public class ProductEachPic {

	@Autowired
	private ProductDAO productDAOHibernate = null;
	
	@Autowired //spring管理bean物件所需要的環境
	private ApplicationContext context;
	
	@RequestMapping(path={"/bookimg.controller"})
	public void method(HttpServletRequest request, HttpServletResponse response,@RequestParam("bookId") Integer dcnNo,Model model) throws SQLException {
		  ServletOutputStream out = null;
		  try {
	        ProductBean result =productDAOHibernate.selectbookId(dcnNo);
	        Blob contents = result.getCoverImage();
	    
	     byte[]  content = contents.getBytes(1,(int)contents.length());
		 InputStream is = new ByteArrayInputStream(content);
         response.setContentType("image/*");
         out = response.getOutputStream();
         int len=0;
         byte[]buf=new byte[1024];
         while((len=is.read(buf,0,1024))!=-1){
             out.write(buf, 0, len);
         }

         out.flush();
         out.close();
         
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		 
		
		
        
		
			
	}
		
		
			
		
	
}
