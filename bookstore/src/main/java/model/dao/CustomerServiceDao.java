package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.CustomerServiceBean;
import model.MemberBean;

@Repository
@Transactional
public class CustomerServiceDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional(readOnly = true)
	public List<CustomerServiceBean> listAllMsgByMemId(Integer memID) {
		List<CustomerServiceBean> list = new ArrayList<CustomerServiceBean>();
		Session session = this.getSession();
		String sql = "FROM CustomerServiceBean WHERE memId= '" + memID + "'";

		list = session.createQuery(sql, CustomerServiceBean.class).list();
		return list;

	}
	
	@Transactional(readOnly = true)
	public List<Object[]> listAllMsgWithName() {
		List<Object[]> list = new ArrayList<Object[]>();
		Session session = this.getSession();
		String sql = "SELECT c.csId, m.userName, c.requestTime, c.csTitle, c.csMessage, c.replyMsg, c.processStatus, c.responseTime FROM CustomerServiceBean c left join MemberBean m  on c.memID = m.memId";
		list = session.createQuery(sql, Object[].class).list();
		return list;

	}
	
	@Transactional( readOnly=true, noRollbackFor=Exception.class)
	public List<CustomerServiceBean> listAllMsg() {
		List<CustomerServiceBean> list = new ArrayList<CustomerServiceBean>();
		Session session = this.getSession();
		String sql = "FROM CustomerServiceBean";
		list = session.createQuery(sql, CustomerServiceBean.class).list();
		return list;

	}
		
	@Transactional(readOnly = true)
	public CustomerServiceBean selectByCsId(Integer csId) {
		CustomerServiceBean bean = this.getSession().get(CustomerServiceBean.class,csId);
		return bean;
	}
	

	
	public void addMessage(CustomerServiceBean bean) {
		if (bean != null) {
			this.getSession().saveOrUpdate(bean);
		}
	}

	
}
