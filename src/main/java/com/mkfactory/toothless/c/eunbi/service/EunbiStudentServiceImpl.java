package com.mkfactory.toothless.c.eunbi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiProfessorSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class EunbiStudentServiceImpl {

	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	
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
	
	
	
	
	
}
