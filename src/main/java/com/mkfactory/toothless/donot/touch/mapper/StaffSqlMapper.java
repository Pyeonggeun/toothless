package com.mkfactory.toothless.donot.touch.mapper;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface StaffSqlMapper {
	
	public StaffInfoDto selectStaffByIdAndPassword(StaffInfoDto staffInfoDto);
}
