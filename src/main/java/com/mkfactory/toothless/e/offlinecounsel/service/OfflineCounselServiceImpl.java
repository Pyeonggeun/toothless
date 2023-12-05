package com.mkfactory.toothless.e.offlinecounsel.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselDocumentDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OfflineReservationDto;
import com.mkfactory.toothless.e.dto.OfflineSurveyDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.offlinecounsel.mapper.OfflineCounselMapper;

@Service
public class OfflineCounselServiceImpl {
	
	@Autowired
	OfflineCounselMapper offlineCounselMapper;
	
	public int getOfflineReservationPk() {
		
		return offlineCounselMapper.createOfflineReservationPk();
	}
	
	public List<Map<String, Object>> sevenDaysDateExtraction(int counselor_id) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		LocalDate today = LocalDate.now();
		
		for(int i = 0; i < 7; i++) {
			
			int year = today.getYear();
			int month = today.getMonthValue();
			int date = today.getDayOfMonth();
			DayOfWeek dayOfWeek = today.getDayOfWeek();
			int day = dayOfWeek.getValue();
			
			List<String> reservationDateInfoList = offlineCounselMapper.selectReservationDateInfoByCounselorId(counselor_id);
			
			List<Map<String, Object>> timeList = new ArrayList<>();
			
			for(int j = 9; j < 18; j++) {
				
				String dateString = year + "." + month + "." + date + "." + j;
				int hour = j;
				
				Map<String, Object> dateTimeMap = new HashMap<>();
				dateTimeMap.put("dateString", dateString);
				dateTimeMap.put("hour", hour);
				dateTimeMap.put("reservationDateInfoList", reservationDateInfoList);
				
				timeList.add(dateTimeMap);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("year", year);
			map.put("month", month);
			map.put("date", date);
			map.put("day", day); // jsp에서 choose,when,otherwise로 요일 이름 변경
			map.put("timeList", timeList);
			
			list.add(map);
			
			today = today.plusDays(1);
		}
		return list;
		
	}
	
	public List<Map<String, Object>> getCounselorListByTypeCategory(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<TypeCategoryDto> categoryList = offlineCounselMapper.selectTypeCategoryList();
		
		for(TypeCategoryDto typeCategoryDto : categoryList) {

			Map<String, Object> categoryMap = new HashMap<>();
			categoryMap.put("typeCategoryDto", typeCategoryDto);
			
			int categoryPk = typeCategoryDto.getId();
			
			List<Map<String, Object>> counselorByCategoryList = new ArrayList<Map<String,Object>>();
			
			List<CounselorTypeDto> counselorTypeList = offlineCounselMapper.selectCounselorTypeList(categoryPk);
			
			for(CounselorTypeDto counselorTypeDto : counselorTypeList) {
				
				Map<String, Object> map = new HashMap<>();
				
				int counselorPk = counselorTypeDto.getCounselor_id();
				
				CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfo(counselorPk);
				
				map.put("counselorTypeDto", counselorTypeDto);
				map.put("counselorDto", counselorDto);
				
				counselorByCategoryList.add(map);
			}
			categoryMap.put("counselorByCategoryList", counselorByCategoryList);
			
			list.add(categoryMap);
		}
		
		return list;
	}
	
	public CounselorDto getCounselorInfo(int counselor_id) {
		
		CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfo(counselor_id);
		
		String career = counselorDto.getCareer();
		career = StringEscapeUtils.escapeHtml4(career);
		career = career.replaceAll("\n", "<br>");
		counselorDto.setCareer(career);
		
		return counselorDto;
	}
	
	public Map<String, Object> insertOfflineReservationInfo(
			OfflineReservationDto params, 
			@RequestParam(value = "counsel_hour") String counsel_hour) {
		
		
		// 밑에 로직 추후 sevice단에서 구현하고 예약dto에 년,월,일,시 각각 set해주면 됨... 
		String str[] = counsel_hour.split("\\.");
		int[] dayInfo = new int[5];
		
		for(int i = 0; i < str.length; i++) {
			dayInfo[i] = Integer.parseInt(str[i]);
		}
		
		params.setCounsel_year(dayInfo[0]);
		params.setCounsel_month(dayInfo[1]);
		params.setCounsel_date(dayInfo[2]);
		params.setCounsel_hour(dayInfo[3]);
		params.setCounsel_day(dayInfo[4]);
		params.setState("신청");

		offlineCounselMapper.insertOfflineReservationInfo(params);
		
		Map<String, Object> map = new HashMap<>();
		
		OfflineReservationDto offlineReservationDto = offlineCounselMapper.selectOfflineReservationCompletedInfo(params.getId());
		
		int counselor_id = offlineReservationDto.getCounselor_id();
		CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfo(counselor_id);
		
		int categoryId = offlineReservationDto.getType_category_id();
		TypeCategoryDto typeCategoryDto = offlineCounselMapper.selectTypeCategoryDtoById(categoryId);
		
		int day = offlineReservationDto.getCounsel_day();
		String dayString = "";
		
		if(day == 1) {
			dayString = "월";
		}else if(day == 2) {
			dayString = "화";
		}else if(day == 3) {
			dayString = "수";
		}else if(day == 4) {
			dayString = "목";
		}else if(day == 5) {
			dayString = "금";
		}else if(day == 6) {
			dayString = "토";
		}else if(day == 7) {
			dayString = "일";
		}
		
		map.put("offlineReservationDto", offlineReservationDto);
		map.put("counselorDto", counselorDto);
		map.put("typeCategoryDto", typeCategoryDto);
		map.put("dayString", dayString);
		
		return map;
	}
	
