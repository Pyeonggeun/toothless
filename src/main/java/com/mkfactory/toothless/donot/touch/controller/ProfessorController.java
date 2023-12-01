package com.mkfactory.toothless.donot.touch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.service.ProfessorServiceImpl;

@Controller
@RequestMapping("/professor/*")
public class ProfessorController {
	@Autowired
	private ProfessorServiceImpl professorService;
	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		
		return "professor/loginPage";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, ProfessorInfoDto params) {
		
		ProfessorInfoDto professorInfo = professorService.loginByProfessorIdAndPassword(params);
		
		if( professorInfo == null ) {
			return "redirect: ./loginPage";
		}
			
		session.setAttribute("sessionProfessorInfo", professorInfo);
		
		return "redirect: ./mainPage";
		
		
	}
	
	@RequestMapping("mainPage")
	public String mainPage() {
		
		
		return "professor/mainPage";
	}
}
