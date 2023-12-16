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
	
	@RequestMapping("restBuildingList")
	public RestResponseDto restBuildingList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(dormStaffServiceJw.getAllDormBuilding());
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
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
	
	// 전체 외출 현황 Listmap
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
}
