package com.mkfactory.toothless.e.registercounselor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.HtmlUtils;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.LicenseImageDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.registercounselor.mapper.RegisterCounselorSqlMapper;

@Service
public class RegisterCounselorServiceImpl {
	
	@Autowired
	RegisterCounselorSqlMapper registerCounselorSqlMapper;
	
	// AJAX - 상담원 신규등록시 ID중복확인
	public boolean checkDuplicationID(String inputId) {
		
		int resultValue = registerCounselorSqlMapper.checkDuplicationExternalId(inputId);
		
		if(resultValue == 0) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	// 상담원 등록
	public void registerCounselor(
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			int[] counselorTypeList,
			List<LicenseImageDto> licenseImageList
			) {
		System.out.println("[ RegisterCounselorServiceImpl] => [ registerCounselor ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		int externalPk = registerCounselorSqlMapper.createExternalPk();
		externalInfoDto.setExternal_pk(externalPk);
		registerCounselorSqlMapper.insertExternalInfo(externalInfoDto);		
		
		int counselorPk = registerCounselorSqlMapper.createCounselorPk();
		counselorDto.setId(counselorPk);
		counselorDto.setExternal_pk(externalPk);		
		registerCounselorSqlMapper.insertCounselor(counselorDto);
		
		for(int type_category_id : counselorTypeList) {
			CounselorTypeDto counselorTypeDto = new CounselorTypeDto();
			counselorTypeDto.setType_category_id(type_category_id);
			counselorTypeDto.setCounselor_id(counselorPk);
			registerCounselorSqlMapper.insertCounselorType(counselorTypeDto);
		}
		
		if(licenseImageList != null) {
			for(LicenseImageDto licenseImageDto : licenseImageList) {				
				licenseImageDto.setCounselor_id(counselorPk);
				registerCounselorSqlMapper.insertLicenseImage(licenseImageDto);
			}
		}
		
		
	}
	
	// 상담 카테고리 리스팅
	public List<TypeCategoryDto> getAllTypeCategoryList(){		
		System.out.println("[ RegisterCounselorServiceImpl] => [ getAllTypeCategoryList ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<TypeCategoryDto> typeCategoryList = registerCounselorSqlMapper.selectAllTypeCategory();
		return typeCategoryList;
	}
	
	// 상담원 전체 리스팅(카테고리 포함)
	public List<Map<String, Object>> getAllCounselorList() {
		System.out.println("[ RegisterCounselorServiceImpl] => [ getAllCounselorList ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorList = registerCounselorSqlMapper.selectAllCounselor();
		return counselorList;
		
	}
	
	// 상담원 전체 중복제거 리스팅 for AJAX
	public List<Map<String, Object>> getCounselorListForAJAX(
			String searchCounselorName ,
			int[] searchCounselorType ,
			String searchGenderOption ,
			String searchScoreOption){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorListForAJAX ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		System.out.println("searchCounselorName : " + searchCounselorName);		
		System.out.println("searchGenderOption : " + searchGenderOption);
		System.out.println("searchScoreOption : " + searchScoreOption);		
		
		if(
			(searchCounselorName.equals("default"))&&
			(searchCounselorType == null)&&
			(searchGenderOption.equals("default"))&&
			(searchScoreOption.equals("default"))) {			
			Boolean searchOption = false;
			System.out.println("searchOption : " + searchOption);
			return registerCounselorSqlMapper.selectAllCounselorForAJAX(
					searchCounselorName,searchCounselorType,searchGenderOption,searchScoreOption,searchOption
					);
		}
		else {
			Boolean searchOption = true;
			System.out.println("searchOption : " + searchOption);
			return registerCounselorSqlMapper.selectAllCounselorForAJAX(
					searchCounselorName,searchCounselorType,searchGenderOption,searchScoreOption,searchOption
					);
		}
		
		
	}
	
	// 상담원PK로 상담원정보 조회
	public CounselorDto getCounselorInfo(int id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorInfo ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		CounselorDto counselorDto = registerCounselorSqlMapper.selectCounselorDetailByCounselorId(id);
		
		
		String career = StringEscapeUtils.escapeHtml4(counselorDto.getCareer());
		career = career.replaceAll("\n", "<br>");		
		
		counselorDto.setCareer(career);
		
		
		return counselorDto;
	}
	
	// 상담원PK로 상담원담당카테고리 조회
	public List<Map<String, Object>> getCounselorTypeByCounselorId(int id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorTypeByCounselorId ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorTypeList = registerCounselorSqlMapper.selectCounselorTypeByCounselorId(id);
		
		return counselorTypeList;
	}
	
	// 상담원PK로 상담원자격증정보 조회
	public List<LicenseImageDto> getLicenseImgByCounselorId(int counselor_id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getLicenseImgByCounselorId ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<LicenseImageDto> licenseList = registerCounselorSqlMapper.selectLicenseImgByCounselorId(counselor_id);
		
		return licenseList;
	}
	
	// 상담원PK로 상담원 평점 조회(현재는 오프라인만, 추후에 추가해서 맵에 추가할것, 전체평점도 추가할것)
	public Map<String, Map<String, Object>> getSurveyScore(int counselor_id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getSurveyScore ] 실행됨");
		System.out.println("---------------------------------------------------------");		
		
		Map<String, Map<String, Object>> surveyScore = new HashMap<String, Map<String,Object>>();
		
		Map<String, Object> offlineSurveyScore = 
				registerCounselorSqlMapper.selectOfflineSurveyScoreByCounselorId(counselor_id);
		
		surveyScore.put("offlineSurveyScore", offlineSurveyScore);
		
		
		return surveyScore;
	}
	
	// 상담원PK로 상담분류별 상담완료 리스트 조회(현재는 오프라인만)
	public Map<String, List<Map<String, Object>>> getCompleteCounselList(int counselor_id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCompleteCounselList ] 실행됨");
		System.out.println("---------------------------------------------------------");	
		
		Map<String, List<Map<String, Object>>> completeCounselList = new HashMap<String, List<Map<String,Object>>>();
		
		List<Map<String, Object>> offlineList = registerCounselorSqlMapper.selectCompleteOfflineCounselListByCounselorId(counselor_id);
		
		completeCounselList.put("offlineList", offlineList);
		
		
		return completeCounselList;
	}
	
	// 상담원PK로 상담평점 조회(현재는 오프라인만)
	public Map<String, Object> getCounselorScoreAvg(int counselor_id){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorScoreAvg ] 실행됨");
		System.out.println("---------------------------------------------------------");	
		
		Map<String, Object> scoreAvg = new HashMap<String, Object>();
		
		Double offlineScoreAvg = (Double)registerCounselorSqlMapper.selectOfflineCounselScoreAvg(counselor_id);
		
		scoreAvg.put("offlineScoreAvg", offlineScoreAvg);
		
		return scoreAvg;
	}
	
	public Map<String, Object> getCounselorDetailForAJAX(int counselorId){
		System.out.println("[ RegisterCounselorServiceImpl] => [ getCounselorDetailForAJAX ] 실행됨");
		System.out.println("---------------------------------------------------------");
		Map<String, Object> counselorDetailForAJAX = new HashMap<String, Object>();
		
		CounselorDto counselorDto = registerCounselorSqlMapper.selectCounselorDetailByCounselorId(counselorId);
		List<Map<String, Object>> counselorTypeList =  registerCounselorSqlMapper.selectCounselorTypeByCounselorId(counselorId);
		List<LicenseImageDto> counselorLicenseList = registerCounselorSqlMapper.selectLicenseImgByCounselorId(counselorId);		
		List<Map<String, Object>> counselList =  registerCounselorSqlMapper.selectCompleteCounselListByCounselorId(counselorId);
		Map<String, Object> totalScoreInfo = registerCounselorSqlMapper.selectTotalScoreInfoByCounselorId(counselorId);
		
		
		counselorDetailForAJAX.put("counselorDto", counselorDto);
		counselorDetailForAJAX.put("counselorTypeList", counselorTypeList);
		counselorDetailForAJAX.put("counselorLicenseList", counselorLicenseList);		
		counselorDetailForAJAX.put("counselList", counselList);
		counselorDetailForAJAX.put("totalScoreInfo", totalScoreInfo);
		
		
		return counselorDetailForAJAX;
	}
	
	// counselCenterStaffMainPage 용
	// 전체상담원 상담형태별 상담완료리스팅
	public List<Map<String, Object>> getAllCompleteCounselList(){		
		return registerCounselorSqlMapper.selectAllCompleteCounselList();
	}
	
	// 상담형태별 완료된 상담내역 카운팅
	public Map<String, Object> getAllTypeCompleteCounselCountValue(){
		return registerCounselorSqlMapper.selectAllTypeCompleteCounselCountValue();
	}
	
	// 집단상담 리스팅
	public List<Map<String, Object>> getGroupCounselList(){
		return registerCounselorSqlMapper.selectGroupCounselBoardForStaffMain();
	}
	
	// 공지사항 리스팅
	public List<Map<String, Object>> getNoticeListForStaffMain(){
		return registerCounselorSqlMapper.selectNoticeBoardForStaffMain();
	}
	
	// 학생 자유게시판 리스팅
	public List<Map<String, Object>> getFreeboardForStaffMain(){
		return registerCounselorSqlMapper.selectFreeboardForStaffMain();
	}
}
