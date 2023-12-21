package com.mkfactory.toothless.c.taeho.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("tl_c/taeho/professor/*")
public class TaehoProfessorController {
	
	@RequestMapping("ajdksProfessorLogoutProcess")
	public String ajdksProfessorLogoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:../../../another/professor/loginPage";
	}

}
