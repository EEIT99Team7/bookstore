package _04_ShoppingCart.model.facade;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _04_ShoppingCart.model.OrderItemBean;
import _04_ShoppingCart.model.dao.OrderItemReview;

@Service
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	private OrderItemReview  oir ;
	
	@Override
	// 目前的版本沒有用到訂單日期(orderDate)，此項資料可用來檢查訂單是否逾時。
	public void processOrderItem(OrderItemBean oib, String memberId, Date orderDate) {
		
		int quantity = oib.getQuantity();
		// 1. 更新客戶的未付款訂購金額。
//		oir.updateUnpaidOrderAmount(oib, memberId);

//		// 2.更新商品的數量：必須先檢查訂購之商品的數量是否足夠
		oir.updateProductStock(oib.getBookId(), quantity); 
	}
}
