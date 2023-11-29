package com.mkfactory.toothless.donot.touch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/student/*")
public class StudentController {
	@Autowired
	private StudentServiceImpl studentService;
	
	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		
		return "student/loginPage";
	}
	
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StudentInfoDto params) {
		
		StudentInfoDto studentInfoDto = studentService.loginByStudentIdAndPassword(params);
		
		if( studentInfoDto != null ) {
			session.setAttribute("sessionStudentInfo", studentInfoDto);
			return "rediract: ./mainPage";
		}else{
			return "rediract: ./loginPage";
		}
		
		
		
	}
	
	@RequestMapping("mainPage")
	public String mainPage(int student_pk) {
		
		
		return "student/mainPage";
	}
}
