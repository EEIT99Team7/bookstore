package com.aioDemo.apiPkg;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import _04_ShoppingCart.model.OrderItem;
import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.*;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class AioCheckOutController {
	AllInOne all;
	@RequestMapping(value = "/frontEnd/aioCheckOut", method = RequestMethod.GET)
	public String aioCheckOut(Model model){
		model.addAttribute("info", "歐付寶付款選擇頁");
		return "aioCheckOut";
	}
	
	@RequestMapping(value = "aioCheckOutOneTime", method = RequestMethod.GET)
	public ModelAndView aioCheckOutOneTime(){
		return new ModelAndView("aioCheckOutOneTime", "command", new AioCheckOutOneTime());
	}
	

	@RequestMapping(value = "aioCheckOutOneTime", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String aioCheckOutDevide(AioCheckOutOneTime aio,@RequestAttribute Map<Integer, OrderItem> cart){
		all = new AllInOne("");
		System.out.println(aio.getRemark());
		InvoiceObj invoice = new InvoiceObj();
		//模擬不開發票
		invoice = null;
		//廠商系統自行產生
		aio.setMerchantTradeNo(UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20));
		Date date = new Date();
		//廠商可自行決定交易時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		aio.setMerchantTradeDate(sdf.format(date));
		//從廠商DB撈出的商品資訊
		
		Set<Integer> set = cart.keySet();
		String itemName="";
		Integer price=0 ;
		for (Integer k : set) {
			OrderItem oib = cart.get(k);
			itemName= itemName+ oib.getTitle()+"#";
			price = price +oib.getPrice().intValue();
		}
		
		itemName.substring(0, itemName.length()-1);
		aio.setItemName(itemName);
		aio.setTotalAmount(price.toString());
		aio.setTradeDesc("item desc");
		//廠商可自行決定是否延遲撥款
		aio.setHoldTradeAMT("0");
		//後端設定付款完成通知回傳網址
		aio.setReturnURL("http://211.23.128.214:5000");
		aio.setOrderResultURL("http://localhost:8080/bookstore/");
		try{
			String html = all.aioCheckOut(aio, invoice);
			System.out.println(html);
			return html;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
	
}
