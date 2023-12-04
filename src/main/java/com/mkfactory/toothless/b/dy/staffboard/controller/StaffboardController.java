package com.mkfactory.toothless.b.dy.staffboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.StaffNoticeboardDto;
import com.mkfactory.toothless.b.dy.staffboard.service.StaffboardServiceImpl;

@Controller
@RequestMapping("/tl_b/dy/*")
public class StaffboardController {

	@Autowired
	private StaffboardServiceImpl staffboardService;
	
	//교직원용 게시판 페이지
	@RequestMapping("staffNoticeboardPage")
	public String staffNoticeboardPage() {
		
		
		return "tl_b/dy/staffNoticeboardPage";
	}
	
	//글쓰기
	@RequestMapping("writeTextPage")
	public String writeTextPage() {
		
		
		return "tl_b/dy/writeTextPage";
	}
	//글 작성 프로세스
	@RequestMapping("writeTextProcess")
	public String writeTextProcess(StaffNoticeboardDto params) {
		
		System.out.println(params.getTitle());
		
		staffboardService.StaffboardText(params);
		
		return "redirect:./staffNoticeboardPage";
	}
	
}
