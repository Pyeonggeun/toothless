package com.mkfactory.toothless.a.student.jw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.student.jw.service.DormStudentServiceJw;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormStudentControllerJw {

	@Autowired
	private DormStudentServiceJw dormStudentServiceJw;
	
	@RequestMapping("jw_mainPage")
	public String jw_mainPage() {
		
		return "/tl_a/student/jw_mainPage";
	}
	
	@RequestMapping("jw_exitApplyPage")
	public String jw_exitApplyPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			return "redirect:/another/student/loginPage";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		 
		if(session.getAttribute("sessionStudentInfo") != null && dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
			// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
			return "redirect:/another/student/loginPage";
		} else {
			model.addAttribute("studentInfoDto", studentInfoDto);
			model.addAttribute("dormStudentDto", dormStudentServiceJw.getDormStudentByStudentPk(studentPk));
			return "/tl_a/student/jw_exitApplyPage";
		}
		
	}
	
	@RequestMapping("jw_exitApplyProcess")
	public String jw_exitApplyProcess(ExitDto params) {
		
		dormStudentServiceJw.applyExit(params);
		
		return "redirect:/tl_a/student/jw_exitApplyPage";
	}
	
	@RequestMapping("jw_checkDormStudentPointPage")
	public String jw_checkDormStudentPointPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			return "redirect:/another/student/loginPage";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		
		if(dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
			// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
			return "redirect:/another/student/loginPage";
		} else {
			model.addAttribute("studentInfoDto", studentInfoDto);
			model.addAttribute("pointSituationListMap", dormStudentServiceJw.getPointSituation(studentPk));
			
			Integer sumTotalPoint = dormStudentServiceJw.sumTotalPointByStudentPk(studentPk);
			int intSumTotalPoint = (sumTotalPoint != null) ? sumTotalPoint : 0;
			
			model.addAttribute("sumTotalPoint", intSumTotalPoint);
			return "/tl_a/student/jw_checkDormStudentPointPage";
		}
		
	}
	
}
