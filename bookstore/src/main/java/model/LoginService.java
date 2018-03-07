package model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDaoJdbc;

@Service
@Transactional
public class LoginService {

	@Autowired
	private MemberDaoJdbc memberDao;

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
