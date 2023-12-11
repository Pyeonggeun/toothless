package com.mkfactory.toothless.d.ny.posting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_d/ny_posting/*")
public class RestPostingController {
	
	// 서비스 생성
	@Autowired
	private PostingServiceImpl postingService;
	
	// 로그인 확인용
	@RequestMapping("getStudentId")
	public D_RestResponseDto getStudentId(HttpSession session) {
		D_RestResponseDto restResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		restResponseDto.setResult("success");
		
		if(studentInfoDto != null) {
			restResponseDto.setData(studentInfoDto.getStudent_pk());
		}
		
		return restResponseDto;
		
	}
	
	// 관심공고스크랩
	@RequestMapping("interestPosting")
	public D_RestResponseDto interestPosting(HttpSession session, InterestPostingDto params) {
		D_RestResponseDto restResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			params.setStudent_pk(studentPk);
			
			if(postingService.checkMyPostingInterestCount(params) == 0) {
				postingService.plusInterestPosting(params);
			}else {
				postingService.minusInterestPosting(params);
			}
			
		}
		// 불러 올 값이 없으므로 setData 안씀
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 전체 관심공고 카운트
	@RequestMapping("getTotalInterestPostingCount")
	public D_RestResponseDto getTotalInterestPostingCount(int job_posting_pk) {
		D_RestResponseDto restResponseDto = new D_RestResponseDto();
		
		restResponseDto.setData(postingService.allPostingInterest(job_posting_pk));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 관심공고 했던가..?
	@RequestMapping("isInterestPosting")
	public D_RestResponseDto isInterestPosting(HttpSession session, InterestPostingDto params) {
		D_RestResponseDto restResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			params.setStudent_pk(studentPk);
			restResponseDto.setData(postingService.checkMyPostingInterestCount(params));
		}
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	
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
