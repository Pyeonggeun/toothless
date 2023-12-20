package com.mkfactory.toothless.c.woojae.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.woojae.mapper.WoojaeStaffSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;


@Service
public class WoojaeStaffServiceImpl {
	
	@Autowired
	private WoojaeStaffSqlMapper woojaeStaffSqlMapper;
	
	// 업종 카테고리 리스트
	public List<AjdksCompanyCategoryDto> companyCategoryList(){
		
		List<AjdksCompanyCategoryDto> companyCategoryList = woojaeStaffSqlMapper.selectCompanyCategoryList();
		
		return companyCategoryList;
	}
	
	// 산업체 등록
	public void registerCompanyInfo(AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		// 외부사용자 Pk
		int externalPk = woojaeStaffSqlMapper.createExternalPk();
		ajdksCompanyInfoDto.setExternal_pk(externalPk); // 산업체 등록할 때, 외부사용자pk 외래키 지정
		externalInfoDto.setExternal_pk(externalPk); // 외부사용자 pk지정
		
		// 산업체 등록
		woojaeStaffSqlMapper.insertCompanyInfo(ajdksCompanyInfoDto);
		// 외부사용자 등록
		woojaeStaffSqlMapper.insertExternalInfo(externalInfoDto);
	}
	
	// 등록된 산업체 리스트
	public List<Map<String, Object>> registedCompanyList(){
		
		List<Map<String, Object>> registedCompanyList = new ArrayList<Map<String,Object>>();
		
		List<AjdksCompanyInfoDto> list = woojaeStaffSqlMapper.selectRegisteredCompanyList();
		
		for(AjdksCompanyInfoDto ajdksCompanyInfoDto : list) {
			
			int companyCategoryPk = ajdksCompanyInfoDto.getCompany_category_pk();
			AjdksCompanyCategoryDto ajdksCompanyCategoryDto = woojaeStaffSqlMapper.selectBycompany_category_pk(companyCategoryPk);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("ajdksCompanyCategoryDto", ajdksCompanyCategoryDto);
			map.put("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
			registedCompanyList.add(map);
		}
		
		return registedCompanyList;
	}
	
	// 카테고리별 산업체 리스트
	public List<Map<String, Object>> getCompanyListByCategoryPk(int company_category_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<AjdksCompanyInfoDto> CompanyListByCategoryPk = 
				woojaeStaffSqlMapper.selectCompanyListByCategoryPk(company_category_pk);
		
		for(AjdksCompanyInfoDto ajdksCompanyInfoDto : CompanyListByCategoryPk) {
			
			AjdksCompanyCategoryDto ajdksCompanyCategoryDto = woojaeStaffSqlMapper.selectBycompany_category_pk(company_category_pk);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("ajdksCompanyCategoryDto", ajdksCompanyCategoryDto);
			map.put("ajdksCompanyInfoDto", ajdksCompanyInfoDto);
			list.add(map);
		}
		
		return list;
	}
	
	// 사업자등록번호 확인
	public boolean existCompanyId(String company_id) {
		
		return woojaeStaffSqlMapper.countByCompanyId(company_id) > 0 ? true : false;
	}
	
	// 산업체 아이디 확인
	public boolean existByExternalId(String external_id) {
		
		return woojaeStaffSqlMapper.countByExternalId(external_id) > 0 ? true : false;
	}
	
	
	// 산업체 카테고리 검색
	public List<Map<String, Object>> categorizedCompanyList(int[] searchType, String searchWord){
		
		
		return woojaeStaffSqlMapper.joinedCompanyList(searchType, searchWord);
	}
	
	// 현장실습과정 조회
	public List<AjdksInternshipCourseDto> internshipCourseList(){
		
		return woojaeStaffSqlMapper.selectAllCourse();
	}
	
	
	//실습생 조회
	public List<Map<String, Object>> internList(int internship_course_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<AjdksStudentInternDto> studentInternList = woojaeStaffSqlMapper.selectByCoursePk(internship_course_pk);
		
		for(AjdksStudentInternDto ajdksStudentInternDto : studentInternList) {
			
			int studentPk = ajdksStudentInternDto.getStudent_pk();
			StudentInfoDto studentInfoDto = woojaeStaffSqlMapper.selectByStudentPk(studentPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("ajdksStudentInternDto", ajdksStudentInternDto);
			map.put("studentInfoDto", studentInfoDto);
			
			list.add(map);
		}
		return list;
	}
	
}
