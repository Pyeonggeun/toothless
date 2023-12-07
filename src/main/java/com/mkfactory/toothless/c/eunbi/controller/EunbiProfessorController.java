package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksProfessorEvaluationDto;
import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;

@Controller
@RequestMapping("/tl_c/eunbi/professor/*")
public class EunbiProfessorController {
	
	@Autowired
	private EunbiProfessorServiceImpl professorServiece;
	
	@RequestMapping("internshipMainPage")
	public String internshipMainPage(HttpSession session, Model model) {
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		model.addAttribute("chargedInternshipCourse", professorServiece.viewChargedInternshipCourse(sessionProfessorPk));
		
		
		return "tl_c/eunbi/professor/internshipMainPage";
	}
	
	@RequestMapping("viewChargedStudentPage")
	public String viewChargedStudentPage(HttpSession session, Model model) {
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		model.addAttribute("sessionProfessorInfo", sessionProfessorInfo);
		model.addAttribute("studentsInfo", professorServiece.viewStudentsWithApplyingStatus(sessionProfessorPk));
		model.addAttribute("studentSearchFilters", professorServiece.studentSearchFilter());
		
		return "tl_c/eunbi/professor/viewChargedStudentPage";
	}
	
	@RequestMapping("viewInternshipCourseDetailPage")
	public String viewInternshipCourseDetailPage(HttpSession session, Model model, int internship_course_pk) {
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		model.addAttribute("internshipCourseDetail", professorServiece.viewInternshipCourseDetail(internship_course_pk));
		
		return "tl_c/eunbi/professor/viewInternshipCourseDetailPage";
		
	}
	
	@RequestMapping("internEvaluationProgress")
	public String internEvaluationProgress(HttpSession session, AjdksProfessorEvaluationDto params, int internship_course_pk) {
		
		ProfessorInfoDto sessionProfessorInfo = (ProfessorInfoDto)session.getAttribute("sessionProfessorInfo");
		int sessionProfessorPk = sessionProfessorInfo.getProfessor_pk();
		
		params.setProfessor_pk(sessionProfessorPk);
		
		professorServiece.insertProfessorEvaluation(params);
		
		return "redirect:./viewInternshipCourseDetailPage?internship_course_pk=" + internship_course_pk;
	}
	
	@RequestMapping("viewStudentDetailPage")
	public String viewStudentDetailPage(HttpSession session, Model model, int student_pk) {
		
		model.addAttribute("studentDetails", professorServiece.viewStudentDetail(student_pk));
		
		return"tl_c/eunbi/professor/viewStudentDetailPage";
	}
	
	
	
	
	
	
}
