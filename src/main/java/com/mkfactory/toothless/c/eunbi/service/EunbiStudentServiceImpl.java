package com.mkfactory.toothless.c.eunbi.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyTimecardDto;
import com.mkfactory.toothless.c.dto.AjdksInternReportDto;
import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiExternalSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiProfessorSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class EunbiStudentServiceImpl {

	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	@Autowired
	private EunbiExternalSqlMapper externalSqlMapper;
	@Autowired
	private EunbiProfessorSqlMapper professorSqlMapper; 
	
	// 학생 만족도 평가
	public void insertInternSatisfaction(AjdksInternSatisfactionDto internSatisfactionDto) {
		studentSqlMapper.insertInternSatisfaction(internSatisfactionDto);
	}
	
	// 학생 상세 출력
	public Map<String, Object> viewStudentDetail(int studentPk) {
		
		Map<String, Object> studentInfo = new HashMap<>();
		
		StudentInfoDto studentInfoDto = studentSqlMapper.getStudentInfoByStudentPk(studentPk);
		int departmentPk = studentInfoDto.getDepartment_pk();
		
		if (studentSqlMapper.getSelfIntroductionByStudentPk(studentPk) != null) {
			
			AjdksSelfIntroductionDto selfIntroductionDto = studentSqlMapper.getSelfIntroductionByStudentPk(studentPk);
			int selfIntroductionImgPk = selfIntroductionDto.getSelf_introduction_img_pk();
			
			studentInfo.put("selfIntroductionImg", studentSqlMapper.getIntroductionImg(selfIntroductionImgPk));
		}
		
		studentInfo.put("studentInfoDto", studentInfoDto);
		studentInfo.put("studentDepartment", studentSqlMapper.getDepartmentByDepartmentPk(departmentPk));
		studentInfo.put("countSemester", studentSqlMapper.countSemester(studentPk));
		
		return studentInfo;
	}
	
	public Map<String, Object> viewSelfIntroduction(int studentPk) {
		
		Map<String, Object> selfIntroduction = new HashMap<>();
		
		if(studentSqlMapper.getSelfIntroductionByStudentPk(studentPk) != null) {
			
			AjdksSelfIntroductionDto selfIntroductionDto = studentSqlMapper.getSelfIntroductionByStudentPk(studentPk);
			
			selfIntroduction.put("selfIntroduction", selfIntroductionDto);
			selfIntroduction.put("certificationList", studentSqlMapper.getCertificationsByStudentPk(studentPk));
		}
		
		return selfIntroduction;
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
			
			// 교수의 평가 했는지
			internInfo.put("didProfessorEvaluateIntern", professorSqlMapper.didProfessorEvaluateIntern(internPk));
			// 산업체 평가 했는지
			internInfo.put("didCompanyEvaluateIntern", externalSqlMapper.didCompanyEvaluateIntern(internPk));
			
			
			studentInternList.add(internInfo);
		}
		
		return studentInternList;
	}
	
	// 학생이 참여 완료한 현장실습 성적 조회하기
	public List<Map<String, Object>> viewEvaluations(int studentPk){
		
		List<Map<String, Object>> internshipList = new ArrayList<>();
			
		List<AjdksInternshipCourseDto> endInternshipCourses = studentSqlMapper.getEndInternshipCourseByStudentPk(studentPk);
		
		for(AjdksInternshipCourseDto internshipCourseDto : endInternshipCourses) {
			int companyPk = internshipCourseDto.getCompany_pk();
			int professorPk = internshipCourseDto.getProfessor_pk();
			
			int internshipCoursePk = internshipCourseDto.getInternship_course_pk();
			int studentInternPk = studentSqlMapper.getInternPkByStudentPkAndCoursePk(studentPk, internshipCoursePk);
			
			Map<String, Object> endedCourse = new HashMap<>();
			
			endedCourse.put("internshipCourseDto", internshipCourseDto);
			endedCourse.put("companyInfoDto", externalSqlMapper.getCompanyInfo(companyPk));
			endedCourse.put("professorDto", professorSqlMapper.getProfessorInfo(professorPk));
			
			endedCourse.put("didSatisfaction", studentSqlMapper.didSatisfaction(studentInternPk));
			endedCourse.put("studentInternPk", studentInternPk);
			System.out.println("인턴" + studentInternPk);
			
			if(studentSqlMapper.calculateGrade(studentInternPk) == null) {
				endedCourse.put("grade", "0");
			}else {
				endedCourse.put("grade", studentSqlMapper.calculateGrade(studentInternPk));
			}
			
			internshipList.add(endedCourse);
		}
		
		return internshipList;
	}
	
	public Map<String, Object> getEvaluation(int studentInternPk) {
		
		Map<String, Object> evaluations = new HashMap<>();
		
		evaluations.put("professorEvaluation", studentSqlMapper.getProfessorEvaluation(studentInternPk));
		evaluations.put("companyEvaluation", studentSqlMapper.getCompanyEvaluation(studentInternPk));
		evaluations.put("didProfessorEvaluateIntern", professorSqlMapper.didProfessorEvaluateIntern(studentInternPk));
		
		return evaluations;
	}
	
	// 기업 업무일지
	public List<Map<String, Object>> viewTimeCard(int studentInternPk) {
		
		List<Map<String, Object>> reportList = new ArrayList<Map<String,Object>>();
		
		List<AjdksCompanyTimecardDto> timecardList = studentSqlMapper.getCompanyTimecard(studentInternPk);
		
		for(AjdksCompanyTimecardDto timecard : timecardList) {
			int timecardCategoryPk = timecard.getTimecard_category_pk();
			
			Map<String, Object> report = new HashMap<>();
			
			report.put("timecard", timecard);
			report.put("timecardCategory", studentSqlMapper.getCompanyTimecardCategory(timecardCategoryPk));
			
			reportList.add(report);
		}
		
		return reportList;
	}
	
	public List<AjdksInternReportDto> getInternReport(int studentInternPk) {
		
		List<AjdksInternReportDto> internReport = studentSqlMapper.getInternReport(studentInternPk);
		
		return internReport;
		
	}
	
	
	
	public Map<String, Object> countTimecard(int studentInternPk) {
		
		Map<String, Object> countTimecard = new HashMap<>();
		
		countTimecard.put("countAttendance", studentSqlMapper.countAttendance(studentInternPk));
		countTimecard.put("countLate", studentSqlMapper.countLate(studentInternPk));
		countTimecard.put("countEarlyleave", studentSqlMapper.countEarlyleave(studentInternPk));
		countTimecard.put("countAbsent", studentSqlMapper.countAbsent(studentInternPk));
		
		return countTimecard;
	}
	
	
	
	
	
	
	
	
	
}