	public List<Map<String, Object>> getReservationListByCounselorId(int external_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfoByExternalPk(external_pk);
		int counselor_pk = counselorDto.getId();
		
		List<OfflineReservationDto> reservationList = offlineCounselMapper.selectReservationListByCounselorId(counselor_pk);
		
		for(OfflineReservationDto offlineReservationDto : reservationList) {
			
			int reservationPk = offlineReservationDto.getId();
			CounselDocumentDto counselDocumentDto = offlineCounselMapper.selectCounselDocumentInfoByReservationId(reservationPk);
			
			int studentPk = offlineReservationDto.getStudent_pk();
			StudentInfoDto studentInfoDto = offlineCounselMapper.selectStudentInfoByStudentPk(studentPk);
			
			int categoryPk = offlineReservationDto.getType_category_id();
			TypeCategoryDto typeCategoryDto = offlineCounselMapper.selectTypeCategoryDtoById(categoryPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("offlineReservationDto", offlineReservationDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("typeCategoryDto", typeCategoryDto);
			map.put("counselDocumentDto", counselDocumentDto);
			
			list.add(map);
		}
		return list;
	}
	
	public Map<String, Object> createReportInfo(int reservationPk, int studentPk, int categoryPk){
		
		OfflineReservationDto offlineReservationDto = offlineCounselMapper.selectOfflineReservationCompletedInfo(reservationPk);
		StudentInfoDto studentInfoDto = offlineCounselMapper.selectStudentInfoByStudentPk(studentPk);
		TypeCategoryDto typeCategoryDto = offlineCounselMapper.selectTypeCategoryDtoById(categoryPk);
		
		CounselDocumentDto counselDocumentDto = offlineCounselMapper.selectCounselDocumentInfoByReservationId(reservationPk);
		
		Map<String, Object> map = new HashMap<>();
		map.put("offlineReservationDto", offlineReservationDto);
		map.put("studentInfoDto", studentInfoDto);
		map.put("typeCategoryDto", typeCategoryDto);
		map.put("counselDocumentDto", counselDocumentDto);
		
		return map;
	}
	
	public void updateCounselReservationState(int id, String state) {
		
		offlineCounselMapper.updateCounselReservationState(id, state);
	}
	
	public void insertCounselDocumentInfo(int id, String text) {
		
		offlineCounselMapper.insertCounselDocument(id, text);
	}
	
	public List<Map<String, Object>> getCounselReservationList(int student_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<OfflineReservationDto> reservationList = offlineCounselMapper.selectCounselReservationList(student_pk);
		
		for(OfflineReservationDto offlineReservationDto : reservationList) {
			
			int counselorPk = offlineReservationDto.getCounselor_id();
			CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfo(counselorPk);
			
			int categoryPk = offlineReservationDto.getType_category_id();
			TypeCategoryDto typeCategoryDto = offlineCounselMapper.selectTypeCategoryDtoById(categoryPk);
			
			OfflineSurveyDto offlineSurveyDto = offlineCounselMapper.selectOfflineSurveryInfo(offlineReservationDto.getId());
			
			Map<String, Object> map = new HashMap<>();
			map.put("offlineReservationDto", offlineReservationDto);
			map.put("counselorDto", counselorDto);
			map.put("typeCategoryDto", typeCategoryDto);
			map.put("offlineSurveyDto", offlineSurveyDto);
			
			list.add(map);
		}
		return list;
		
	}
	
	public void insertOfflineSurveyInfo(OfflineSurveyDto offlineSurveyDto) {
		
		offlineCounselMapper.insertOfflineSurvey(offlineSurveyDto);
	}
	
	public Map<String, Object> getOfflineSurveyPageInfo(int reservation_id){
		
		OfflineReservationDto offlineReservationDto = offlineCounselMapper.selectOfflineReservationCompletedInfo(reservation_id);
		
		int categoryPk = offlineReservationDto.getType_category_id();
		TypeCategoryDto typeCategoryDto = offlineCounselMapper.selectTypeCategoryDtoById(categoryPk);
		
		int counselorPk = offlineReservationDto.getCounselor_id();
		CounselorDto counselorDto = offlineCounselMapper.selectCounselorInfo(counselorPk);
		
		OfflineSurveyDto offlineSurveyDto = offlineCounselMapper.selectOfflineSurveryInfo(offlineReservationDto.getId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("offlineReservationDto", offlineReservationDto);
		map.put("typeCategoryDto", typeCategoryDto);
		map.put("counselorDto", counselorDto);
		map.put("offlineSurveyDto", offlineSurveyDto);
		
		return map;
		
	}
	
	
	
}
