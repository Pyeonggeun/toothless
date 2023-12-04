package com.mkfactory.toothless.e.groupcounsel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.mapper.GroupCounselStaffSqlMapper;

@Service
public class GroupCounselStaffServiceImpl {
	
	@Autowired
	GroupCounselStaffSqlMapper groupCounselStaffMapper;
	
	
	public void groupCounselRegister(GroupCounselDto groupCounselDto) {
		groupCounselStaffMapper.insertGroupCounsel(groupCounselDto);
		
	}
	
	
}
