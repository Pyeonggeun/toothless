package com.mkfactory.toothless.e.freeboardcounsel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.freeboardcounsel.service.FreeboardCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/freeboardCounsel/*")
public class FreeboardCounselController {

	@Autowired
	FreeboardCounselServiceImpl  freeboardCounselService;
	
	@RequestMapping("freeboardCounselPage")
	public String freeboardCounsel() {
		
		
		
		return "tl_e/freeboardCounsel/freeboardCounselPage";
	}
	
	@RequestMapping("createFreeboardPostsPage")
	public String createFreeboardPostsPage() {
		  
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	 }
	
	@RequestMapping("createFreeboardPostsProcess")
	public String createFreeboardPostsProcess() {
			
		freeboardCounselService.createFreeboardPostsProcess();
		
		return"";
	}
	
	
}
