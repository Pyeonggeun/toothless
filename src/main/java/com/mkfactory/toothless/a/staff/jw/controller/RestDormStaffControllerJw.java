package com.mkfactory.toothless.a.staff.jw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.staff.jw.service.DormStaffServiceJw;

@RestController
@RequestMapping("/tl_a/staff/*")
public class RestDormStaffControllerJw {

	@Autowired
	private DormStaffServiceJw dormStaffServiceJw;
	
	
	
	
	
}
