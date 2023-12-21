package com.mkfactory.toothless.c.eunbi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.eunbi.service.EunbiProfessorServiceImpl;
import com.mkfactory.toothless.c.eunbi.service.EunbiStudentServiceImpl;

@Controller
@RequestMapping("/tl_c/eunbi/student/*")
public class EunbiStudentController {
	
	@Autowired
	private EunbiProfessorServiceImpl professorService;
	@Autowired
	private EunbiStudentServiceImpl studentService;

	@RequestMapping("gradeInquiryPage")
	public String gradeInquiryPage(HttpSession session) {
		
		return "tl_c/eunbi/student/gradeInquiryPage";
	}
	
	@RequestMapping("viewEvaluationDetailPage")
	public String viewEvaluationDetailPage(HttpSession session, Model model, int student_intern_pk) {
		
		model.addAttribute("evaluations", studentService.getEvaluation(student_intern_pk));
		
		return "tl_c/eunbi/student/viewEvaluationDetailPage";
	}
}
