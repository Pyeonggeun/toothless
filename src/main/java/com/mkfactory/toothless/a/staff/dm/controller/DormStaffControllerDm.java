package com.mkfactory.toothless.a.staff.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.staff.dm.service.DormStaffServiceDm;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerDm {
	
	@Autowired
	public DormStaffServiceDm dormStaffServiceDm;
	
	@RequestMapping("dm_readRoomAssignment")
	public String dm_readRoomAssignment() {
		
		
		return "/tl_a/staff/dm_readRoomAssignment";
	}
	
	@RequestMapping("dm_roomAssignment")
	public String dm_roomAssignment() {
		
		
		return "/tl_a/staff/dm_roomAssignment";
	}
	
}
