package com.mkfactory.toothless.e.groupcounsel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;

@Controller
@RequestMapping("/tl_e/groupcounsel/staff/*")
public class GroupCounselStaffController {
	
	@Autowired
	GroupCounselStaffServiceImpl groupCounselStaffService;
	
	@RequestMapping("groupCounselRegisterPage")
	public String groupCounselRegisterPage() {
		
		return "/tl_e/groupcounsel/staff/groupCounselRegisterPage";
	}
	
	@RequestMapping("groupCounselRegisterProcess")
	public String groupCounselRegisterProcess(GroupCounselDto groupCounselDto) {
		groupCounselStaffService.groupCounselRegister(groupCounselDto);
		
		System.out.println(groupCounselDto.getLocation());
		System.out.println("11");
		System.out.println(groupCounselDto.getAmount());
		System.out.println(groupCounselDto.getText());
		System.out.println(groupCounselDto.getTitle());
		System.out.println(groupCounselDto.getCreated_at());
		
		return "redirect: ./groupCounselRegisterPage";
	}
	
	@RequestMapping("groupCounselListPage")
	public String groupCounselListPage() {
		
		return "/tl_e/groupcounsel/staff/groupCounselListPage";
	}
	
}
