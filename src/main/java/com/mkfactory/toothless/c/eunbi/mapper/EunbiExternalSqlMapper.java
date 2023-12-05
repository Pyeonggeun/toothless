package com.mkfactory.toothless.c.eunbi.mapper;

import com.mkfactory.toothless.c.dto.AjdksCompanyEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;

public interface EunbiExternalSqlMapper {

	public void insertCompanyEvaluation(AjdksCompanyEvaluationDto ajdksCompanyEvaluationDto);
	
	public AjdksCompanyInfoDto getCompanyInfo(int company_pk);
}
