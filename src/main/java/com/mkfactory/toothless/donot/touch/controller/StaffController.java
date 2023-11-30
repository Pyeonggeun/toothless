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
			int center_pk = staffInfoDto.getCenter_pk();
			
			if( staffInfoDto != null ) {
				session.setAttribute("sessionStaffInfo", staffInfoDto);
				if(center_pk == 1) {
					return "redirect: ./mainPage";
					
				}else if(center_pk == 2){
					return "redirect: ./mainPage";
					
				}else if(center_pk == 3){
					return "redirect: ./mainPage";
					
				}else if(center_pk == 4){
					return "redirect: ./mainPage";
					
				}else if(center_pk == 5){
					return "redirect: ./mainPage";
					
				}else{
					return "redirect: ./mainPage";
				}
			
			}else{
				return "redirect: ./loginPage";
			}
		}
		
		@RequestMapping("mainPage")
		public String mainPage() {
			
			
			return "staff/mainPage";
		}
}
