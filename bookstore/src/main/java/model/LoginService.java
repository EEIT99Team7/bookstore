package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDaojdbc;

@Service
@Transactional
public class LoginService {

	@Autowired
	private MemberDaojdbc memberDao;

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// public boolean changePassword(String username, String oldPassword, String
	// newPassword) {
	// MemberBean bean = this.login(username, oldPassword);
	// if (bean != null) {
	// if (newPassword != null && newPassword.length() != 0) {
	// byte[] temp = newPassword.getBytes();
	// return customerDao.update(temp, bean.getEmail(), bean.getBirth(), username);
	// }
	// }
	// return false;
	// }

	@Transactional(readOnly = true)
	public MemberBean login(String username, String password) {
		MemberBean bean = memberDao.selectByUserName(username);
		if (bean != null) {
			if (password != null && password.length() != 0) {
				String temp = password; // 使用者輸入
				String pass = bean.getPw(); // 資料庫抓出
				if (temp.equals(pass)) {
					return bean;
				}
			}
		
		}
		return null;
	}
}
