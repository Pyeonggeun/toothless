package com.mkfactory.toothless.c.eunbi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiProfessorSqlMapper;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public class EunbiProfessorServiceImpl {

	@Autowired
	private EunbiProfessorSqlMapper professorSqlMapper;
	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	
	// 담당 학생 리스트, 학생의 현장실습과정 신청상태 조회
	public List<Map<String, Object>> viewStudentsWithApplyingStatus(int professorPk) {
		
		List<Map<String, Object>> studentsInfoList = new ArrayList<>();
		
		List<StudentInfoDto> studentList = professorSqlMapper.getChargedStudent(professorPk);
		
		for(StudentInfoDto studenInfoDto : studentList) {
			
			int studentPk = studenInfoDto.getStudent_pk();
			
			List<AjdksCertificationDto> certificationList = studentSqlMapper.getCertifications(studentPk);
			
			Map<String, Object> studentsInfo = new HashMap<>();
			
			studentsInfo.put("studenInfoDto", studenInfoDto);
			studentsInfo.put("studentApplyingDto", studentSqlMapper.getStudentApplying(studentPk));
			studentsInfo.put("selfIntroductionDto", studentSqlMapper.getSelfIntroduction(studentPk));
			studentsInfo.put("certificationList", certificationList);
			
			studentsInfoList.add(studentsInfo);
		}
		
		return studentsInfoList;
	}
	
	
	
	
	
	
	
	
	
	
	
}
