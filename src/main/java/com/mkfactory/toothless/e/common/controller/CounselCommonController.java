package com.mkfactory.toothless.e.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonController {
	
	@RequestMapping("studentCounselMainPage")
	public String studentCounselMainPage() {
		
		return "tl_e/commons/studentCounselMainPage";
	}
	
	@RequestMapping("staffCounselMainPage")
	public String staffCounselMainPage(HttpSession session, Model model) {
		
		StaffInfoDto sessionStaff = (StaffInfoDto)session.getAttribute("staffInfoDto");
		model.addAttribute("sessionStaffInfo", sessionStaff);
		
		return "tl_e/commons/staffCounselMainPage";
	}
	
	@RequestMapping("counselorCounselMainPage")
	public String counselorCounselMainPage() {
		
		return "tl_e/commons/counselorCounselMainPage";
	}
	
}
