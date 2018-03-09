package model;

import java.util.UUID;

import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import misc.SystemUtils;
import model.dao.MemberDaoJdbc;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDaoJdbc memberDao;

	// @Autowired
	// private SessionFactory sessionFactory;
	//
	// public Session getSession() {
	// return sessionFactory.getCurrentSession();
	// }

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

	public static final int IMAGE_FILENAME_LENGTH = 20;

	// 本方法調整fileName的長度小於或等於maxLength。
	// 如果fileName的長度小於或等於maxLength，直接傳回fileName
	// 否則保留最後一個句點與其後的附檔名，縮短主檔名使得fileName的總長度
	// 等於maxLength。
	public static String adjustFileName(String fileName, int maxLength) {
		int length = fileName.length();
		if (length <= maxLength) {
			return fileName;
		}
		int n = fileName.lastIndexOf(".");
		int sub = fileName.length() - n - 1;
		fileName = fileName.substring(0, maxLength - 1 - sub) + "." + fileName.substring(n + 1);
		return fileName;
	}

	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	//檢查resetId是否有效
	public Boolean checkResetId(String resetId) {
		MemberBean memberBean = memberDao.selectByResetId(resetId);
		//resetId存在
		if(memberBean != null) {
			//resetId存在，且重設密碼狀態為true
			if(memberBean.getResetState()) {
				return true;
			}else {//resetId存在，但重設密碼狀態為false
				//清除resetId
				memberDao.updateRestStatus(memberBean.getEmail(),false,null);
				return false;
			}			
		} 
		//resetId不存在
		return false;		
	}
	
	
	public String createResetId(String email) {
		
		// 1. 給予一組resetID
		String resetId = SystemUtils.getMD5Endocing(UUID.randomUUID().toString());
		
		// 2. resetID寫入bean，並修改狀態
		memberDao.updateRestStatus(email, true, resetId);
		
		return resetId;
		
//		// 給予一組resetID(包含開始時間,過期時間,email,resetId)
//		// 1.時間(72小時)
//		Long startTime = System.currentTimeMillis();
//		Long endTime = startTime + 1000 * 60 * 60 * 24 * 3;
//
//		// 2.建立 ResetId
//		String resetId = SystemUtils.getMD5Endocing(UUID.randomUUID().toString());
//
//		// 3. 建立token()
//		ResetPasswordToken token = new ResetPasswordToken(startTime, endTime, resetId, email);
//		byte[] tokentobyte = token.toString().getBytes();
//		System.out.println(token);
//		System.out.println(tokentobyte);
//		
//		// 4. 建立url網址
//		String url = Base64.getUrlEncoder().withoutPadding().encodeToString(tokentobyte);
//		System.out.println(url);
//		
//		// 5. 寫入bean
//		memberDao.updateRestStatus(email, true, resetId);
//		
		

	}

}
