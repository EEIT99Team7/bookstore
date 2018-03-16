package com.aioDemo.apiPkg;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.CaptureObj;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class CaptureController {
	AllInOne all ;
	@RequestMapping(value = "backstage/capture", method = RequestMethod.GET)
	public ModelAndView capture(){
		return new ModelAndView("capture", "command", new CaptureObj());
	}
	
	
	@RequestMapping(value = "backstage/capture", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String capture(CaptureObj capture){
		all = new AllInOne("");
		try{
			String result = all.capture(capture);
			System.out.println(result);
			return result;
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
	}
}
