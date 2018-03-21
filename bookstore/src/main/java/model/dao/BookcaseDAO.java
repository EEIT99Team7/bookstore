package model.dao;

import java.util.List;

import javax.print.attribute.standard.Media;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;

import model.BookcaseBean;
import model.ProductBean;

@Repository
@Transactional
public class BookcaseDAO {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//查詢書庫名
		public BookcaseBean selectName(Integer BCID) {
			
			return this.getSession().get(BookcaseBean.class, BCID);
					
		}
		
	
//查詢會員的書庫
	public List<BookcaseBean> select(BookcaseBean bean) {
		
		return this.getSession().createQuery(
				"from BookcaseBean where memID=?", BookcaseBean.class).setParameter(0,bean.getMemID()).list();
	}
	

//新增書庫 (比對書庫名)
		public boolean insert(BookcaseBean bean) {
			if(bean!=null) {
				
				BookcaseBean temp =
						this.getSession().createQuery(
								"from BookcaseBean where bCname=?", BookcaseBean.class).setParameter(0,bean.getBCname()).uniqueResult();
				if(temp==null) {
					this.getSession().save(bean);
					return true;
				}
			}
			return false;
		}

//刪除書庫 (比對書庫id)
		public boolean delete(Integer BCID ) {
			BookcaseBean result = this.getSession().get(BookcaseBean.class,BCID);
			if(result!=null) {
				this.getSession().delete(result);
				return true;
			}
			return false;
		}
		
//更新書庫名
				public BookcaseBean update(Integer BCID,Integer memID, String  BCname) {
					BookcaseBean result = this.getSession().get(BookcaseBean.class,BCID);
					if(result!=null) {
						result.setBCname(BCname);
					}
					return result;
				}
						

	
	
	
}
