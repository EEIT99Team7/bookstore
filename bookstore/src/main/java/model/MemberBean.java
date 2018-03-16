package model;

import java.io.*;
import java.sql.*;
import java.util.Date;

import javax.persistence.*;

// 本類別封裝單筆會員資料
@Entity
@Table(name="MEMBER")
public class MemberBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memId;
	private String userName;
	//userName=帳號,nickname=暱稱
	private String nickName;
	private String email;
	private String pw;
	private String addr;
	private String phone;
	private String sex;
	private java.util.Date birthDate;
	private String userType;
	private Blob memberImage;
	private String fileName;
	private Double unpaid_amount;
	private Boolean resetState;
	private String resetId;
	private String description;

	public MemberBean() {
		super();
	}
	
	public MemberBean(Integer memId, String userName, String nickName, String email, String pw, String addr,
			String phone, String sex, Date birthDate, String userType, Blob memberImage, String fileName,
			Double unpaid_amount, Boolean resetState, String resetId, String description) {
		super();
		this.memId = memId;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
		this.pw = pw;
		this.addr = addr;
		this.phone = phone;
		this.sex = sex;
		this.birthDate = birthDate;
		this.userType = userType;
		this.memberImage = memberImage;
		this.fileName = fileName;
		this.unpaid_amount = unpaid_amount;
		this.resetState = resetState;
		this.resetId = resetId;
		this.description = description;
	}

	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public java.util.Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(java.util.Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Blob getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(Blob memberImage) {
		this.memberImage = memberImage;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Double getUnpaid_amount() {
		return unpaid_amount;
	}
	public void setUnpaid_amount(Double unpaid_amount) {
		this.unpaid_amount = unpaid_amount;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickname) {
		this.nickName = nickname;
	}

	public Boolean getResetState() {
		return resetState;
	}

	public void setResetState(Boolean resetState) {
		this.resetState = resetState;
	}

	public String getResetId() {
		return resetId;
	}

	public void setResetId(String resetId) {
		this.resetId = resetId;
	}

	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
		
}
