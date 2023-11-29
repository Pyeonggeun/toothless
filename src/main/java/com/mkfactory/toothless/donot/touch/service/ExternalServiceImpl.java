package com.mkfactory.toothless.donot.touch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.ExternalSqlMapper;

@Service
public class ExternalServiceImpl {
	@Autowired
	private ExternalSqlMapper externalSqlMapper;

	public ExternalInfoDto loginByExternalIdAndPassword(ExternalInfoDto externalInfoDto){
		
		return externalSqlMapper.selectExternalByIdAndPassword(externalInfoDto);
		
	}
}
