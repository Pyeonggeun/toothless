package com.mkfactory.toothless.donot.touch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StaffSqlMapper;

@Service
public class StaffServiceImpl {
	@Autowired
	private StaffSqlMapper staffSqlMapper;
	
	
	public StaffInfoDto loginByStaffIdAndPassword(StaffInfoDto staffInfoDto){
		
		return staffSqlMapper.selectStaffByIdAndPassword(staffInfoDto);
		
	}
}
