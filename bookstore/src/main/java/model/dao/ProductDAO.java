package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.ProductBean;


@Repository
@Transactional
public class ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getopenSession() {
		return sessionFactory.openSession();
	}
		
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//查個別書
	public ProductBean selectbookId(Integer bookId) {
		
		return this.getSession().get(ProductBean.class, bookId);
	}
	//查類別書
	public List<ProductBean> selectbookNo(Integer bookNo) {
		return this.getSession().createQuery(
		"from ProductBean where bookNo=?", ProductBean.class).setParameter(0, bookNo).list();
	}
	
	
	//查全部的書
	public List<ProductBean> select() {
		return this.getSession().createQuery(
				"from ProductBean", ProductBean.class).list();
	}
	//新增書 (比對書名)
	public ProductBean insert(ProductBean bean) {
		if(bean!=null) {
			ProductBean temp =
					this.getSession().get(ProductBean.class, bean.getTitle());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	//刪除書名
	public boolean delete(Integer id) {
		ProductBean result = this.getSession().get(ProductBean.class, id);
		if(result!=null) {
			this.getSession().delete(result);
			return true;
		}
		return false;
	}
	
	//使用書名查書
	public List<ProductBean> selectBookbyName(String bookName){
		String sql ="From ProductBean WHERE title LIKE '%"+bookName+"%'";
		
		List<ProductBean> temp= this.getSession()
									.createQuery(sql, ProductBean.class).list();		
		return temp;
	}
	
}
