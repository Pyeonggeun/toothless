package com.mkfactory.toothless.x.hn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.x.dto.LectureReviewDto;
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
	
	@RequestMapping("isOverlapDate")
	public RestResponseDto isOverlapDate(HttpSession session, int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		restResponseDto.setData(lifeStudentService.isOverlapDate(open_lecture_key, life_student_key));
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
	
	@RequestMapping("getLifeStudentKey")
	public RestResponseDto getLifeStudentKey(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		restResponseDto.setData(life_student_key);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getReviewLectureList")
	public RestResponseDto getReviewLectureList(int pageNumber, int life_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getReviewLectureList(pageNumber, life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getTotalReviewLectureCount")
	public RestResponseDto getTotalReviewLectureCount(int life_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getTotalReviewLectureCount(life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getLectureReviewInfo")
	public RestResponseDto getLectureReviewInfo(int lecture_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getLectureReviewInfo(lecture_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertLectureReviewInfo")
	public RestResponseDto insertLectureReviewInfo(LectureReviewDto params) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		lifeStudentService.insertLectureReviewInfo(params);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	@RequestMapping("getTotalMyLectureCount")
	public RestResponseDto getTotalMyLectureCount(int life_student_key, int searchType) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getTotalMyLectureCount(life_student_key, searchType));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getMyLecture")
	public RestResponseDto getMyLecture(int life_student_key, int pageNumber, int searchType) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getMyLectureInfoList(life_student_key, pageNumber, searchType));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getLectureStudentKey")
	public RestResponseDto getLectureStudentKey(int life_student_key, int open_lecture_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getLectureStudentKey(life_student_key, open_lecture_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getLectureProgressInfo")
	public RestResponseDto getLectureProgressInfo(int open_lecture_key, int lecture_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getLectureProgressInfo(open_lecture_key, lecture_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getTestInfo")
	public RestResponseDto getTestInfo(int lecture_test_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getTestInfo(lecture_test_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertTestResult")
	public RestResponseDto insertTestResult(int[] results, int lecture_student_key, int lecture_test_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		lifeStudentService.insertTestResult(results, lecture_student_key, lecture_test_key);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getTotalCount")
	public RestResponseDto getTotalCount(int life_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getTotalCount(life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getIngOpenLectureInfo")
	public RestResponseDto getIngOpenLectureInfo(int life_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getIngOpenLectureInfo(life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getCompleteOpenLectureInfo")
	public RestResponseDto getCompleteOpenLectureInfo(int life_student_key) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(lifeStudentService.getCompleteOpenLectureInfo(life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getTopName")
	public RestResponseDto getTopName(HttpSession session) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int life_student_key = lifeStudentService.getLifeStudentKey(externalInfoDto.getExternal_pk());
		
		restResponseDto.setData(lifeStudentService.getTopName(life_student_key));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

}
