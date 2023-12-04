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
	
	//작성글이 리스팅 되는 자유게시판 페이지
	@RequestMapping("freeboardCounselPage")
	public String freeboardCounsel() {
		
		
		
		return "tl_e/freeboardCounsel/freeboardCounselPage";
	}
	
	//자유게시판 글 작성 페이지
	@RequestMapping("createFreeboardPostsPage")
	public String createFreeboardPostsPage() {
		  
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	 }
	
	//자유게시판 글 작성한 내용 dto에 집어넣는 프로세스 
	@RequestMapping("createFreeboardPostsProcess")
	public String createFreeboardPostsProcess() {
			
		freeboardCounselService.createFreeboardPostsProcess();
		
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	}
	
	
}
