package _04_ShoppingCart.model.facade;

import java.util.Date;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.OrderItemBean;
import _04_ShoppingCart.model.dao.OrderDaoImpl;
import _04_ShoppingCart.model.dao.OrderItemReview;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderItemService ois ;
	@Autowired
	OrderItemReview oir;
	@Autowired
	OrderDaoImpl  odao; 

	@Override
	public void processOrder(OrderBean ob) {
		processDetails(ob);
		
		persistOrder(ob);		
	}	
	public void processDetails(OrderBean ob){
		Set<OrderItemBean> items = ob.getItems();
		String memberId = ob.getMemberId();
		Date orderDate = ob.getOrderDate();
		for(OrderItemBean oib: items){
			ois.processOrderItem(oib, memberId, orderDate);
		}		
	}
	//計算訂單總金額
	public void persistOrder(OrderBean ob){
			System.out.println("testOrder");
			double totalAmount = findTotalOrderAmount(ob);
			ob.setTotalAmount(totalAmount);
			odao.insertOrder(ob);
			
	}
	
	/** **
	 * 計算一張訂單的總金額。
	 * 由OrderBean的getItems()取出Set<OrderItemBean>物件，經由迴圈計算每項商品的小計金額，
	 * 加總這些金額後得到總金額。
	 */
	@Override
    // 10-23 21:36	
	public double findTotalOrderAmount(OrderBean ob) {
		double total = 0 ;
		Set<OrderItemBean> items = ob.getItems();
		for (OrderItemBean oib :items){
			double subtotal = oib.getQuantity() * oib.getUnitPrice() * oib.getDiscount();
			total += subtotal ;
		}				
		return total;
	}
	
//	public OrderItemService getOis() {
//		return ois;
//	}
//	public void setOis(OrderItemService ois) {
//		this.ois = ois;
//	}
//	public OrderItemReview getOir() {
//		return oir;
//	}
//	public void setOir(OrderItemReview oir) {
//		this.oir = oir;
//	}
	public OrderDaoImpl getOdao() {
		return odao;
	}
	public void setOdao(OrderDaoImpl odao) {
		this.odao = odao;
	}
	
}
