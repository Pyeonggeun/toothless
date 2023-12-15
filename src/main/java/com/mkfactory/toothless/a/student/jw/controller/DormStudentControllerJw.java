package com.mkfactory.toothless.a.student.jw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DiaryDto;
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
	
	// 학생 로그인페이지로 -by MJ
	@RequestMapping("loginPageJw")
	public String loginPageJw() {

		return "another/student/loginPage";
	}
	
	@RequestMapping("jw_exitApplyPage")
	public String jw_exitApplyPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			return "redirect:../../tl_a/student/loginPageJw";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		 
		if(session.getAttribute("sessionStudentInfo") != null && dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
			// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
			return "redirect:../../tl_a/student/loginPageJw";
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
			return "redirect:../../tl_a/student/loginPageJw";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		
		if(dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
			// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
			return "redirect:../../tl_a/student/loginPageJw";
		} else {
			model.addAttribute("studentInfoDto", studentInfoDto);
			model.addAttribute("pointSituationListMap", dormStudentServiceJw.getPointSituation(studentPk));
			
			Integer sumTotalPoint = dormStudentServiceJw.sumTotalPointByStudentPk(studentPk);
			int intSumTotalPoint = (sumTotalPoint != null) ? sumTotalPoint : 0;
			
			model.addAttribute("sumTotalPoint", intSumTotalPoint);
			return "/tl_a/student/jw_checkDormStudentPointPage";
		}
	}
	
	@RequestMapping("jw_diartApplyPage")
	public String jw_diartApplyPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			return "redirect:../../tl_a/student/loginPageJw";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		 
		if(session.getAttribute("sessionStudentInfo") != null && dormStudentServiceJw.checkDormStudentExecutive(studentPk) == 0) {
			// 로그인 한 사생이 임원이 아니면 반환 (임원페이지) 	
			// ---> 일단 로그인하게하긴했는데 사감만 작성할수있다고 alert하는것도 나쁘지 않을듯??
			return "redirect:../../tl_a/student/loginPageJw";
		} else {
			model.addAttribute("studentInfoDto", studentInfoDto);
			model.addAttribute("dormStudentDto", dormStudentServiceJw.getDormStudentByStudentPk(studentPk));
			model.addAttribute("executiveDto", dormStudentServiceJw.getDormStudentByStudentPkAndExecutive(studentPk));
			return "/tl_a/student/jw_diartApplyPage";
		}
	}
	
	@RequestMapping("jw_diartApplyProcess")
	public String jw_diartApplyProcess(DiaryDto params) {
		
		dormStudentServiceJw.registerDiary(params);
		
		return "redirect:/tl_a/student/jw_diartApplyPage";
	}
	
}
