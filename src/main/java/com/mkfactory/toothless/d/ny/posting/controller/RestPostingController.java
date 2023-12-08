package com.mkfactory.toothless.d.ny.posting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;

@RestController
@RequestMapping("/tl_d/ny_posting/*")
public class RestPostingController {
	
	// 서비스 생성
	@Autowired
	private PostingServiceImpl postingService;
	
	
	// 학생 페이지 공고리스트 출력
	@RequestMapping("getJobPostingListForStudent")
	public D_RestResponseDto getJobPostingListForStudent() {
		
		// DTO생성
		D_RestResponseDto restResponseDto = new D_RestResponseDto();
		
		// 메서드 호출(데이터에 셋팅)
		restResponseDto.setData(postingService.getPostingListForStudent());
		
		// 항상 result는 success
		restResponseDto.setResult("success");
		
		// 항상 리턴값은 DTO
		return restResponseDto;
	}
	
	// 공고리스트 삭제(교직원) 만들어보기
}
