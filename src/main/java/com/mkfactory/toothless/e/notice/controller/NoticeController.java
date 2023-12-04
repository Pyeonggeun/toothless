package com.mkfactory.toothless.e.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_e/notice/*")
public class NoticeController {

	@RequestMapping("noticeMainPage")
	public String noticeMainPage() {
		
		return "tl_e/notice/noticeMainPage";
	}
	
	@RequestMapping("writeNoticeArticlePage")
	public String writeNoticeArticlePage() {
		
		return "tl_e/notice/writeNoticeArticlePage";
	}
}
