package com.mkfactory.toothless.e.registercounselor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	public List<Map<String, Object>> getCounselorListForAJAX(){
		return registerCounselorSqlMapper.selectAllCounselorForAJAX();
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
}
