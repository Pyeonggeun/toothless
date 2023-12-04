package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.e.dto.GroupCounselDto;

public interface GroupCounselStaffSqlMapper {
	
	// 집단상담 등록
	public void insertGroupCounsel(GroupCounselDto groupCounselDto);
	
	// 등록된 상담 리스트
	public List<GroupCounselDto> selectGroupCounselList();
	
	// pk별 집단 상담
	public GroupCounselDto selectGroupCounselById(int id);
}
