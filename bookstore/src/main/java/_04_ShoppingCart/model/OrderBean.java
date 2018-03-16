package _04_ShoppingCart.model;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

// 本類別存放訂單資料
@Entity
@Table(name="ORDERS")
public class OrderBean implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderNo;
	private String 	memberId;
	private Double	totalAmount;
	private String	shippingAddress; 
	@Temporal(TemporalType.TIMESTAMP)
	private Date  orderDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date  shippingDate;
	private String	cancelTag;
	private String Payment;
	private String storeAddress;
	private String storeName;
	private String customer;
	private String phone;
	@Transient
	private String orderDateStr;	
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "orders",cascade={CascadeType.ALL})
	Set<OrderItemBean> items = new LinkedHashSet<>();
		
	public OrderBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderBean(String memberId, Double totalAmount, String shippingAddress, Date orderDate,
			Date shippingDate, String payment, String storeAddress, String storeName, String customer, String phone,
			Set<OrderItemBean> items) {
		super();

		this.memberId = memberId;
		this.totalAmount = totalAmount;
		this.shippingAddress = shippingAddress;
		this.orderDate = orderDate;
		this.shippingDate = shippingDate;
		Payment = payment;
		this.storeAddress = storeAddress;
		this.storeName = storeName;
		this.customer = customer;
		this.phone = phone;
		this.items = items;
	}



	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Date getOrderDate() {
  	  		
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getCancelTag() {
		return cancelTag;
	}

	public void setCancelTag(String cancelTag) {
		this.cancelTag = cancelTag;
	}

	public String getPayment() {
		return Payment;
	}

	public void setPayment(String payment) {
		Payment = payment;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	// 說明多方表格的orderBean欄位為外鍵欄位，對照的主鍵為一方表格的orderno欄
	public Set<OrderItemBean> getItems() {
		return items;
	}

	public void setItems(Set<OrderItemBean> items) {
		this.items = items;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOrderDateStr() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Timestamp now = new Timestamp(orderDate.getTime());
	    String orderDateStr = df.format(now);
	    
		return orderDateStr;
	}
	
	

	
}
