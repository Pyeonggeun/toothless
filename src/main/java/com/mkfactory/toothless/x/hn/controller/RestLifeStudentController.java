package com.mkfactory.toothless.x.hn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.hn.service.LifeStudentServiceImpl;

@RestController
@RequestMapping("/tl_x/hn/*")
public class RestLifeStudentController {
	
	@Autowired
	private LifeStudentServiceImpl lifeStudentService;
	
	@RequestMapping("getMyPk")
	public RestResponseDto getMyPk(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			restResponseDto.setData(externalInfoDto.getExternal_pk());
		}
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getReceivingLectureList")
	public RestResponseDto getReceivingLectureList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getReceivingLectureList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getDetailPageInfo")
	public RestResponseDto getDetailPageInfo(int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getDetailPageInfo(open_lecture_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("isApply")
	public RestResponseDto isApply(HttpSession session, int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		restResponseDto.setData(lifeStudentService.isApply(open_lecture_key, life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("isConditionSatisfaction")
	public RestResponseDto isConditionSatisfaction(HttpSession session, int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		restResponseDto.setData(lifeStudentService.isConditionSatisfaction(open_lecture_key, life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertLectureStudentInfo")
	public RestResponseDto insertLectureStudentInfo(HttpSession session, int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		LectureStudentDto lectureStudentDto = new LectureStudentDto();
		
		lectureStudentDto.setOpen_lecture_key(open_lecture_key);
		lectureStudentDto.setLife_student_key(life_student_key);
		
		lifeStudentService.insertLectureStudentInfo(lectureStudentDto);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getOpenLectureList")
	public RestResponseDto getOpenLectureList(int[] searchType, String searchWord, int searchRecruitment, int pageNumber, int eachTotalNumber) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getOpenLectureList(searchType, searchWord, searchRecruitment, pageNumber, eachTotalNumber));
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	@RequestMapping("getTotalOpenLectureCount")
	public RestResponseDto getTotalOpenLectureCount(int[] searchType, String searchWord, int searchRecruitment) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getTotalOpenLectureCount(searchType, searchWord, searchRecruitment));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getLectureCategoryList")
	public RestResponseDto getLectureCategoryList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getLectureCategoryList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

}
