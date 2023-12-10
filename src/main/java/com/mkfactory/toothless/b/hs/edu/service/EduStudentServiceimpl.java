package com.mkfactory.toothless.b.hs.edu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.hs.edu.mapper.EduStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class EduStudentServiceimpl {
	
	@Autowired
	EduStudentSqlMapper eduStudentSqlMapper;
	
	//프로그램 신청
	public void eduApply(EduApplyDto eduApplyDto) {
		
		eduStudentSqlMapper.apply(eduApplyDto);
	}
	
		
	
	
	
	
	
	
	
	
	
}
