package _04_ShoppingCart.model.dao;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _04_ShoppingCart.model.OrderItemBean;



/*
 * 一張合格的訂單必須經過下列檢查
 * 	1. 	處理客戶訂單的一項訂單明細時，該項明細的金額 + 該客戶的未付款訂購金額不能超過限額
 *		此功能寫在本類別的updateUnpaidOrderAmount()方法內，參考該方法的說明。
 *	
 * 	2.	檢查訂購之商品的數量是否足夠。
 *      此功能寫在本類別的updateProductStock()方法內，參考該方法的說明。
 *      
 */
@Repository
@Transactional
public class OrderItemReviewImpl implements OrderItemReview {
	

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	/*
	 * 計算客戶欲購買之某項商品(以OrderItemBean物件oib來表示)的小計金額(subtotal)，
	 * 計算公式為: 商品的數量 * 商品的單價 * 商品的折扣    
	 */
	@Override
	public double findItemAmount(OrderItemBean oib) {
		double subtotal = oib.getQuantity() * oib.getUnitPrice() * oib.getDiscount() ;
		return subtotal;
	}

	/*
	 * 功能：更新客戶的未付款訂購金額。 
	 * 說明：處理客戶訂單的一項訂單明細時，該項明細的金額 + 該客戶的未付款訂購金額不能超過限額 
	 * (GlobalService類別的常數: ORDER_AMOUNT_LIMIT)
	 *  
	 * 步驟：1. 到Member表格中取出Member#unpaid_order_amount 
	 * 		2. unpaid_order_amount加上本訂單明細的金額後，檢查加總後的數值是否超過限額
	 * 		(GlobalService.ORDER_AMOUNT_LIMIT)。
	 * 		如果超過限額， 則
	 * 			該訂單不予處裡，丟出UnpaidOrderAmountExceedingException， 
	 * 		否則更新eMember表格的unpaid_order_amount欄位。
	 * 
	 * 			eMember#unpaid_order_amount += orderAmount;
	 */
	@Override
    // 10-23 22:33	
	public double updateUnpaidOrderAmount(OrderItemBean oib, String memberId) {
		int n = 0;
		double currentAmount = findItemAmount(oib); // 計算該項明細的金額

		// 讀取該客戶的未付款金額(unpaid_order_amount)
		String hql0 = "SELECT m.unpaid_order_amount FROM MemberBean m WHERE m.memberId = ?";
		Query query0 = getSession().createQuery(hql0);

		Double unpaidAmount = (Double) query0.setParameter(0, memberId).getSingleResult();

		if (currentAmount + unpaidAmount > 10000) {
//			throw new UnpaidOrderAmountExceedingException("未付款金額超過限額: " + (currentAmount + unpaidAmount));
			System.out.println("未付款金額超過限額: " + (currentAmount + unpaidAmount));
		} else {
			;
		}
		String hql = "UPDATE MemberBean m SET m.unpaid_order_amount " + " = m.unpaid_order_amount + ? WHERE m.memberId = ?";
		double ttl = Math.round(currentAmount * 1.05) ;
		n = (int) getSession().createQuery(hql).setParameter(0, ttl).setParameter(1, memberId).executeUpdate();
		return n;
	}

	/*
	 * 功能：更新商品的數量，更新之前必須先檢查訂購之商品的數量是否足夠。
	 * 說明：商品的數量逼必須大於訂單明細中的訂購數量，否則丟出ProductStockException 
	 * int bookId: 產品代號 
	 * int orderedQuantity: 訂購數量 
	 * 
	 * 步驟：1. 先檢查商品的庫存數量(eBook表格的stock欄位)是否大於訂購之數量
	 * 如果eBook表格中的庫存數量(eBook#stock)小於訂購數量(orderedQuantity)
	 * 丟出ProductStockException，結束本方法。
	 *  
	 * 步驟：2. 更新eBook表格的stock欄位: 
	 *    eBook表格的stock -= orderedQuantity;
	 */
	@Override 
	// 10-23 22:17  
	public int updateProductStock(int bookId, int orderedQuantity) {
		int n = 0;
		String hql0 = "SELECT p.stock FROM ProductBean p WHERE p.bookId = :bookId";
//		String hql0 = "SELECT p.stock FROM ProductBean p WHERE p.bookId = ?";
		Query query = getSession().createQuery(hql0);
		try {
			int stock = (int) query.setParameter("bookId", bookId).getSingleResult();
			if (stock < orderedQuantity) {
//				throw new ProductStockException("庫存數量不足");
				System.out.println("庫存數量不足");
			} else {
				;
			}
			String hql = "UPDATE ProductBean p SET p.stock = p.stock - :qty WHERE p.bookId = :bookId";
			n = getSession().createQuery(hql).setParameter("qty", orderedQuantity).setParameter("bookId", bookId)
					.executeUpdate();
		} catch(javax.persistence.NoResultException ex){
		  ex.printStackTrace();
			
		} 
		return n;
	}
}
