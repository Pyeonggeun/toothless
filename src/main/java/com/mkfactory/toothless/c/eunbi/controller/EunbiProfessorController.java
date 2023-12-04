package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;

@Controller
@RequestMapping("/tl_c/eunbi/professor/*")
public class EunbiProfessorController {
	
	@Autowired
	private EunbiProfessorServiceImpl professorServiece;
	
	@RequestMapping("internshipMainPage")
	public String internshipMainPage() {
		
		return "tl_c/eunbi/professor/internshipMainPage";
	}
	
	@RequestMapping("viewChargedStudentPage")
	public String viewChargedStudentPage(HttpSession session, Model model) {
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		model.addAttribute("sessionProfessorInfo", sessionProfessorInfo);
		model.addAttribute("studentsInfo", professorServiece.viewStudentsWithApplyingStatus(sessionProfessorPk));
		
		return "tl_c/eunbi/professor/viewChargedStudentPage";
	}
	
	
	
}
