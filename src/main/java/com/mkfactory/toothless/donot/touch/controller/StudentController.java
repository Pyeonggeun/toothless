package com.mkfactory.toothless.donot.touch.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/another/student/*")
public class StudentController {
	@Autowired
	private StudentServiceImpl studentService;
	
	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		
		return "another/student/loginPage";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StudentInfoDto params) {
		
		StudentInfoDto studentInfoDto = studentService.loginByStudentIdAndPassword(params);
		
		if( studentInfoDto == null ) {
			return "redirect:./loginPage";
		}
		session.setAttribute("sessionStudentInfo", studentInfoDto);
		
		return "redirect: /toothless/another/student/mainPage";
		
	}
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect: ./loginPage";
	}
	
	
	
	
	@RequestMapping("mainPage")
	public String mainPage(HttpSession session, Model model) {
		 StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		 Map<String, Object> studentOtherInfo = studentService.getStudentOtherInfo(studentInfoDto);
		
		 model.addAttribute("studentOtherInfo", studentOtherInfo);
		 
		return "another/student/mainPage";
	}
	

	
}
