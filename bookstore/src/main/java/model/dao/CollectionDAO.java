package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import model.BookcaseBean;
import model.CollectionBean;
@Repository
public class CollectionDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	//新增
	public CollectionBean insert(CollectionBean bean) {
		
		if(bean!=null&&bean.getBookId()!=null) {
			
			CollectionBean temp =
					this.getSession().createQuery(
							"from CollectionBean where bookId=?and memID=?", CollectionBean.class)
					.setParameter(0,bean.getBookId()).setParameter(1,bean.getMemID()).uniqueResult();
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
		
	}
	//刪除 (比對id)
			public boolean delete(Integer ID) {
				CollectionBean result = this.getSession().get(CollectionBean.class,ID);
				if(result!=null) {
					this.getSession().delete(result);
					return true;
				}
				return false;
			}
			
	
	//更新書的狀態及書庫
			public CollectionBean update(Integer ID ,Integer memID,Integer bookId,Integer BCID,Integer Bstatus) {
				CollectionBean result = this.getSession().get(CollectionBean.class,ID);
				if(result!=null) {
					result.setBCID(BCID);
					result.setBstatus(Bstatus);;
					
				}
				return result;
			}



	
			
	
}
