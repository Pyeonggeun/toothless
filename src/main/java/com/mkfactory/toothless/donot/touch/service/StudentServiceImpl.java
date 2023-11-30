package com.mkfactory.toothless.donot.touch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class StudentServiceImpl {
	@Autowired
	private StudentSqlMapper studentSqlMapper;
	
	
	public StudentInfoDto loginByStudentIdAndPassword(StudentInfoDto studentInfoDto){
		
		return studentSqlMapper.selectStudentByIdAndPassword(studentInfoDto);
		
	}
}
