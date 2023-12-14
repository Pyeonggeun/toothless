package com.mkfactory.toothless.e.offlinecounsel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.OfflineSurveyDto;
import com.mkfactory.toothless.e.dto.RestResponseOfflineDto;
import com.mkfactory.toothless.e.offlinecounsel.service.OfflineCounselServiceImpl;

@RestController
@RequestMapping("/tl_e/offlineCounsel/*")
public class RestOfflineCounselController {
	
	@Autowired
	private OfflineCounselServiceImpl offlineCounselService;
	
	@RequestMapping("getSessionInfo")
	public RestResponseOfflineDto getSessionInfo(HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		
		System.out.println("stPk:"+studentInfoDto.getStudent_pk());
		restResponseOfflineDto.setData(studentInfoDto.getStudent_pk());
		
		return restResponseOfflineDto;
		
	}
	
	
	@RequestMapping("getReservationList")
	public RestResponseOfflineDto getReservationList(
			@RequestParam(value = "student_pk") int student_pk, 
			@RequestParam(value = "pageNum") int pageNum,
			@RequestParam(defaultValue = "0", value = "counselorNameValue") String counselorNameValue,
			@RequestParam(value = "selectDateType") int selectDateType,
			@RequestParam(defaultValue = "0", value = "datevalue") String datevalueStr,
			@RequestParam(value = "categoryType") int categoryType,
			@RequestParam(value = "stateType") int stateType
			){
		
		System.out.println("student:"+student_pk);
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getCounselReservationList(student_pk, pageNum, counselorNameValue, selectDateType, datevalueStr, categoryType, stateType));
		
		return restResponseOfflineDto;
	}
	
	@RequestMapping("reservationCancelProcess")
	public RestResponseOfflineDto reservationCancelProcess(int reservation_id) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		offlineCounselService.updateReservationStateToCancel(reservation_id);
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("counselReviewModal")
	public RestResponseOfflineDto counselReviewModal(int reservation_id) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getOfflineSurveyPageInfo(reservation_id));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("counselReviewProcess")
	public RestResponseOfflineDto counselReviewProcess(int reservation_id, int score, String text) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		OfflineSurveyDto offlineSurveyDto = new OfflineSurveyDto();
		offlineSurveyDto.setReservation_id(reservation_id);
		offlineSurveyDto.setScore(score);
		offlineSurveyDto.setText(text);
		
		offlineCounselService.insertOfflineSurveyInfo(offlineSurveyDto);
		
		return restResponseOfflineDto;
	}
		
	
	@RequestMapping("studentTotalCounselCount")
	public RestResponseOfflineDto studentTotalCounselCount(HttpSession session,
			@RequestParam(defaultValue = "0", value = "counselorNameValue") String counselorNameValue,
			@RequestParam(value = "selectDateType") int selectDateType,
			@RequestParam(defaultValue = "0", value = "datevalue") String datevalueStr,
			@RequestParam(value = "categoryType") int categoryType,
			@RequestParam(value = "stateType") int stateType
			) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		restResponseOfflineDto.setData(offlineCounselService.getStudentTotalCounselCount(studentInfoDto.getStudent_pk(), counselorNameValue, selectDateType, datevalueStr, categoryType, stateType));
		
		return restResponseOfflineDto;
	}
	
	
	
	
}
