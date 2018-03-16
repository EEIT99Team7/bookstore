package _04_ShoppingCart.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.transaction.Transactional;


@Entity
@Table(name = "OrderItems")
public class OrderItemBean implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seqno;
	@Transient
	private Integer orderNo;
	private Integer bookId;
	private String description;
	private Integer quantity;
	private Double unitPrice;
	private Double discount;
	
	@ManyToOne
	@JoinColumn(name = "orderNo",nullable=false)
	private OrderBean orders;

	public OrderItemBean(Integer seqno, Integer orderNo, Integer bookID,
			String description, Integer quantity, Double unitPrice, Double discount) {
		super();
		this.seqno = seqno;
		this.orderNo = orderNo;
		this.bookId = bookID;
		this.description = description;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}
	public OrderItemBean(Integer orderNo, Integer bookID,
			String description, Integer quantity, Double unitPrice, Double discount) {
		super();
		
		this.orderNo = orderNo;
		this.bookId = bookID;
		this.description = description;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.discount = discount;
	}
	public OrderItemBean() {
		
	}
	public Integer getSeqno() {
		return seqno;
	}

	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookID) {
		this.bookId = bookID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}
//	public OrderBean getOrders() {
//		return orders;
//	}
	public void setOrders(OrderBean orders) {
		this.orders = orders;
	}
	@Override
	public String toString() {
		return "OrderItemBean [seqno=" + seqno + ", orderNo=" + orderNo + ", bookId=" + bookId + ", description="
				+ description + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", discount=" + discount
				+ ", orders=" + orders + "]";
	}
	
	
}