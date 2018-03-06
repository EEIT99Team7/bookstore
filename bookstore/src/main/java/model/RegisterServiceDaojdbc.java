package model;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDaoJdbc;

@Service
@Transactional
public class RegisterServiceDaojdbc {

	@Autowired
	private MemberDaoJdbc memberDao;

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	synchronized public boolean userNameExists(String userName) {
		MemberBean memberbean = memberDao.selectByUserName(userName);
		boolean exist = false;
		if (memberbean != null) {
			exist = true;
		}
		return exist;
		
	}

	synchronized public int addMember(MemberBean memberBean) throws SQLException  {
		int n = 0;
		Session session = getSession();
		session.save(memberBean);
		n = 1;
		return n;
	}

}
