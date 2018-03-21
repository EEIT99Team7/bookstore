package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.transaction.Transactional;

@Entity
@Table(name="Bookstatus")
public class BookstatusBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private	 Integer Bstatus  ;
	private	 Integer memID ;
	private	 String  Bstatusname;
	public Integer getBstatus() {
		return Bstatus;
	}
	
	@Override
	public String toString() {
		return "BookstatusBean [Bstatus=" + Bstatus + ", memID=" + memID + ", Bstatusname=" + Bstatusname + "]";
	}

	public void setBstatus(Integer bstatus) {
		Bstatus = bstatus;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public String getBstatusname() {
		return Bstatusname;
	}
	public void setBstatusname(String bstatusname) {
		Bstatusname = bstatusname;
	}
	
	
	
	

}
