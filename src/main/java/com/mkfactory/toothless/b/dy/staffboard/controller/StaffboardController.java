package com.mkfactory.toothless.b.dy.staffboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_b/dy/*")
public class StaffboardController {

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
	
	
}
