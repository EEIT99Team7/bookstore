package com.aioDemo.apiPkg;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.QueryCreditCardPeriodInfoObj;
import allPay.payment.integration.domain.QueryTradeInfoObj;
import allPay.payment.integration.domain.QueryTradeObj;
import allPay.payment.integration.domain.TradeNoAioObj;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class QueryController {
	AllInOne all;
	@RequestMapping(value = "/backstage/query", method = RequestMethod.GET)
	public String query(Model model){
		model.addAttribute("info", "模擬廠商後台查詢頁");
		return "query";
	}
	
	@RequestMapping(value = "backstage/query/queryCreditTrade", method = RequestMethod.GET)
	public ModelAndView queryCreditTrade(){
		return new ModelAndView("queryCreditTrade", "command", new QueryCreditCardPeriodInfoObj());
	}
	
	
	@RequestMapping(value = "backstage/query/queryCreditTrade", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String queryCreditTrade(QueryCreditCardPeriodInfoObj query){
		all = new AllInOne("");
		try{
			String result = all.queryCreditCardPeriodInfo(query);
			System.out.println(result);
			return result;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
	
	@RequestMapping(value = "backstage/query/queryTradeInfo", method = RequestMethod.GET)
	public ModelAndView queryTradeInfo(){
		return new ModelAndView("queryTradeInfo", "command", new QueryTradeInfoObj());
	}
	
	
	@RequestMapping(value = "backstage/query/queryTradeInfo", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String queryTradeInfo(QueryTradeInfoObj query){
		all = new AllInOne("");
		try{
			String result = all.queryTradeInfo(query);
			System.out.println(result);
			return result;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
	
	@RequestMapping(value = "backstage/query/queryTrade", method = RequestMethod.GET)
	public ModelAndView queryTrade(){
		return new ModelAndView("queryTrade", "command", new QueryTradeObj());
	}
	
	
	@RequestMapping(value = "backstage/query/queryTrade", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String queryTradeInfo(QueryTradeObj query){
		all = new AllInOne("");
		try{
			String result = all.queryTrade(query);
			System.out.println(result);
			return result;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
	
	@RequestMapping(value = "backstage/query/tradeNoAio", method = RequestMethod.GET)
	public ModelAndView tradeNoAio(){
		return new ModelAndView("tradeNoAio", "command", new TradeNoAioObj());
	}
	
	
	@RequestMapping(value = "backstage/query/tradeNoAio", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String tradeNoAio(TradeNoAioObj query, @RequestParam(value="DateType")String DateType,  
																@RequestParam(value="PaymentType")String PaymentType,
																@RequestParam(value="PlatformStatus")String PlatformStatus,
																@RequestParam(value="PaymentStatus")String PaymentStatus,
																@RequestParam(value="AllocateStatus")String AllocateStatus,
																@RequestParam(value="MediaFormated")String MediaFormated,
																HttpServletResponse res){
		all = new AllInOne("");
		query.setDateType(DateType);
		query.setPaymentType(PaymentType);
		query.setPlatformStatus(PlatformStatus);
		query.setPaymentStatus(PaymentStatus);
		query.setAllocateStatus(AllocateStatus);
		query.setMediaFormated(MediaFormated);
		String result = "";
		try{
			result = all.tradeNoAio(query);
			System.out.println(result);
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
		res.setContentType("text/csv");
	    res.setHeader("Content-Disposition", "attachment; filename=\"TradeNoAio.csv\"");
		try{
			OutputStream out = res.getOutputStream();
			out.write(result.getBytes());
			out.flush();
			out.close();
		} catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
}
