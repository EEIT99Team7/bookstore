package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "customerService")
public class CustomerServiceBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer csId;

	private Integer memID;
	private String csTitle;
	private String csMessage;
	private String replyMsg;
	private String processStatus;
	private Date requestTime;
	private Date responseTime;
	
	@Transient
	private String userName;




	@Override
	public String toString() {
		return "CustomerServiceBean [csId=" + csId + ", memID=" + memID + ", csTitle=" + csTitle + ", csMessage="
				+ csMessage + ", replyMsg=" + replyMsg + ", processStatus=" + processStatus + ", requestTime="
				+ requestTime + ", responseTime=" + responseTime + ", userName=" + userName + "]";
	}

	public Integer getCsId() {
		return csId;
	}

	public void setCsId(Integer csId) {
		this.csId = csId;
	}

	public Integer getMemID() {
		return memID;
	}

	public void setMemID(Integer memID) {
		this.memID = memID;
	}

	public String getCsTitle() {
		return csTitle;
	}

	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}

	public String getCsMessage() {
		return csMessage;
	}

	public void setCsMessage(String csMessage) {
		this.csMessage = csMessage;
	}

	public String getReplyMsg() {
		return replyMsg;
	}

	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}

	public String getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}

	public Date getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}

	public Date getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public CustomerServiceBean(Integer csId, Integer memID, String csTitle, String csMessage, String replyMsg,
			String processStatus, Date requestTime, Date responseTime) {
		super();
		this.csId = csId;
		this.memID = memID;
		this.csTitle = csTitle;
		this.csMessage = csMessage;
		this.replyMsg = replyMsg;
		this.processStatus = processStatus;
		this.requestTime = requestTime;
		this.responseTime = responseTime;
	}

	public CustomerServiceBean() {
		super();
	}
	
	
	
	
	

	

}
