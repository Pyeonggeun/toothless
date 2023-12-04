package com.mkfactory.toothless.a.staff.jw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.staff.jw.service.DormStaffServiceJw;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerJw {

	@Autowired
	private DormStaffServiceJw dormStaffServiceJw;
	
	@RequestMapping("jw_exitSituationPage")
	public String jw_exitSituationPage() {
		
		return "/tl_a/staff/jw_exitSituationPage";
	}
	
	@RequestMapping("jw_callAttendSituationPage")
	public String jw_callAttendSituationPage() {
		
		return "/tl_a/staff/jw_callAttendSituationPage";
	}
	
	@RequestMapping("jw_pointCategoryPage")
	public String jw_pointCategoryPage() {
		
		return "/tl_a/staff/jw_pointCategoryPage";
	}
	
	@RequestMapping("jw_pointManagementPage")
	public String jw_pointManagementPage() {
		
		return "/tl_a/staff/jw_pointManagementPage";
	}
	
	@RequestMapping("jw_pointSituationPage")
	public String jw_pointSituationPage() {
		
		return "/tl_a/staff/jw_pointSituationPage";
	}
	
	@RequestMapping("jw_executiveAssignmentPage")
	public String jw_executiveAssignmentPage() {
		
		return "/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomAssignmentPage")
	public String jw_executiveRoomAssignmentPage() {
		
		return "/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveAssignmentSituationPage")
	public String jw_executiveAssignmentSituationPage() {
		
		return "/tl_a/staff/jw_executiveAssignmentSituationPage";
	}
	
	@RequestMapping("jw_diaryManagementPage")
	public String jw_diaryManagementPage() {
		
		return "/tl_a/staff/jw_diaryManagementPage";
	}
	
	
}
