package com.mkfactory.toothless.c.taeho.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_c/taeho/staff/*")
public class TaehoStaffController {

	@RequestMapping("ajdksStaffLogoutProcess")
	public String ajdksStaffLogoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:../../../another/staff/loginPage";
	}
	
	
}
