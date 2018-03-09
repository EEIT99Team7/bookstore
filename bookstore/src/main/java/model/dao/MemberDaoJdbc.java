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
	
	@Transactional(readOnly = true)
	public MemberBean selectBymemberEmail(String email) {
		String sql = "FROM MemberBean WHERE email = '"+ email + "'";
		MemberBean bean = this.getSession().createQuery(sql, MemberBean.class).uniqueResult();
		return bean;
	};
	@Transactional(readOnly = true)
	public MemberBean selectByUserName(String userName) {
		String sql = "FROM MemberBean WHERE userName = '"+ userName + "'";
		MemberBean bean = this.getSession().createQuery(sql, MemberBean.class).uniqueResult();
		return bean;
	};
	
	@Transactional(readOnly = true)
	public MemberBean selectByResetId(String resetId) {
		String sql = "FROM MemberBean WHERE resetId = '"+ resetId + "'";
		MemberBean bean = this.getSession().createQuery(sql, MemberBean.class).uniqueResult();
		return bean;
	};
	
	@Transactional(readOnly = true)
	public List<MemberBean> selectAll() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		Session session = this.getSession();
		
		list = session.createQuery("FROM MemberBean", MemberBean.class).list();
		return list;

	};
	
	public void updateRestStatus(String email, Boolean resetState, String resetId) {
		MemberBean memberBean = this.selectBymemberEmail(email);
		memberBean.setResetId(resetId);
		memberBean.setResetState(resetState);
	}
	
}