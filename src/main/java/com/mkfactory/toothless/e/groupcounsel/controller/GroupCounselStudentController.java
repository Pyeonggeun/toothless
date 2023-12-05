package com.mkfactory.toothless.e.groupcounsel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStudentServiceImpl;

@Controller
@RequestMapping("/tl_e/groupcounsel/student/*")
public class GroupCounselStudentController {
	
	@Autowired
	GroupCounselStudentServiceImpl groupCounselStudentService;
	
	@RequestMapping("groupCounselListPage")
	public String groupCounselListPage(Model model) {
		
		List<GroupCounselDto> groupCounselList = groupCounselStudentService.readGroupCounselList();
		model.addAttribute(groupCounselList);
		
		return "tl_e/groupcounsel/student/groupCounselListPage";
	}
	
}
