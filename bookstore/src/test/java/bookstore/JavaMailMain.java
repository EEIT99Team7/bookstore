package bookstore;
import java.util.Arrays;
import java.util.List;

import misc.JavaMailUtil;

public class JavaMailMain {

	public static void main(String[] args) {

		//寄件人地址
		String from = "eeit9907@outlook.com";
		//收件人地址
		List<String> to = Arrays.asList(new String[] { "rchin1015@gmail.com" });
		//副本
		List<String> cc = null;
		//密件副本
		List<String> bcc = null;
		//信件主旨
		String subject = "測試信標題";
		
		//信件內容
//		String text = "<h1>謝謝您加入會員</h1>" + "<h2>您可以按下列連結感受最新的體驗</h2>" + "<a href='http://tw.yahoo.com'>yahoo</a><br>"
//				+ "<a href='http://www.google.com'>google</a><br>"
//				+ "<br><br><font color='blue'> 再次感謝, </font><br>工作小組敬上";
		String text = "test";
		
		//附件(範例)
//		List<String> attachment = Arrays.asList(
//				   new String[]{"C:\\_JSP\\maven3\\README.txt", 
//						   "D:\\_Java\\fs.jpg",
//						   "D:\\_Java\\autumn_fs.jpg",
//						   });;
		List<String> attachment = null;
		
		JavaMailUtil util = new JavaMailUtil(from, to, cc, bcc, subject, text, attachment);
		if (util.send()) {
			System.out.println("發信成功");
		} else {
			System.out.println("發信失敗");
		}
	}

}
