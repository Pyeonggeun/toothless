package com.mkfactory.toothless.c.eunbi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiExternalSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;

@Service
public class EunbiExternalServiceImpl {

	@Autowired
	private EunbiExternalSqlMapper externalSqlMapper;
	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	
	// 산업체Pk 가져오기
	public int getCompanyPk(int externalPk) {
		return externalSqlMapper.getCompanyPk(externalPk);
	}
	
	// 기업의 실습생 평가
	public void insertCompanyEvaluation(AjdksCompanyEvaluationDto companyEvaluationDto) {
		externalSqlMapper.insertCompanyEvaluation(companyEvaluationDto);
	}
	
	// 산업체 평가가 필요한 과정
	public List<Map<String, Object>> getNeedEvaluationCourse(int companyPk){
		
		List<Map<String, Object>> endInternshipCourseList = new ArrayList<>();
		
		List<AjdksInternshipCourseDto> internshipCourseList = externalSqlMapper.getEndInternshipCourse(companyPk);

		for(AjdksInternshipCourseDto internshipCourseDto : internshipCourseList) {
			
			Map<String, Object> endInternshipCourseInfo = new HashMap<>();
			
			int internshipCoursePk = internshipCourseDto.getInternship_course_pk();
			
			if(externalSqlMapper.countCompanyEvaluationToIntern(internshipCoursePk) < studentSqlMapper.countInternBycoursePk(internshipCoursePk)) {
				endInternshipCourseInfo.put("internshipCourseDto", internshipCourseDto);
				endInternshipCourseInfo.put("countInternBycoursePk", studentSqlMapper.countInternBycoursePk(internshipCoursePk));
			}

			endInternshipCourseList.add(endInternshipCourseInfo);
		}
		
		return endInternshipCourseList;
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
