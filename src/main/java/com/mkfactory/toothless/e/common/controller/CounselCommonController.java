package com.mkfactory.toothless.e.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonController {
	
	@RequestMapping("counselCenterStudentMainPage")
	public String counselCenterStudentMainPage() {
		
		return "tl_e/commons/counselCenterStudentMainPage";
	}
	
	@RequestMapping("counselCenterStaffMainPage")
	public String counselCenterStaffMainPage(HttpSession session, Model model) {
		
		StaffInfoDto sessionStaff = (StaffInfoDto)session.getAttribute("staffInfoDto");
		model.addAttribute("sessionStaffInfo", sessionStaff);
		
		return "tl_e/commons/counselCenterStaffMainPage";
	}
	
	@RequestMapping("counselCenterCounselorMainPage")
	public String counselCenterCounselorMainPage() {
		
		return "tl_e/commons/counselCenterCounselorMainPage";
	}
	
}
