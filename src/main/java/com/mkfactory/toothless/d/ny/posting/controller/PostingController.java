package com.mkfactory.toothless.d.ny.posting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_d/ny_posting/*")
public class PostingController {
	
	// 채용공고 등록 페이지
	@RequestMapping("registerJobPostingPage")
	public String registerJobPostingPage() {
		return "/tl_d/ny_posting/registerJobPostingPage";
	}
}
