package com.mkfactory.toothless.a.staff.jw.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.staff.jw.service.DormStaffServiceJw;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/staff/*")
public class RestDormStaffControllerJw {

	@Autowired
	private DormStaffServiceJw dormStaffServiceJw;
	
	@RequestMapping("templete")
	public RestResponseDto templete() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// rest 건물 list
	@RequestMapping("restBuildingList")
	public RestResponseDto restBuildingList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(dormStaffServiceJw.getAllDormBuilding());
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 상/벌점
	@RequestMapping("restRegisterPointCategory")
	public RestResponseDto registerPointCategory(PointCategory params) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStaffServiceJw.registerPointCategory(params);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restGetPointCategoryList")
	public RestResponseDto restGetPointCategoryList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(dormStaffServiceJw.getPointCategory());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restGetPointCategoryPlusList")
	public RestResponseDto restGetPointCategoryPlusList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(dormStaffServiceJw.getPointCategoryPlus());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restGetPointCategoryMinusList")
	public RestResponseDto restGetPointCategoryMinusList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(dormStaffServiceJw.getPointCategoryMinus());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restDeletePointCategory")
	public RestResponseDto restDeletePointCategory(int point_category_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStaffServiceJw.deletePointCategory(point_category_pk);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restUpdatePointCategory")
	public RestResponseDto restUpdatePointCategory(PointCategory params) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStaffServiceJw.updatePointCategory(params);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 금일 외출 현황 Listmap
	@RequestMapping("restGetAllExitSituationList")
	public RestResponseDto restGetAllExitSituationList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> allExitList = dormStaffServiceJw.getAllExitSituation();
		
		restResponseDto.setData(allExitList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// dormPk별 외출 현황 Listmap
	@RequestMapping("restGetExitSituationListByDormPk")
	public RestResponseDto restGetExitSituationListByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkExitList = dormStaffServiceJw.getExitSituationByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkExitList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 금일 점호 불참
	@RequestMapping("restGetAllCallAbsenceList")
	public RestResponseDto restGetAllCallAbsenceList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		List<Map<String, Object>> allCallAbsenceList = dormStaffServiceJw.getAllCallAbsence();
		
		restResponseDto.setData(allCallAbsenceList);
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 호실별 금일 점호 불참
	@RequestMapping("restGetCallAbsenceListByDormPk")
	public RestResponseDto restGetCallAbsenceListByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		List<Map<String, Object>> dormPkCallAbsenceList = dormStaffServiceJw.getCallAbsenceByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkCallAbsenceList);
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 전체 상벌 현황 Listmap
	@RequestMapping("restGetAllPointSituationList")
	public RestResponseDto restGetAllPointSituationList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> allPointList = dormStaffServiceJw.getAllPointScoreList();
		
		restResponseDto.setData(allPointList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 호실별 상벌 현황 Listmap
	@RequestMapping("restGetPointSituationListByDormPk")
	public RestResponseDto restGetPointSituationListByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkPointList = dormStaffServiceJw.getPointScoreListByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkPointList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 임원 배정 페이지 - 사생 현황
	@RequestMapping("restGetAllDormStudent")
	public RestResponseDto restGetAllDormStudent() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> allDormList = dormStaffServiceJw.getAllDormStudentList();
		
		restResponseDto.setData(allDormList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 임원별 호실 배정 - 임원 리스트
	@RequestMapping("restGetAllExecutive")
	public RestResponseDto restGetAllExecutive() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> allExecutiveList = dormStaffServiceJw.getAllExecutiveList();
		
		restResponseDto.setData(allExecutiveList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 호실별 + 임원별 호실 배정 - 임원 리스트
	@RequestMapping("restGetExecutiveByDormPk")
	public RestResponseDto restGetExecutiveByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkExecutiveList = dormStaffServiceJw.getExecutiveListByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkExecutiveList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 임원별 호실 배정 관리 현황
	@RequestMapping("restGetAllExecutiveManagementList")
	public RestResponseDto restGetAllExecutiveeManagementList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> allExecutiveManagementList = dormStaffServiceJw.getAllExecutiveManagementList();
		
		restResponseDto.setData(allExecutiveManagementList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 호실별 + 임원별 호실 배정 관리 현황
	@RequestMapping("restGetExecutiveManagementListByDormPk")
	public RestResponseDto restGetExecutiveeManagementListByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkExecutiveManagementList = dormStaffServiceJw.getExecutiveManagementListByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkExecutiveManagementList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	// 호실별 사생 현황
	@RequestMapping("restGetAllDormStudentByDormPk")
	public RestResponseDto restGetAllDormStudentByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkDormList = dormStaffServiceJw.getAllDormStudentListByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkDormList);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("restRegisterExecutiveProcess")
	public RestResponseDto restRegisterExecutiveProcess(int dorm_student_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStaffServiceJw.registerExecutive(dorm_student_pk);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	@RequestMapping("restdeleteExecutiveProcess")
	public RestResponseDto restdeleteExecutiveProcess(int dorm_student_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStaffServiceJw.deleteExecutive(dorm_student_pk);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 일지
	@RequestMapping("restGetAllDiary")
	public RestResponseDto restGetAllDiary() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> diaryList = dormStaffServiceJw.getAllDiaryList();
		
		restResponseDto.setData(diaryList);
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	@RequestMapping("restGetAllDiaryByDormPk")
	public RestResponseDto restGetAllDiaryByDormPk(int dorm_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<Map<String, Object>> dormPkDiaryList = dormStaffServiceJw.getDiaryListByDormPk(dorm_pk);
		
		restResponseDto.setData(dormPkDiaryList);
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
}
