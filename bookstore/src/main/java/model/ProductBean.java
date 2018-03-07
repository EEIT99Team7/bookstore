package model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT")
public class ProductBean {
	@Id
	private Integer	bookId;
	private String 	title;
	private String 	author;
	private String	press;
	private Double  price;
	private Integer	stock;
//	private Integer	sells;
	private Integer	bookNo;//REFERENCES Category(bookNo),   --類型
	private Blob 	coverImage;
	private String 	content;
	
	//categoryBean，作為外鍵類別名稱的儲存欄位
	private String categoryName;
	
	public ProductBean(Integer bookID, String title, String author, 
			String press, double price, Integer stock, Integer bookNo, 
			Blob coverImage,String content) {
		this.bookId = bookID;
		this.title = title;
		this.author = author;
		this.press = press;
		this.price = price;
		this.stock = stock;
//		this.sells = sells;
		this.bookNo = bookNo;
		this.coverImage = coverImage;
		this.content = content;
	}
	
	public ProductBean() {
	}
	
	@Override
	public String toString() {
		return "ProductBean [bookId=" + bookId + ", title=" + title + ", content=" + content + ", author=" + author
				+ ", press=" + press + ", price=" + price + ", stock=" + stock + ", bookNo="
				+ bookNo + "]";
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
//	public Integer getSells() {
//		return sells;
//	}
//	public void setSells(Integer sells) {
//		this.sells = sells;
//	}
	public Integer getBookNo() {
		return bookNo;
	}
	public void setBookNo(Integer bookNo) {
		this.bookNo = bookNo;
	}
	public Blob getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
