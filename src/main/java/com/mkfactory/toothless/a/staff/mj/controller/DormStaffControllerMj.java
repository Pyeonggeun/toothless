package com.mkfactory.toothless.a.staff.mj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerMj {
	
	// 사감 메인페이지
	@RequestMapping("mj_mainPage")
	public String mj_mainPage() {
		
		return "/tl_a/staff/mj_mainPage";
	}
	
	// 공고관리 페이지
	@RequestMapping("mj_readRegisterJoinInfoPage")
	public String mj_readRegisterJoinInfoPage() {
		
		return "/tl_a/staff/mj_readRegisterJoinInfoPage";
	}
	
	// 공고등록 페이지
	@RequestMapping("mj_registerJoinInfoPage")
	public String mj_registerJoinInfoPage() {
			
		return "/tl_a/staff/mj_registerJoinInfoPage";
	}
	
	
	// 학년도 추가 페이지
	@RequestMapping("mj_registerYear")
	public String mj_registerYear() {
			
		return "/tl_a/staff/mj_registerYear";
	}
	
	// 학기 추가 페이지
	@RequestMapping("mj_registerSemester")
	public String mj_registerSemester() {
			
		return "/tl_a/staff/mj_registerSemester";
	}
	
	
}
