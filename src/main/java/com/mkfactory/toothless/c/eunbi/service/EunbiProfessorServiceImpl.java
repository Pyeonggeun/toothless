package com.mkfactory.toothless.c.eunbi.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksProfessorEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
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
	
	// 교수 담당 현장실습 출력
	public List<Map<String, Object>> viewChargedInternshipCourse(int professorPk) {
		
		List<Map<String, Object>> chargedInternshipInfo = new ArrayList<>();
		
		List<AjdksInternshipCourseDto> chargedInternshipCourseList = professorSqlMapper.getChargedInternshipCourse(professorPk);
		
		for(AjdksInternshipCourseDto internshipCourseDto : chargedInternshipCourseList) {
			int internshipCoursePk = internshipCourseDto.getInternship_course_pk();
			int companyPk = internshipCourseDto.getCompany_pk();
			
			Map<String, Object> chargedInternship = new HashMap<>();
			
			if(professorSqlMapper.isExistProfessorEvaluation(internshipCoursePk) == null) {
				chargedInternship.put("isExistProfessorEvaluation", 0);
			}else if(professorSqlMapper.isExistProfessorEvaluation(internshipCoursePk) != null) {
				chargedInternship.put("isExistProfessorEvaluation", professorSqlMapper.isExistProfessorEvaluation(internshipCoursePk));
			}

			chargedInternship.put("internshipCourseDto", internshipCourseDto);
			chargedInternship.put("countInternBycoursePk", studentSqlMapper.countInternBycoursePk(internshipCoursePk));
			chargedInternship.put("companyInfoDto", externalSqlMapper.getCompanyInfo(companyPk));
			
			
			chargedInternshipInfo.add(chargedInternship);
		}
		
		return chargedInternshipInfo;
	}
	
	public Map<String, Object> viewInternshipCourseDetail(int internshipCoursePk) {
		
		Map<String, Object> internshipCourseDetail = new HashMap<>();
		
		AjdksInternshipCourseDto internshipCourseDto = externalSqlMapper.getInternshipCourseDetail(internshipCoursePk);
		int companyPk = internshipCourseDto.getCompany_pk();
		int departmentPk = internshipCourseDto.getDepartment_pk();

		internshipCourseDetail.put("internshipCourseDto", internshipCourseDto);
		internshipCourseDetail.put("companyInfoDto", externalSqlMapper.getCompanyInfo(companyPk));
		internshipCourseDetail.put("departmentDto", studentSqlMapper.getDepartmentByDepartmentPk(departmentPk));
		internshipCourseDetail.put("countInternBycoursePk", studentSqlMapper.countInternBycoursePk(internshipCoursePk));
		internshipCourseDetail.put("countStudentIntern", studentSqlMapper.countInternBycoursePk(internshipCoursePk));
		
		return internshipCourseDetail;
	}
	
	// 교수평가 입력
	public void insertProfessorEvaluation(AjdksProfessorEvaluationDto professorEvaluationDto) {
		professorSqlMapper.insertProfessorEvaluation(professorEvaluationDto);
	}
	
	// 학생 성적 조회
	public List<Map<String, Object>> viewInternGrade(int professorPk) {
		
		List<Map<String, Object>> internList = new ArrayList<>();
		
		List<AjdksStudentInternDto> internDtoList = professorSqlMapper.getInternByProfessorPk(professorPk);
		
		for(AjdksStudentInternDto internDto : internDtoList) {
			int internPk = internDto.getStudent_intern_pk();
			int internshipCoursePk = internDto.getInternship_course_pk();
			int studentPk = internDto.getStudent_pk();
			
			Map<String, Object> internGrade = new HashMap<>();

			internGrade.put("internDto", internDto);
			internGrade.put("internshipCourseDto", externalSqlMapper.getInternshipCourseDetail(internshipCoursePk));
			internGrade.put("studentDto", studentSqlMapper.getStudentInfoByStudentPk(studentPk));
			
			internGrade.put("didProfessorEvaluateIntern", professorSqlMapper.didProfessorEvaluateIntern(internPk));
			
			if(studentSqlMapper.calculateGrade(internPk) == null) {
				internGrade.put("grade", "0");
			}else {
				internGrade.put("grade", studentSqlMapper.calculateGrade(internPk));
			}
			
			internList.add(internGrade);
		}
		
		return internList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
