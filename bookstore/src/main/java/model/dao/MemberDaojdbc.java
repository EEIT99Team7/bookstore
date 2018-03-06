package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;

@Repository
public class MemberDaojdbc {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public MemberBean selectBymemberID(int memberID) {
		return this.getSession().get(MemberBean.class, memberID);
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