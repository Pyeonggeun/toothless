package com.mkfactory.toothless.a.staff.jw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.a.staff.jw.service.DormStaffServiceJw;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerJw {

	@Autowired
	private DormStaffServiceJw dormStaffServiceJw;
	
	@RequestMapping("jw_exitSituationPage")
	public String jw_exitSituationPage(Model model) {
		
		model.addAttribute("exitListMap", dormStaffServiceJw.getAllExitSituation());
		
		return "/tl_a/staff/jw_exitSituationPage";
	}
	
	@RequestMapping("jw_callAttendSituationPage")
	public String jw_callAttendSituationPage() {
		
		return "/tl_a/staff/jw_callAttendSituationPage";
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
	public String jw_executiveAssignmentPage(Model model) {
		
		model.addAttribute("dormStudentListMap", dormStaffServiceJw.getAllDormStudentList());
		
		return "/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	@RequestMapping("jw_deleteExecutiveProcess")
	public String jw_deleteExecutiveProcess(int dorm_student_pk) {
		
		dormStaffServiceJw.deleteExecutive(dorm_student_pk);
		
		return "redirect:/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	
	@RequestMapping("jw_executiveAssignmentProcess")
	public String jw_executiveAssignmentProcess(int dorm_student_pk) {
		
		dormStaffServiceJw.registerExecutive(dorm_student_pk);
		
		return "redirect:/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomAssignmentPage")
	public String jw_executiveRoomAssignmentPage(Model model) {
		
		model.addAttribute("executiveListMap", dormStaffServiceJw.getAllExecutiveList());
		
		return "/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomassignmentProcess")
	public String jw_executiveRoomassignmentProcess(@RequestParam("dorm_room_pk") int dorm_room_pk, @RequestParam("executive_pk") int executive_pk) {
		
		dormStaffServiceJw.assignmentExecutiveRoom(dorm_room_pk, executive_pk);
		
		return "redirect:/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomRemoveProcess")
	public String jw_executiveRoomRemoveProcess(@RequestParam("executive_pk") int executive_pk, @RequestParam("dorm_room_pk") int dorm_room_pk) {
		
		dormStaffServiceJw.removeExecutivePerRoom(executive_pk, dorm_room_pk);
		
		return "redirect:/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveAssignmentSituationPage")
	public String jw_executiveAssignmentSituationPage(Model model) {
		
		model.addAttribute("executiveManagemenListMap", dormStaffServiceJw.getAllExecutiveManagementList());
		
		return "/tl_a/staff/jw_executiveAssignmentSituationPage";
	}
	
	@RequestMapping("jw_diaryManagementPage")
	public String jw_diaryManagementPage(Model model) {
		
		model.addAttribute("getAllDiaryList", dormStaffServiceJw.getAllDiaryList());
		
		return "/tl_a/staff/jw_diaryManagementPage";
	}
	
	
}
