package com.mkfactory.toothless.c.seoyoung.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.seoyoung.mapper.SeoyoungApplyingSqlMapper;


@Service
public class SeoyoungApplyingServicempl {

	@Autowired
	private SeoyoungApplyingSqlMapper seoyoungApplyingSqlMapper;
	
	//모집중인 산업체 상세 리스트
	public List<Map<String, Object>> applyCompanyList() {
		
		return (List<Map<String, Object>>) seoyoungApplyingSqlMapper.selectApplyCompanyList();
	}
	
	//현장실습 신청
	public void register(AjdksStudentApplyingDto ajdksStudentApplyingDto) {
		seoyoungApplyingSqlMapper.insert(ajdksStudentApplyingDto);
	}
	
	
	//현재 진행 상태
	public List<Map<String, Object>> applyNewList(int student_pk) {
		
		return (List<Map<String, Object>>) seoyoungApplyingSqlMapper.selectApplyNewList(student_pk);
	}
	
	//이전 진행 상태
	public List<Map<String, Object>> applyOldList(int student_pk) {
		
		return (List<Map<String, Object>>) seoyoungApplyingSqlMapper.selectApplyOldList(student_pk);
	}
	
		
	//현재 진행 상태
	public String applyTF(int student_pk) {
		return seoyoungApplyingSqlMapper.selectTFApply(student_pk);
	}	
	
	//카테고리 + 산업체
	public List<Map<String, Object>> companyCategori() {
		return (List<Map<String, Object>>) seoyoungApplyingSqlMapper.searchCompanyCategori();
	}
	
}
