package com.mkfactory.toothless.x.hn.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.x.hn.service.LifeStudentServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping("tl_x/hn/*")
public class LifeStudentController {
	
	@RequestMapping("mainPage")
	public String mainPage() {
		
		return "tl_x/hn/mainPage";
	}
	
	@RequestMapping("applyPage")
	public String applyPage() {
		
		return "tl_x/hn/applyPage";
	}
	
	@RequestMapping("detailPage")
	public String detailPage(Model model, int open_lecture_key) {
		
		model.addAttribute("open_lecture_key", open_lecture_key);
		
		return "tl_x/hn/detailPage";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		
		return "tl_x/hn/myPage";
	}
	
	@RequestMapping("lecturePage")
	public String lecturePage() {
		
		return "tl_x/hn/lecturePage";
	}
	
	@RequestMapping("reviewPage")
	public String reviewPage() {
		
		return "tl_x/hn/reviewPage";
	}

}
