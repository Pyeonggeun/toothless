package com.mkfactory.toothless.e.groupcounsel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;

@Controller("groupCounselStaffController")
@RequestMapping("/tl_e/groupcounsel/staff/*")
public class GroupCounselStaffController {
	
	@Autowired
	GroupCounselStaffServiceImpl staffService;
	
	@RequestMapping("groupCounselRegisterPage")
	public String groupCounselRegisterPage() {
		
		
		return "/tl_e/groupcounsel/staff/groupCounselRegisterPage";
	}
	
	
}
