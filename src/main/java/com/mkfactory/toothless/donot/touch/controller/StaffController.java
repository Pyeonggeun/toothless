package com.mkfactory.toothless.donot.touch.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;

@Controller
@RequestMapping("/staff/*")
public class StaffController {
		@Autowired
		private StaffServiceImpl staffService;
		
		@RequestMapping("loginPage")
		public String loginPage() {
			
			
			
			return "staff/loginPage";
		}
		
		@RequestMapping("loginProcess")
		public String loginProcess(HttpSession session, StaffInfoDto params) {
			
			StaffInfoDto staffInfoDto = staffService.loginByStaffIdAndPassword(params);
		
			if(staffInfoDto == null) {
				return "redirect: ./loginPage";
			}
			
			
			session.setAttribute("sessionStaffInfo", staffInfoDto);
			if(staffInfoDto.getCenter_pk() == 1) {
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 2){
				
				return "redirect: ./tl_b_views/common/studentMainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 3){
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 4){
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 5){
				
				return "redirect: ./mainPage";
				
			}else{
				return "redirect: ./anotherMainPage";
			}
		
		}
		
		@RequestMapping("anotherMainPage")
		public String anotherMainPage(Model model) {
			
			Map<String, Object> listMap = staffService.getProfessorAndDepqrtmentList();
			
			model.addAttribute("listMap", listMap);
			
			return "staff/anotherMainPage";
		}
		@RequestMapping("studentRegisterProcess")
		public String studentRegisterProcess(StudentInfoDto studentInfoDto,
				int semester_count,
				@RequestParam(required = false, defaultValue="0")
				int graduation,
				double scoreAVG) {
			
			staffService.insertStudentInfo(studentInfoDto, semester_count, graduation, scoreAVG);
			
			return "redirect:./anotherMainPage";
		}
		@RequestMapping("staffRegisterProcess")
		public String staffRegisterProcess(StaffInfoDto staffInfoDto) {
			
			staffService.insertStaffInfo(staffInfoDto);
			
			return "redirect:./anotherMainPage";
		}
		@RequestMapping("professorRegisterProcess")
		public String professorRegisterProcess(ProfessorInfoDto professorInfoDto) {
			
			staffService.insertProfessorInfo(professorInfoDto);
			
			return "redirect:./anotherMainPage";
		}
		
		
}
