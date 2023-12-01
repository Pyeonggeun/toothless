package com.mkfactory.toothless.donot.touch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
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
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 3){
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 4){
				
				return "redirect: ./mainPage";
				
			}else if(staffInfoDto.getCenter_pk() == 5){
				
				return "redirect: ./mainPage";
				
			}else{
				return "redirect: ./mainPage";
			}
		
		}
		
		@RequestMapping("mainPage")
		public String mainPage() {
			
			
			return "staff/mainPage";
		}
}
