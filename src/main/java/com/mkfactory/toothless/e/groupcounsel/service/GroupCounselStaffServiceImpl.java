package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.mapper.GroupCounselStaffSqlMapper;

@Service
public class GroupCounselStaffServiceImpl {
	
	@Autowired
	GroupCounselStaffSqlMapper groupCounselStaffMapper;
	
	// 집단상담 등록
	public void groupCounselRegister(GroupCounselDto groupCounselDto) {
		
		groupCounselStaffMapper.insertGroupCounsel(groupCounselDto);
	}
	
	// 집단상담 리스트 가져오기
	public List<GroupCounselDto> readGroupCounselList() {
		
		List<GroupCounselDto> list = groupCounselStaffMapper.selectGroupCounselList();
	
	
		return list;
	}

	// 집단 상담 디테일 가져오기
	public GroupCounselDto readGroupCounselDetail(int id) {
		
		GroupCounselDto groupCounselDto = groupCounselStaffMapper.selectGroupCounselById(id);
		
		return groupCounselDto;
	}
	
	
	
}
