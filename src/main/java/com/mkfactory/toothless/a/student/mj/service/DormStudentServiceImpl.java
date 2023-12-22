package com.mkfactory.toothless.a.student.mj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.student.dm.mapper.DormStudentSqlMapperDm;
import com.mkfactory.toothless.a.student.mj.mapper.DormStudnetSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class DormStudentServiceImpl {

	@Autowired
	private DormStudnetSqlMapper studentSqlMapper;
	
	@Autowired
	private StudentSqlMapper commonStudentSqlMapper;

	// 입주공고 페이지로
	public Map<String, Object> thisSemesterJoinDormInfo(Boolean escape) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		SemesterDto thisSemesterDto = studentSqlMapper.thisSemesterByY();
		int semester_pk = thisSemesterDto.getSemester_pk();
		
		JoinDormInfoDto joinDormInfoDto = studentSqlMapper.joinDormInfoBySemesterPk(semester_pk);
		
		if(escape) {
			// html escape
			String content = joinDormInfoDto.getDetail_expln();
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			
			joinDormInfoDto.setDetail_expln(content);
		}
		
		
		int joinDormInfoPk = joinDormInfoDto.getDorm_info_pk();
		
		map.put("thisSemesterDto", thisSemesterDto);
		map.put("joinDormInfoDto", joinDormInfoDto);
		map.put("joinDormInfoPk", joinDormInfoPk);
		

		return map;
	}
	
	// 학생 pk로 특정학생/학과 정보 가져오기
	public Map<String, Object> getStudentInfo(int student_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		StudentInfoDto studentInfo = studentSqlMapper.selectStudentInfoByStudentPk(student_pk);
		DepartmentCategoryDto departmentInfo = studentSqlMapper.selectDeparmentInfoByPk(studentInfo.getDepartment_pk());
		int studentYear = commonStudentSqlMapper.selectStudentYear(student_pk);
		
		map.put("studentInfo", studentInfo);
		map.put("departmentInfo", departmentInfo);
		map.put("studentYear", studentYear);
		
		return map;
	}
	
	// 입주신청 과정
	public void applyDormByStudentInfo(JoinDormApplicationDto joinDormApplicationDto) {
		
		studentSqlMapper.insertStudentInfo(joinDormApplicationDto);
	}
	
	// 학생 pk로 진행중인 학기의 입주신청 여부/정보 가져오기
	public JoinDormApplicationDto getIsApplyThisSemesterInfo(int student_pk) {
		return studentSqlMapper.selectIsApplyThisSemesterInfo(student_pk);
	}

	
}
