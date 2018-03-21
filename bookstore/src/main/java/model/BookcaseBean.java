package model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.transaction.Transactional;



@Entity
@Table(name="Bookcase")
public class BookcaseBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private	 Integer BCID  ;
	private	 Integer memID ;
	private	 String  BCname ;
	
   
	
	public BookcaseBean() {
	
	}
	
	public BookcaseBean(Integer memID, String bCname) {
		//BCID = bCID;
		this.memID = memID;
		BCname = bCname;
	}
	

		@Override
	public String toString() {
		return "BookcaseBean [BCID=" + BCID + ", memID=" + memID + ", BCname=" + BCname + "]";
	}
	public Integer getBCID() {
		return BCID;
	}
	public void setBCID(Integer bCID) {
		BCID = bCID;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public String getBCname() {
		return BCname;
	}
	public void setBCname(String bCname) {
		BCname = bCname;
	}
	
	
	

}
