package com.mkfactory.toothless.donot.touch.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.service.ProfessorServiceImpl;

@Controller
@RequestMapping("/another/professor/*")
public class ProfessorController {
	@Autowired
	private ProfessorServiceImpl professorService;
	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		
		return "another/professor/loginPage";
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
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect: ./loginPage";
	}
	
	@RequestMapping("mainPage")
	public String mainPage(HttpSession session, Model model) {
		ProfessorInfoDto professorInfoDto = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		Map<String, Object> professorInfo = professorService.getProfessorInfo(professorInfoDto.getDepartment_pk());
		model.addAttribute("professorInfo", professorInfo);
		
		
		return "another/professor/mainPage";
	}
}
