package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.mapper.GroupCounselStaffSqlMapper;

@Service
public class GroupCounselStudentServiceImpl {
	
	@Autowired
	GroupCounselStaffSqlMapper groupCounselStaffMapper;
	
	
	//집단상담 리스트 가져오기
	public List<GroupCounselDto> readGroupCounselList() {
		 
		return groupCounselStaffMapper.selectGroupCounselList();
	}

	
	public GroupCounselDto readGroupCounselDetail(int id) {
		
		return groupCounselStaffMapper.selectGroupCounselById(id);
	}
	
	
}
