package _04_ShoppingCart.model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.OrderItemBean;
// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單
@Repository
@Transactional
public class OrderDaoImpl implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String memberId = null;
	
	@Autowired
	private SessionFactory sessionFactory;

	public OrderDaoImpl()  {
	}


	public void insertOrder(OrderBean ob)  {
		Session session = getSession();
		System.out.println("before insert order");
		try {
			session.save(ob);

			System.out.println("after insert order");
		} catch(Exception ex){
			ex.printStackTrace();
		}
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
		String hql = "FROM OrderBean o ORDER BY o.orderDate ASC";
		Session session = getSession();
		
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.getResultList();
			tx.commit();
		} catch(Exception ex){
			if ( tx != null) tx.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
//	@Override
//	public List<OrderBean> getMemberOrders() {
//		List<OrderBean> list = new ArrayList<OrderBean>();
//		String hql = "FROM OrderBean Order by orderDate desc where memberId = :memberId";
//        Session session = getSession();
//        Transaction tx = null;
//        try{
//        	tx = session.beginTransaction();
//        	Query query = session.createQuery(hql).setParameter("memberId", memberId);
//        	list = query.getResultList();
//        	tx.commit();
//        } catch(Exception ex) {
//        	if ( tx!= null ) tx.rollback();
//        	ex.printStackTrace();
//        } finally {
//			session.close();
//		}
//		return list;
//	}
//	@Override
//	public String getMemberId() {
//		return memberId;
//	}
//
//	@Override
//	public void setMemberId(String memberId) {
//		this.memberId = memberId;
//	}
	

	public Session getSession() {
		return sessionFactory.openSession();
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
}