package com.mkfactory.toothless.donot.touch.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;

@Controller
@RequestMapping("/another/staff/*")
public class StaffController {
		@Autowired
		private StaffServiceImpl staffService;
		
		@RequestMapping("loginPage")
		public String loginPage() {
			
			
			
			return "another/staff/loginPage";
		}
		
		@RequestMapping("loginProcess")
		public String loginProcess(HttpSession session, StaffInfoDto params) {
			
			StaffInfoDto staffInfoDto = staffService.loginByStaffIdAndPassword(params);
		
			if(staffInfoDto == null) {
				return "redirect: ./loginPage";
			}
			
			
			session.setAttribute("sessionStaffInfo", staffInfoDto);
			if(staffInfoDto.getCenter_pk() == 1) {
				
				return "redirect: ../../tl_c/woojae/ajdksStaffMainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 2){
				
				return "redirect: ../../tl_b/common/studentMainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 3){
				
				return "redirect: ../../tl_e/commons/counselCenterStaffMainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 4){
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 5){
				
				return "redirect: ./mainPage";
				
			}else{
				return "redirect: ./anotherMainPage";
			}
		
		}
		@RequestMapping("logoutProcess")
		public String logoutProcess(HttpSession session) {
		
			session.invalidate();
			
			return "redirect: ./loginPage";
		}
		
		@RequestMapping("anotherMainPage")
		public String anotherMainPage(Model model) {
			
			Map<String, Object> listMap = staffService.getProfessorAndDepqrtmentList();
			
			model.addAttribute("listMap", listMap);
			
			return "another/staff/anotherMainPage";
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
		@RequestMapping("anotherStudentManagerPage")
		public String anotherStudentManagerPage(Model model) {
			
			Map<String, Object> listMap = staffService.getProfessorAndDepqrtmentList();
			
			model.addAttribute("listMap", listMap);
			
			return "another/staff/anotherStudentManagerPage";
		}
		
}
