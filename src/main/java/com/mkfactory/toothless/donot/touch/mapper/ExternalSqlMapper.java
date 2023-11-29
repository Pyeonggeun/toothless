package com.mkfactory.toothless.donot.touch.mapper;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

public interface ExternalSqlMapper {
	
	public ExternalInfoDto selectExternalByIdAndPassword(ExternalInfoDto externalInfoDto);
}
