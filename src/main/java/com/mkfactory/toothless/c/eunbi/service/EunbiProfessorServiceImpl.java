package com.mkfactory.toothless.c.eunbi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiExternalSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiProfessorSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.ExternalSqlMapper;

@Service
public class EunbiProfessorServiceImpl {

	@Autowired
	private EunbiProfessorSqlMapper professorSqlMapper;
	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	@Autowired
	private EunbiExternalSqlMapper externalSqlMapper;
	
	// 담당 학생 리스트, 학생의 현장실습과정 신청상태 조회
	public List<Map<String, Object>> viewStudentsWithApplyingStatus(int professorPk) {
		
		List<Map<String, Object>> studentsInfoList = new ArrayList<>();
		
		List<StudentInfoDto> studentList = professorSqlMapper.getChargedStudent(professorPk);
		
		for(StudentInfoDto studenInfoDto : studentList) {
			
			int studentPk = studenInfoDto.getStudent_pk();
			int departmentPk = studenInfoDto.getDepartment_pk();
			
			Map<String, Object> studentsInfo = new HashMap<>();
			
			if(studentSqlMapper.getLatestStudentApplyingPk(studentPk) != null) {
				studentsInfo.put("studentApplyingPk", studentSqlMapper.getLatestStudentApplyingPk(studentPk));
				studentsInfo.put("latestStudentApplyingDto"
								, studentSqlMapper.getLatestStudentApplyingDto(studentSqlMapper.getLatestStudentApplyingPk(studentPk)));
			}else if(studentSqlMapper.getLatestStudentApplyingPk(studentPk) == null) {
				studentsInfo.put("studentApplyingPk", 0);
			}
			
			studentsInfo.put("studenInfoDto", studenInfoDto);
			studentsInfo.put("departmentDto", studentSqlMapper.getDepartmentByDepartmentPk(departmentPk));
			studentsInfo.put("selectSemester", studentSqlMapper.forSelectSemester());
			studentsInfo.put("selectDepartment", studentSqlMapper.forSelectDepartment());
			studentsInfo.put("getStudentInternHistory", studentSqlMapper.getStudentInternHistory(studentPk));
			
			studentsInfoList.add(studentsInfo);
		}
		
		return studentsInfoList;
	}
	
	// 학생 검색 필터
	public Map<String, Object> studentSearchFilter(){
		
		Map<String, Object> studentSearchFilters = new HashMap<>();
		
		studentSearchFilters.put("selectSemester", studentSqlMapper.forSelectSemester());
		studentSearchFilters.put("selectDepartment", studentSqlMapper.forSelectDepartment());
		
		return studentSearchFilters;
	}
	
	// 학생 상세정보
//	public Map<String, Object> viewStudentDetails(int studentPk) {
//		
//		List<AjdksCertificationDto> certificationList = studentSqlMapper.getCertifications(studentPk);
//		
//		studentsInfo.put("selfIntroductionDto", studentSqlMapper.getSelfIntroduction(studentPk));
//		studentsInfo.put("certificationList", certificationList);
//		
//	}
	
	// 교수 담당 현장실습 출력
	public List<Map<String, Object>> viewChargedInternshipCourse(int professorPk) {
		
		List<Map<String, Object>> chargedInternshipInfo = new ArrayList<>();
		
		List<AjdksInternshipCourseDto> chargedInternshipCourseList = professorSqlMapper.getChargedInternshipCourse(professorPk);
		
		for(AjdksInternshipCourseDto internshipCourseDto : chargedInternshipCourseList) {
			int internshipCoursePk = internshipCourseDto.getInternship_course_pk();
			int companyPk = internshipCourseDto.getCompany_pk();
			
			Map<String, Object> chargedInternship = new HashMap<>();

			chargedInternship.put("internshipCourseDto", internshipCourseDto);
			chargedInternship.put("countInternBycoursePk", studentSqlMapper.countInternBycoursePk(internshipCoursePk));
			chargedInternship.put("conpanyInfoDto", externalSqlMapper.getCompanyInfo(companyPk));
		
			
			chargedInternshipInfo.add(chargedInternship);
		}
		
		return chargedInternshipInfo;
	}
	
	
	
	
	
	
	
	
}
