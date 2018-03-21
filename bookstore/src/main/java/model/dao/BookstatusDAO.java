package model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;


import model.BookcaseBean;
import model.BookstatusBean;


@Repository
@Transactional
public class BookstatusDAO {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//查詢狀態名
		public BookstatusBean selectSName(Integer Bstatus) {
			
			return this.getSession().get(BookstatusBean.class, Bstatus);
					
		}
		
	
//查詢會員的狀態
	public List<BookstatusBean> select(BookstatusBean bean) {
		
		return this.getSession().createQuery(
				"from BookstatusBean where memID=?", BookstatusBean.class).setParameter(0,bean.getMemID()).list();
	}
	

//新增狀態 (比對名)
		public boolean insert(BookstatusBean bean) {
			if(bean!=null) {
				
				BookstatusBean temp =
						this.getSession().createQuery(
								"from BookstatusBean where Bstatusname=?", BookstatusBean.class).setParameter(0,bean.getBstatusname()).uniqueResult();
				if(temp==null) {
					this.getSession().save(bean);
					return true;
				}
			}
			return false;
		}

//刪除狀態 (比對id)
		public boolean delete(Integer Bstatus) {
			BookstatusBean result = this.getSession().get(BookstatusBean.class,Bstatus);
			if(result!=null) {
				this.getSession().delete(result);
				return true;
			}
			return false;
		}
		
//更新狀態名
				public BookstatusBean update(Integer memID, String Bstatusname) {
					BookstatusBean result = this.getSession().get(BookstatusBean.class,Bstatusname);
					if(result!=null) {
						result.setBstatusname(Bstatusname);
					}
					return result;
				}
						

	
	
	
}
