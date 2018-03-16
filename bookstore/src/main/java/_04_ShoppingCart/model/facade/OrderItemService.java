package _04_ShoppingCart.model.facade;

import java.util.Date;

import _04_ShoppingCart.model.OrderItemBean;


// 處理一筆訂單中的一項訂單明細
public interface OrderItemService {
	/**
	 * 
	 * @param oib			OrderItemBean物件，代表一項訂單明細
	 * @param cmid			客戶編號 
	 * @param orderDate		訂單日期
	 */
	
	public void processOrderItem(OrderItemBean oib, String memberId, Date orderDate);

}
