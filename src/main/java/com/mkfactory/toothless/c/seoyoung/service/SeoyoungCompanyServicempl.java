package com.mkfactory.toothless.c.seoyoung.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.seoyoung.mapper.SeoyoungApplyingSqlMapper;
import com.mkfactory.toothless.c.seoyoung.mapper.SeoyoungCompanyMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentSemesterDto;

@Service
public class SeoyoungCompanyServicempl {
	@Autowired
	private SeoyoungCompanyMapper seoyoungCompanyMapper;

	//해당 산업체 목록 전체 리스트
	public List<Map<String, Object>> companyList(int sessionCompanyInfo) {
		return (List<Map<String, Object>>) seoyoungCompanyMapper.selectCompanyList(sessionCompanyInfo);
	}
	
	//산업체의 진행중인지 모집중인지 확인
	public List<Map<String, Object>> companyIngTF(int sessionCompanyInfo) {
		return seoyoungCompanyMapper.companyIngTF(sessionCompanyInfo);
	}	
	
	//신청 학생 정보 확인
	public List<Map<String, Object>> selectionStudent(int internship_course_pk) {
		return seoyoungCompanyMapper.selectionStudent(internship_course_pk);
	}
	
	//자격증정보
	public List<Map<String, Object>> getCertification(int id){
		return seoyoungCompanyMapper.selectCertificationProcess(id); 
	}
	
	//합격 불합격
	public void updateSelectionArticle(AjdksStudentApplyingDto ajdksStudentApplyingDto) {
		seoyoungCompanyMapper.updateSelectionStudent(ajdksStudentApplyingDto);
	}

}
