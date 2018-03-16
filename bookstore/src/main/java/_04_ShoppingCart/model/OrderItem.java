package _04_ShoppingCart.model;

//本類別封裝單筆訂單資料(無對應至資料庫)
public class OrderItem {
	String title;
	Integer qty = 0;
	Integer bookID = 0;
	Double price = 0.0;
	Double discount = 1.0;
	// 暫時還沒用到
	// Blob bookcover ;

	public OrderItem(String title, Integer qty, Integer bookID, Double price) {
		super();
		this.title = title;
		this.qty = qty;
		this.bookID = bookID;
		this.price = price;
	}

	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Integer getBookID() {
		return bookID;
	}

	public void setBookID(Integer bookID) {
		this.bookID = bookID;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

}