package _04_ShoppingCart.model.dao;

import _04_ShoppingCart.model.OrderItemBean;

public interface OrderItemReview {
	
	// 由 OrderItemBean取得商品價格(eBook#Price)。
		
	double findItemAmount(OrderItemBean oib);
	
	double updateUnpaidOrderAmount(OrderItemBean oib, String memberId);
	
	int updateProductStock(int bookId, int orderedQuantity);
	
	
}
