package model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AdverBean;
import model.ProductBean;
@Repository
public class GetImageImpl {
	@Autowired
	AdverDaoJdbc adao;
	@Autowired
	ProductDaoJdbc pdao;
	
	public GetImageImpl() {
	}
	//取得廣告圖片
	public AdverBean getAdImage(Integer Id) {
		AdverBean bean = null;
		try {
			bean = adao.queryAdById(Id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	//取得書籍圖片
	public ProductBean getBookImage(Integer Id) {
		ProductBean bean = null;
		try {
			bean = pdao.queryBookById(Id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
}
