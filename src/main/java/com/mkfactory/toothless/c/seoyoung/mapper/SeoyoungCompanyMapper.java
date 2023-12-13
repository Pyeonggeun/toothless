package com.mkfactory.toothless.c.seoyoung.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;

public interface SeoyoungCompanyMapper {

	////해당 산업체 목록 전체 리스트
	public List<Map<String, Object>> selectCompanyList(int sessionCompanyInfo);
	
	//산업체의 진행중인지 모집중인지 확인
	public String companyIngTF(int sessionCompanyInfo);

	//신청 학생 정보 확인
	public List<Map<String, Object>> selectionStudent(int internship_course_pk);

	public List<AjdksInternshipCourseDto> studentinternshipDto();

	public List<Map<String, Object>> selectionGrade(int internship_course_pk);

	public List<Map<String, Object>> selectCertificationProcess(int id);

	public void updateSelectionStudent(AjdksStudentApplyingDto ajdksStudentApplyingDto);

}
