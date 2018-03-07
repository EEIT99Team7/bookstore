package model;

import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDaoJdbc;


@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberDaoJdbc memberDao;

//	@Autowired
//	private SessionFactory sessionFactory;
//
//	public Session getSession() {
//		return sessionFactory.getCurrentSession();
//	}

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

	
	
	
	
	
	
	public static final int    IMAGE_FILENAME_LENGTH = 20;
		
	    // 本方法調整fileName的長度小於或等於maxLength。
		// 如果fileName的長度小於或等於maxLength，直接傳回fileName
		// 否則保留最後一個句點與其後的附檔名，縮短主檔名使得fileName的總長度
		// 等於maxLength。
		public static String adjustFileName(String fileName, int maxLength) {
			  int length = fileName.length();
			  if ( length <= maxLength ) {
				  return fileName ;
			  }
	    	  int n      = fileName.lastIndexOf(".");
	          int sub    = fileName.length() - n - 1;
	          fileName = fileName.substring(0, maxLength-1-sub) + "." 
	                       + fileName.substring(n+1); 
			return fileName;
		}
	
	
	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	

	public MemberBean forgotPassword(String email) {
		MemberBean memberBean = memberDao.selectBymemberEmail(email);
		return memberBean;
		
	}
}
