package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.transaction.Transactional;

@Entity
@Table(name="Collection")
public class CollectionBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private	 Integer ID  ;
	private	 Integer memID ;
	private	 Integer bookId  ;
	private	 Integer BCID;
	@Transient
	private	 Integer Bstatus;
	
	public CollectionBean() {
		
	}
	public CollectionBean(Integer memID, Integer bookId) {
		//ID = iD;
		this.memID = memID;
		this.bookId = bookId;
		//BCID = bCID;
		//Bstatus = bstatus;
	}
	public CollectionBean(Integer memID, Integer bookId,Integer BCID) {
		
		this.memID = memID;
		this.bookId = bookId;
		this.BCID =BCID;
		
	}
	
	@Override
	public String toString() {
		return "CollectionBean [ID=" + ID + ", memID=" + memID + ", bookId=" + bookId + ", BCID=" + BCID + ", Bstatus="
				+ Bstatus + "]";
	}
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public Integer getBCID() {
		return BCID;
	}
	public void setBCID(Integer bCID) {
		BCID = bCID;
	}
	public Integer getBstatus() {
		return Bstatus;
	}
	public void setBstatus(Integer bstatus) {
		Bstatus = bstatus;
	}

	
	
}
