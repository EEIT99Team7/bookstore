package _04_ShoppingCart.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _04_ShoppingCart.model.OrderBean;


@Repository
@Transactional
public class OrderQueryDaoImpl {
	
	private String memberId = null;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public OrderBean getOrder(int orderNo)  {
		Session session = getSession();
		OrderBean ob = null;
		
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			ob = session.get(OrderBean.class, orderNo);
//			tx.commit();
//		} catch(Exception ex){
//			if ( tx != null) tx.rollback();
//			ex.printStackTrace();
//		} finally {
//			session.close();
//		}
		return ob;
	}

	public OrderBean getOrderOpenSessionInViewFilter(int orderNo)  {
		Session session = getCurrentSession();
		OrderBean ob = null;
		
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			ob = session.get(OrderBean.class, orderNo);
//			tx.commit();
//		} catch(Exception ex){
//			if ( tx != null) tx.rollback();
//			ex.printStackTrace();
//		} finally {
//			session.close();
//		}
		return ob;
	}

	public List<OrderBean> getAllOrders()  {
		List<OrderBean> list = new ArrayList<OrderBean>();
		String hql = "FROM OrderBean o ORDER BY o.orderDate DESC";
		Session session = getSession();
		
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.getResultList();
//			tx.commit();
//		} catch(Exception ex){
//			if ( tx != null) tx.rollback();
//			ex.printStackTrace();
//		} finally {
//			session.close();
//		}
		return list;
	}
	
	public List<OrderBean> getMemberOrders() {
		List<OrderBean> list = new ArrayList<OrderBean>();
		String hql = "FROM OrderBean Order by orderDate desc where userId = :userId";
        Session session = getSession();
//        Transaction tx = null;
//        try{
//        	tx = session.beginTransaction();
        	Query query = session.createQuery(hql).setParameter("userId", memberId);
        	list = query.getResultList();
//        	tx.commit();
//        } catch(Exception ex) {
//        	if ( tx!= null ) tx.rollback();
//        	ex.printStackTrace();
//        } finally {
//			session.close();
//		}
		return list;
	}

	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	

	public Session getSession() {
		return sessionFactory.openSession();
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

}
