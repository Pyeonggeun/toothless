package com.mkfactory.toothless.donot.touch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.NotificationDto;
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
	public List<NotificationDto> reloadMyNotifyList(int student_pk){
		
		List<NotificationDto> NewNotifyList= studentSqlMapper.reloadMyNotification(student_pk);
		
		return NewNotifyList;
		
	}
	public int reloadMyNotifyCount(int student_pk) {
		return studentSqlMapper.selectMyNotifyCount(student_pk);
	}
	
}
