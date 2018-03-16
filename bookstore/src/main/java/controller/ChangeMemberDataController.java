package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import misc.SystemUtils;
import model.MemberBean;
import model.MemberService;
import model.dao.MemberDaoJdbc;

@Controller
@RequestMapping(path = "webs/member/editprofile.controller")
public class ChangeMemberDataController {

	@Autowired
	MemberDaoJdbc memberDao;

	@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView process(@RequestParam Map<String,String> formData, MultipartFile ImgFile ,
			Model model, HttpSession session) throws IOException, SQLException {

		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsgKey", errorMsg);

		// 讀入欄位
		MemberBean originBean = (MemberBean) session.getAttribute("LoginOK");

		Integer memId = originBean.getMemId();
		MemberBean newBean = memberDao.selectBymemberID(memId);
		
		//準備檔案欄位
		String fileName = "";
		long size = 0;
		InputStream is = null;
		Blob blob = null;
		
		if (!ImgFile.isEmpty()) {
			try {
				fileName = ImgFile.getOriginalFilename();
				fileName = MemberService.adjustFileName(fileName, MemberService.IMAGE_FILENAME_LENGTH);
				size = ImgFile.getSize();
				is =  ImgFile.getInputStream();
			}catch(Exception e){};
		}
		
//		formData.get
		String addr = formData.get("addr");
		String phone = formData.get("phone");
		String nickName = formData.get("nickname");
		String sex = formData.get("sex");
		String birthDate = formData.get("birthDate");
		String description = formData.get("description");

		// 寫入更新資料
		if(size != 0 && is != null ) {
			 blob = SystemUtils.fileToBlob(is, size);
			 newBean.setMemberImage(blob);
		}
		if (addr != null && !addr.isEmpty()) {
			newBean.setAddr(addr);
		}
		if (phone != null && !phone.isEmpty()) {
			newBean.setPhone(phone);
		}
		if (nickName != null && !nickName.isEmpty()) {
			newBean.setNickName(nickName);
		}
		if (sex != null && !sex.isEmpty()) {
			newBean.setSex(sex);
		}

		if (birthDate != null && !birthDate.isEmpty()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			try {
				Date date = sdf.parse(birthDate);
				newBean.setBirthDate(date);
			} catch (ParseException e) {
				errorMsg.put("DateFormateError", "日期格式錯誤");
			}

		}
		if (description != null && !description.isEmpty()) {
			newBean.setDescription(description);
		}
		// 如果 errorMsgMap 不是空的，表示有錯誤
		if (errorMsg != null && !errorMsg.isEmpty()) {
			return new ModelAndView("editProfile.fail");
		}
	
		session.setAttribute("LoginOK",newBean);
		memberDao.updateMemberData(newBean);

		return new ModelAndView("editProfile");

	}
}
