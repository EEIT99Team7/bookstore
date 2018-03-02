package _02_login;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

// 本類別封裝單筆會員資料
@Entity
@Table(name="MEMBER")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer mempk;
	private String memId;
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
	
	
	@Override
	public String toString() {
		return "MemberBean [mempk=" + mempk + ", memId=" + memId + ", email=" + email + ", pw=" + pw + ", addr=" + addr
				+ ", phone=" + phone + ", sex=" + sex + ", birthDate=" + birthDate + ", userType=" + userType
				+ ", memberImage=" + memberImage + ", fileName=" + fileName + ", unpaid_amount=" + unpaid_amount + "]";
	}
	
	public Integer getMempk() {
		return mempk;
	}
	public void setMempk(Integer mempk) {
		this.mempk = mempk;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
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
	
	
}
