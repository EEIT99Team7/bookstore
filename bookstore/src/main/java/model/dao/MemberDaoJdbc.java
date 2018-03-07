package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;

@Repository
@Transactional
public class MemberDaoJdbc {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Transactional(readOnly = true)
	public MemberBean selectBymemberID(int memberID) {
		MemberBean bean = this.getSession().get(MemberBean.class,memberID);
		return bean;
	};
	

	public MemberBean selectBymemberEmail(String email) {
		String sql = "FROM MemberBean WHERE email = '"+ email + "'";
		MemberBean bean = this.getSession().createQuery(sql, MemberBean.class).uniqueResult();
		return bean;
	};

	public MemberBean selectByUserName(String UserName) {
		String sql = "FROM MemberBean WHERE UserName = '"+ UserName + "'";
		MemberBean bean = this.getSession().createQuery(sql, MemberBean.class).uniqueResult();
		return bean;
	};
	
	public List<MemberBean> selectAll() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		Session session = this.getSession();
		
		list = session.createQuery("FROM MemberBean", MemberBean.class).list();
		return list;

	};
	
	
}