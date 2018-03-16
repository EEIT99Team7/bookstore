package com.aioDemo.apiPkg;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioChargebackObj;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class AioChargebackController {
	AllInOne all;
	@RequestMapping(value = "backstage/aioChargeback", method = RequestMethod.GET)
	public ModelAndView queryCreditTrade(){
		return new ModelAndView("aioChargeback", "command", new AioChargebackObj());
	}
	
	
	@RequestMapping(value = "backstage/aioChargeback", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String queryCreditTrade(AioChargebackObj aioChargeback){
		all = new AllInOne("");
		try{
			String result = all.aioChargeback(aioChargeback);
			System.out.println(result);
			return result;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
}
