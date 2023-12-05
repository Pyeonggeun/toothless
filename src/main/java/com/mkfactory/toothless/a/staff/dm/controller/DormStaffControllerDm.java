package com.mkfactory.toothless.a.staff.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.staff.dm.service.DormStaffServiceDm;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerDm {
	
	@Autowired
	public DormStaffServiceDm dormStaffServiceDm;
	
	@RequestMapping("dm_readRoomAssignment")
	public String dm_readRoomAssignment(Model model) {
		
		model.addAttribute("dormList", dormStaffServiceDm.allDormStudent());
		
		return "/tl_a/staff/dm_readRoomAssignment";
	}
	
	@RequestMapping("dm_roomAssignment")
	public String dm_roomAssignment() {
		
		
		return "/tl_a/staff/dm_roomAssignment";
	}
	
	@RequestMapping("dm_readRoomAssignmentA")
	public String dm_readRoomAssignmentA(Model model) {
		
		model.addAttribute("dormListA", dormStaffServiceDm.allDormStudentA());
		
		return "/tl_a/staff/dm_readRoomAssignmentA";
	}
	
	@RequestMapping("dm_readRoomAssignmentB")
	public String dm_readRoomAssignmentB(Model model) {
		
		model.addAttribute("dormListB", dormStaffServiceDm.allDormStudentB());
		
		return "/tl_a/staff/dm_readRoomAssignmentB";
	}
	
	@RequestMapping("dm_roomAssignmentY")
	public String dm_roomAssignmentY(Model model) {
		
		model.addAttribute("dormList", dormStaffServiceDm.allDormStudent());
		
		return "/tl_a/staff/dm_roomAssignmentY";
	}
	
	@RequestMapping("dm_roomAssignmentN")
	public String dm_roomAssignmentN() {
		
		
		return "/tl_a/staff/dm_roomAssignmentN";
	}
	
	@RequestMapping("assignmentDeleteProcess")
	public String assignmentDeleteProcess() {
		
		
		
		return "redirect:./dm_roomAssignmentY";
	}
	
	
}
