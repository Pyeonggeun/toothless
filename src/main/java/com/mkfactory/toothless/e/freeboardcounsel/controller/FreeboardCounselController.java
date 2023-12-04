package com.mkfactory.toothless.e.freeboardcounsel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.freeboardcounsel.service.FreeboardCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/freeboardCounsel/*")
public class FreeboardCounselController {

	@Autowired
	FreeboardCounselServiceImpl  freeboardCounselService;
	
	//작성글이 리스팅 되야하는 자유게시판 페이지
	@RequestMapping("freeboardCounselPage")
	public String freeboardCounsel(Model model) {
		
		List<Map<String, Object>> combinedFreeboardList = freeboardCounselService.getfreeboardList();
		model.addAttribute("combinedFreeboardList", combinedFreeboardList);
	
		
		return "tl_e/freeboardCounsel/freeboardCounselPage";
	}
	
	//자유게시판 글 작성 페이지
	@RequestMapping("createFreeboardPostsPage")
	public String createFreeboardPostsPage() {
		  
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	 }
	
	//자유게시판 글 작성한 내용 dto에 집어넣는 프로세스 
	@RequestMapping("createFreeboardPostsProcess")
	public String createFreeboardPostsProcess(FreeboardDto paraFreeboardDto) {
			
		freeboardCounselService.createFreeboardPostsProcess (paraFreeboardDto);
		
		return "tl_e/freeboardCounsel/createFreeboardPostsComplete";
	}
	
	//자유게시판 글 수정 페이지
	//자유게시판 글 수정 프로세스
	//자유게시판 글 삭제 프로세스
}
