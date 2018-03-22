package model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BookcaseBean;
import model.CollectionBean;

@Repository
@Transactional
public class CollectionDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
//查會員書庫的收藏書
	public List<CollectionBean> selectbook(BookcaseBean bean) {
		return  this.getSession().createQuery(
		"from CollectionBean where MemID=? and BCID=?",CollectionBean.class)
		.setParameter(0,bean.getMemID()).setParameter(1, bean.getBCID()).list();
		
			
	}

//查已收藏該本書的會員
	public List<Object[]> selectmemByBookId(Integer bookId) {
		return  (List<Object[]>)this.getSession().createQuery(
		"Select c.memID,m.nickName from CollectionBean c Join MemberBean m on c.memID = m.memId where c.bookId=?",Object[].class)
		.setParameter(0,bookId).list();			
	}	
	
//查會員全部的收藏
	public List<CollectionBean> selectallbook(Integer memID) {
		return  this.getSession().createQuery(
		"from CollectionBean where memID=?",CollectionBean.class).setParameter(0,memID).list();
		
			
	}
	
//新增收藏書
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
//刪除收藏 (比對收藏id)
//			public boolean delete(Integer ID) {
//				CollectionBean result = this.getSession().get(CollectionBean.class,ID);
//				if(result!=null) {
//					this.getSession().delete(result);
//					return true;
//				}
//				return false;
//			}
//刪除收藏			
			public boolean delete(Integer memID,Integer bookId) {
				CollectionBean result = 
						this.getSession().createQuery(
								"from CollectionBean where memID=? and bookId=? ", CollectionBean.class)
						.setParameter(0,memID).setParameter(1,bookId).uniqueResult();
				if(result!=null) {
					this.getSession().delete(result);
					return true;
				}
				return false;
			}			
			
	
//更新書的狀態及書庫
			public CollectionBean update(Integer memID,Integer bookId,Integer BCID) {
				CollectionBean result = 
						this.getSession().createQuery(
								"from CollectionBean where bookId=?and memID=?", CollectionBean.class)
						.setParameter(0,bookId).setParameter(1,memID).uniqueResult();
						
				if(result!=null) {
					result.setBCID(BCID);
					//result.setBstatus(Bstatus);;
					
				}
				return result;
			}

//刪除書庫前清空書
			public List<CollectionBean> upde(Integer BCID) {
				List<CollectionBean> result = 
						this.getSession().createQuery(
								"from CollectionBean where BCID=?", CollectionBean.class)
						.setParameter(0,BCID).list();
				
				if(result!=null) {
					for(int i=0; i<result.size();i++) {	  
	                 //result.get(i).getMemID();
	                 //result.get(i).getBookId();
	                 BCID= null;
	                 update(result.get(i).getMemID(), result.get(i).getBookId(),BCID);
	                 }
					}return result;
				

			}
			
			public List<CollectionBean> selectBnmae(String Bstatus) {
				return  this.getSession().createQuery(
						"from CollectionBean where Bstatus=?",CollectionBean.class)
				.setParameter(0,Bstatus).list();			
			}	

}
