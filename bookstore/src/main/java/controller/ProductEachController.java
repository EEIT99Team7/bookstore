package controller;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.LikeBean;
import model.MemberBean;
import model.ProductBean;
import model.ReviewBean;
import model.dao.CollectionDAO;
import model.dao.LikeDAOHibernate;
import model.dao.MemberDaoJdbc;
import model.dao.ProductDAO;
import model.dao.ReviewDAOHibernate;

@Controller

public class ProductEachController {
	//書籍DAO
	@Autowired
	private ProductDAO productDAOHibernate = null;
	//會員DAO
	@Autowired
	private MemberDaoJdbc memberDaoJdbc = null;
	
	//書評相關DAO
	@Autowired
	private ReviewDAOHibernate reviewDAOHibernate = null;
	@Autowired
	private LikeDAOHibernate likeDAOHibernate = null;
	
	//收藏DAO
	@Autowired
	private CollectionDAO collectionDAO ;
	
	//spring管理bean物件所需要的環境
	@Autowired 
	private ApplicationContext context;

	@RequestMapping("/bookPages.controller")
	public String method(@RequestParam("bookId") Integer dcnNo,ProductBean bean, LikeBean lbean,Model model,HttpSession session) {
		//顯示書
		ProductBean result =productDAOHibernate.selectbookId(dcnNo);
        model.addAttribute("book",result);
        
        //顯示收藏該本書的所有會員
        List<Object[]> tempList= collectionDAO.selectmemByBookId(dcnNo);
        //如果有會員收藏該本書，將收藏者資訊放至Request範圍物件
        if(tempList.size()!=0) {
        	List<HashMap<String, String>> bookmem =new LinkedList<HashMap<String, String>>();
        	for(int i =0 ; i < tempList.size() ; i++) {
        		HashMap<String,String> tempMap= new HashMap<String,String>();
        		tempMap.put("memId", tempList.get(i)[0].toString());
        		System.out.println("memId:"+tempList.get(i)[0].toString());
        		System.out.println("nickName:"+tempList.get(i)[1].toString());
        		tempMap.put("nickName", tempList.get(i)[1].toString());       
        		bookmem.add(tempMap);
        	}
        	model.addAttribute("BookCollectors",bookmem);
        }
        
        //書評相關程式碼
        ReviewBean rbean =null;
		MemberBean mbean = (MemberBean) session.getAttribute("LoginOK");
        
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		List<Object[]> sb = reviewDAOHibernate.selectByBookId(dcnNo);
		if (sb.size() != 0) {
			List<HashMap<String, String>> rlist = new ArrayList<>();
			for (int i = 0; i < sb.size(); i++) {
				HashMap<String, String> temp = new HashMap<>();
				temp.put("nickname", sb.get(i)[0].toString());
				temp.put("content", sb.get(i)[1].toString());
				temp.put("make", sb.get(i)[2].toString());
				if(sb.get(i)[3]!=null) {
					temp.put("score", sb.get(i)[3].toString());}
				else {
					temp.put("score", "0");
				}
				Integer rid = Integer.parseInt(sb.get(i)[4].toString());
				Long templike = likeDAOHibernate.sumLike(rid);
				temp.put("like", templike.toString());
				temp.put("reviewId", sb.get(i)[4].toString());
				temp.put("memId", sb.get(i)[5].toString());
				if(mbean!=null) {
					// 檢查memLike
					Long tempmemlike = likeDAOHibernate.checkmemlike(rid, mbean.getMemId());
					temp.put("memlike", tempmemlike.toString());					
				}
				rlist.add(temp);
			}
			model.addAttribute("review", rlist);
		} else {
			errors.put("noreivew", "沒有評論");
		}
		if(mbean!=null) {
			rbean = reviewDAOHibernate.select(mbean.getMemId(), dcnNo);
		}
		
		if (rbean == null) {
			errors.put("nobody", "沒有評論過");
		}
				
		return "book.select";
								
	}
		
		
			
		
	
}
