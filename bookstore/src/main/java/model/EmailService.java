package model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import misc.JavaMailUtil;

@Service
public class EmailService {
	 
	//寄件人地址
	 private final String FROM = "eeit9907@outlook.com";
	//收件人地址
	 List<String> to = new ArrayList<>();
	//副本
	 List<String> cc = null;
	//密件副本
	 List<String> bcc = null;
	//信件主旨
	 String subject ="";
	//信件內容
	 String text ="";
	 List<String> attachment = null;

	public String sendForgotPasswordEmail(String email ,String resetId) {
		to.add(email);
		subject="會員密碼認證信函";
		text = "<p>＊ 此信件為系統發出信件，請勿直接回覆，感謝您的配合。謝謝！＊<br /><br />"+  
				"親愛的會員 您好：<br /><br />" + 
				"這封認證信是用以處理您忘記密碼，當您收到本「認證信函」後，請直接點選下方連結重新設置您的密碼，無需回信。</p>" + 
//				"<a href=\"http://localhost:8080/bookstore/resetpassword?verify=" + resetId + "\">啟動認證信</a>";
				"<p><a href=\"http://localhost:8080/bookstore/resetpassword?verify="+resetId+"\">"+ 
				"<span style=\"color: #ff0000;\">按此認證，重設密碼</span></a></p>";
	
		JavaMailUtil util = new JavaMailUtil(FROM, to, cc, bcc, subject, text, attachment);
		if (util.send()) {
			return "<script>alert(\"已寄出認證信\");window.location.href = '../index.jsp';</script>";
		} else {
			System.out.println("發信失敗");
			return "<script>alert(\"信件寄發錯誤，請稍後再試\");</script>";
		}
	}
}
