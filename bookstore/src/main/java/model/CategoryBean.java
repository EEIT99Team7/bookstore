package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CATEGORY")
//書類別的表格
public class CategoryBean {
	@Id
	private Integer	bookNo;
	private String 	c_name;
	
	public CategoryBean(Integer bookNo, String c_name) {
		this.bookNo = bookNo;
		this.c_name = c_name;
	}
	
	public CategoryBean() {
	}
	
	@Override
	public String toString() {
		return "ProductBean [bookNo=" + bookNo + ", c_name=" + c_name + "]";
	}

	public Integer getBookNo() {
		return bookNo;
	}

	public void setBookNo(Integer bookNo) {
		this.bookNo = bookNo;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	

}
