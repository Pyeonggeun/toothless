package com.mkfactory.toothless.donot.touch.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class StudentServiceImpl {
	@Autowired
	private StudentSqlMapper studentSqlMapper;
	
	
	public StudentInfoDto loginByStudentIdAndPassword(StudentInfoDto studentInfoDto){
		
		return studentSqlMapper.selectStudentByIdAndPassword(studentInfoDto);
		
	}
	
	public Map<String, Object> getStudentOtherInfo(StudentInfoDto studentInfoDto) {
		
		Map<String, Object> map = new HashMap<>();
		 System.out.println(studentInfoDto.getStudent_pk());
		String departmentName = studentSqlMapper.selectStudnetDepartmentName(studentInfoDto.getDepartment_pk());
		int studentYear = studentSqlMapper.selectStudentYear(studentInfoDto.getStudent_pk());
		int graduationInfo = studentSqlMapper.selectGraduationInfo(studentInfoDto.getStudent_pk());
		
		map.put("graduationInfo", graduationInfo);
		map.put("departmentName", departmentName);
		map.put("studentYear", studentYear);
		
		
		return map;
	}
	
	public List<Map<String, Object>> getStudentList(){
		List<Map<String, Object>> listMap = new ArrayList<>();
		List<StudentInfoDto> studentInfoDtoList = studentSqlMapper.selectStudnetList();
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			int student_pk = studentInfoDto.getStudent_pk();
			
			int graduationInfo =  studentSqlMapper.selectGraduationInfo(student_pk);
			int studentYear = studentSqlMapper.selectStudentYear(student_pk);
			String departmentName = studentSqlMapper.selectStudnetDepartmentName(studentInfoDto.getDepartment_pk());
			ProfessorInfoDto professorInfoDto = studentSqlMapper.selectMyProfessor(studentInfoDto.getProfessor_pk());
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("graduationInfo", graduationInfo);
			map.put("studentYear", studentYear);
			map.put("departmentName", departmentName);
			map.put("professorInfoDto", professorInfoDto);
			map.put("studentInfoDto", studentInfoDto);
			
			listMap.add(map);
		}
		
		
		return listMap;
	}
}
