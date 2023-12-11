package com.mkfactory.toothless.c.eunbi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.eunbi.mapper.EunbiExternalSqlMapper;

@Service
public class EunbiExternalServiceImpl {

	@Autowired
	private EunbiExternalSqlMapper externalSqlMapper;
	
	// 기업의 실습생 평가
	public void insertCompanyEvaluation(AjdksCompanyEvaluationDto companyEvaluationDto) {
		externalSqlMapper.insertCompanyEvaluation(companyEvaluationDto);
	}
	
	
	
}
