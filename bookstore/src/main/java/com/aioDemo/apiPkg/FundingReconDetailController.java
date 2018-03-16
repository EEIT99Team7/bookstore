package com.aioDemo.apiPkg;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.FundingReconDetailObj;
import allPay.payment.integration.exception.AllPayException;

@Controller
public class FundingReconDetailController {
	AllInOne all;
	@RequestMapping(value = "backstage/fundingReconDetail", method = RequestMethod.GET)
	public ModelAndView fundingReconDetail(){
		return new ModelAndView("fundingReconDetail", "command", new FundingReconDetailObj());
	}
	
	
	@RequestMapping(value = "backstage/fundingReconDetail", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	public @ResponseBody String fundingReconDetail(FundingReconDetailObj funding, HttpServletResponse res){
		all = new AllInOne("");
		String result = "";
		try{
			result = all.fundingReconDetail(funding);
			System.out.println(result);
			
		} catch(AllPayException e){
			throw new Error(e.getNewExceptionMessage());
		}
		res.setContentType("text/csv");
	    res.setHeader("Content-Disposition", "attachment; filename=\"FundingReconDetail.csv\"");
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
