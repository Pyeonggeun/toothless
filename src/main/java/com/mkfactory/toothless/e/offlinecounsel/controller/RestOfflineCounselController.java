package com.mkfactory.toothless.e.offlinecounsel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.OfflineReservationDto;
import com.mkfactory.toothless.e.dto.OfflineSurveyDto;
import com.mkfactory.toothless.e.dto.RestResponseOfflineDto;
import com.mkfactory.toothless.e.offlinecounsel.service.OfflineCounselServiceImpl;

@RestController
@RequestMapping("/tl_e/offlineCounsel/*")
public class RestOfflineCounselController {
	
	@Autowired
	private OfflineCounselServiceImpl offlineCounselService;
	
	@RequestMapping("getSessionStudentInfo")
	public RestResponseOfflineDto getSessionStudentInfo(HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		
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
			@RequestParam(required = false, value = "categoryValues") List<Integer> categoryValues,
			@RequestParam(value = "stateType") int stateType
			){
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getCounselReservationList(student_pk, pageNum, counselorNameValue, selectDateType, datevalueStr, categoryValues, stateType));
		
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
			@RequestParam(required = false, value = "categoryValues") List<Integer> categoryValues,
			@RequestParam(value = "stateType") int stateType
			) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		restResponseOfflineDto.setData(offlineCounselService.getStudentTotalCounselCount(studentInfoDto.getStudent_pk(), counselorNameValue, selectDateType, datevalueStr, categoryValues, stateType));
		
		return restResponseOfflineDto;
	}
	
	
	@RequestMapping("getReservationListByCounselor")
	public RestResponseOfflineDto getReservationListByCounselor(
			@RequestParam(value = "external_pk") int external_pk, 
			@RequestParam(value = "pageNum") int pageNum) {

		System.out.println("listPAge: "+pageNum);
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.getReservationListByCounselorId(external_pk, pageNum));
		
		return restResponseOfflineDto;

	}
	
	@RequestMapping("getCounselReportInfo")
	public RestResponseOfflineDto getCounselReportInfo(
			@RequestParam(value = "reservationPk") int reservationPk, 
			@RequestParam(value = "studentPk") int studentPk, 
			@RequestParam(value = "categoryPk") int categoryPk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.createReportInfo(reservationPk, studentPk, categoryPk));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("counselReportRegisterProcess")
	public RestResponseOfflineDto counselReportRegisterProcess(
			@RequestParam(value = "id") int id, 
			@RequestParam(value = "state") String state, 
			@RequestParam(value = "text") String text,
			@RequestParam(value = "location") String location
			) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		System.out.println("일지등록reservationID: "+id);
		offlineCounselService.updateCounselReservationState(id, state);
		offlineCounselService.insertCounselDocumentInfo(id, text, location);
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("counselorTotalCounselCount")
	public RestResponseOfflineDto counselorTotalCounselCount(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getReservationCountByCounselorId(external_pk));
		
		return restResponseOfflineDto;
		
	}
	

	@RequestMapping("twoWeekStatisticsData")
	public RestResponseOfflineDto twoWeekStatisticsData(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getTwoWeekStatisticsData(external_pk));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("twoWeekStatisticsDataByCategory")
	public RestResponseOfflineDto twoWeekStatisticsDataByCategory(int external_pk) {
	
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getTwoWeekStatisticsDataByCategory(external_pk));
		
		return restResponseOfflineDto;
		
	}

	@RequestMapping("offlineSurveyScoreStatistics")
	public RestResponseOfflineDto offlineSurveyScoreStatistics(int external_pk) {
	
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getOfflineScoreStatistics(external_pk));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("offlineStatisticsOfDay")
	public RestResponseOfflineDto offlineStatisticsOfDay(int external_pk) {
	
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getOfflineStatisticsOfDay(external_pk));
		
		return restResponseOfflineDto;
		
	}
		
	
	@RequestMapping("isPossibleReservation")
	public RestResponseOfflineDto isPossibleReservation() {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getDateReservationList());
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("getCalendarData")
	public RestResponseOfflineDto getCalendarData() {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		//restResponseOfflineDto.setData(offlineCounselService.getDateReservationList());
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("reservationCalendarProcess")
	public RestResponseOfflineDto reservationCalendarProcess(int student_pk, int counselor_id, int type_category_id, String text, String reservationDate) {
		
		System.out.println(student_pk);
		System.out.println(counselor_id);
		System.out.println(type_category_id);
		System.out.println(text);
		System.out.println(reservationDate);
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.insertOfflineReservationInfo(student_pk, counselor_id, type_category_id, text, reservationDate));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("categoryAndCounselorName")
	public RestResponseOfflineDto categoryAndCounselorName(int categoryPk, int counselorPk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.categoryAndCounselor(categoryPk, counselorPk));
		
		return restResponseOfflineDto;
		
	}
	
	
}
