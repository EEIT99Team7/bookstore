package com.aioDemo.aioCheckOutDemo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontController {
	@RequestMapping(value = "/frontEnd", method = RequestMethod.GET)
	public String fronEnd(Model model){
		model.addAttribute("title", "結帳頁");
		model.addAttribute("info", "此為模擬前台頁面，模擬客戶的交易");
		return "frontEnd";
	}
}
