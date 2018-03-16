package _04_ShoppingCart.model.facade;

import _04_ShoppingCart.model.OrderBean;

public interface OrderService {
	 // 處理訂單的主要邏輯
     void processOrder(OrderBean ob);
     double findTotalOrderAmount(OrderBean ob);
     
}
