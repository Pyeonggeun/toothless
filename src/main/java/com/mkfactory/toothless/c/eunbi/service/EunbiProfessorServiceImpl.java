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
	
	// 해당 과정 지원학생 출력
	public List<Map<String, Object>> getApplyingStudentList(int internshipCoursePk) {
		
		List<Map<String, Object>> applyingStudentInfoList = new ArrayList<>();
		
		AjdksInternshipCourseDto internshipCourseDto = externalSqlMapper.getInternshipCourseDetail(internshipCoursePk);
		
		Date now = new Date();
		
		if(now.after(internshipCourseDto.getApplying_start_date()) == true && now.before(internshipCourseDto.getApplying_end_date()) == true ) {
			
			// 신청완료학생
			List<AjdksStudentApplyingDto> studentApplyingList = studentSqlMapper.getApplyingListByCoursePk(internshipCoursePk);
			
			for(AjdksStudentApplyingDto studentApplyingDto : studentApplyingList) {
				int studentPk = studentApplyingDto.getStudent_pk();
				
				StudentInfoDto studentInfoDto = studentSqlMapper.getStudentInfoByStudentPk(studentPk);
				int studentDepartmentPk = studentInfoDto.getDepartment_pk();
				int studentProfessorPk = studentInfoDto.getProfessor_pk();
				
				Map<String, Object> studentInfo = new HashMap<>();
				
				studentInfo.put("studentInfoDto", studentInfoDto);
				studentInfo.put("studentApplyingDto", studentApplyingDto);
				studentInfo.put("studentDepartment", studentSqlMapper.getDepartmentByDepartmentPk(studentDepartmentPk));
				studentInfo.put("studentProfessorInfo", professorSqlMapper.getProfessorInfo(studentProfessorPk));
				studentInfo.put("countSemester", studentSqlMapper.countSemester(studentPk));
				
				applyingStudentInfoList.add(studentInfo);
			}
			
		}else if((now.equals(internshipCourseDto.getAnnouncement_date()) == true || 
				now.after(internshipCourseDto.getAnnouncement_date())) == true && 
				now.before(internshipCourseDto.getInternship_start_date()) == true) {
			
			// 결과발표학생
			List<AjdksStudentApplyingDto> announcedStudentList =
					studentSqlMapper.getAnnouncedStudentListByCoursePk(internshipCoursePk);
			
			for(AjdksStudentApplyingDto studentApplyingDto : announcedStudentList) {
				int studentPk = studentApplyingDto.getStudent_pk();
				
				StudentInfoDto studentInfoDto = studentSqlMapper.getStudentInfoByStudentPk(studentPk);
				int studentDepartmentPk = studentInfoDto.getDepartment_pk();
				int studentProfessorPk = studentInfoDto.getProfessor_pk();
				
				Map<String, Object> studentInfo = new HashMap<>();
				
				studentInfo.put("studentInfoDto", studentInfoDto);
				studentInfo.put("studentApplyingDto", studentApplyingDto);
				studentInfo.put("studentDepartment", studentSqlMapper.getDepartmentByDepartmentPk(studentDepartmentPk));
				studentInfo.put("studentProfessorInfo", professorSqlMapper.getProfessorInfo(studentProfessorPk));
				studentInfo.put("countSemester", studentSqlMapper.countSemester(studentPk));
				
				applyingStudentInfoList.add(studentInfo);
			}
		}
		
		return applyingStudentInfoList;
	}
	
	
	// 해당과정 실습생 출력
	public List<Map<String, Object>> getStudentInternList(int internshipCoursePk) {
			
		List<Map<String, Object>> studentInternList = new ArrayList<>();
		
		List<AjdksStudentInternDto> studentInternDtoList = studentSqlMapper.getStudentInternByCoursePk(internshipCoursePk);
		
		for(AjdksStudentInternDto studentInternDto : studentInternDtoList) {
			int studentPk = studentInternDto.getStudent_pk();
			int internPk = studentInternDto.getStudent_intern_pk();
			
			StudentInfoDto studentInfoDto = studentSqlMapper.getStudentInfoByStudentPk(studentPk);
			int studentDepartmentPk = studentInfoDto.getDepartment_pk();
			int studentProfessorPk = studentInfoDto.getProfessor_pk();
			
			Map<String, Object> internInfo = new HashMap<>();
			
			internInfo.put("studentInfoDto", studentInfoDto);
			internInfo.put("studentInternDto", studentInternDto);
			internInfo.put("studentDepartment", studentSqlMapper.getDepartmentByDepartmentPk(studentDepartmentPk));
			internInfo.put("studentProfessorInfo", professorSqlMapper.getProfessorInfo(studentProfessorPk));
			internInfo.put("internshipCourseDto", externalSqlMapper.getInternshipCourseDetail(internshipCoursePk));
			
			internInfo.put("countAttendance", studentSqlMapper.countAttendance(internPk));
			internInfo.put("countLate", studentSqlMapper.countLate(internPk));
			internInfo.put("countEarlyleave", studentSqlMapper.countEarlyleave(internPk));
			internInfo.put("countAbsent", studentSqlMapper.countAbsent(internPk));
			
			internInfo.put("didEvaluateIntern", professorSqlMapper.didEvaluateIntern(internPk));
			
			studentInternList.add(internInfo);
		}
		
		return studentInternList;
	}
	
	// 교수평가 입력
	public void insertProfessorEvaluation(AjdksProfessorEvaluationDto professorEvaluationDto) {
		professorSqlMapper.insertProfessorEvaluation(professorEvaluationDto);
	}
	
	// 현재 날짜과 현장실습과정 날짜 비교
	public Map<String, Object> isNow(int internshipCoursePk) {
		
		Map<String, Object> isNow = new HashMap<>();
		
		isNow.put("isStartApplying", externalSqlMapper.isStartApplying(internshipCoursePk));
		isNow.put("isEndApplying", externalSqlMapper.isEndApplying(internshipCoursePk));
		isNow.put("didAnnouncement", externalSqlMapper.didAnnouncement(internshipCoursePk));
		isNow.put("isStartInternship", externalSqlMapper.isStartInternship(internshipCoursePk));
		isNow.put("isEndInternship", externalSqlMapper.isEndInternship(internshipCoursePk));
		
		return isNow;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
