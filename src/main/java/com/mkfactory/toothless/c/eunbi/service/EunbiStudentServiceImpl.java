package com.mkfactory.toothless.c.eunbi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksInternSatisfactionDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiStudentSqlMapper;

@Service
public class EunbiStudentServiceImpl {

	@Autowired
	private EunbiStudentSqlMapper studentSqlMapper;
	
	// 학생 만족도 평가
	public void insertInternSatisfaction(AjdksInternSatisfactionDto internSatisfactionDto) {
		studentSqlMapper.insertInternSatisfaction(internSatisfactionDto);
	}
	
	
	
	
}
