package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;
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
	public List<Map<String, Object>> readGroupCounselList() {
		
		List<Map<String, Object>> grouopCounselList = new ArrayList<Map<String,Object>>();
		List<GroupCounselDto> list = groupCounselStaffMapper.selectGroupCounselList();
		
		for(GroupCounselDto groupCounselDto : list) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int count = groupCounselStaffMapper.selectGroupCounselReservationCount(groupCounselDto.getId()) - groupCounselDto.getAmount();
			
			
			List<GroupCounselReservationDto> list2 = groupCounselStaffMapper.selectGroupCounselReservationList(groupCounselDto.getId()); 
			List<Map<String, Object>> groupCounselReservationByStudentList = new ArrayList<Map<String,Object>>();
			
			for(GroupCounselReservationDto groupCounselReservationDto : list2) {
				Map<String, Object> map2 = new HashMap<String, Object>();
				
				StudentInfoDto studentInfoDto = groupCounselStaffMapper.selectGroupCounselReservationByStudent(groupCounselReservationDto.getStudent_pk());
				
				map2.put("studentInfoDto", studentInfoDto);
				map2.put("groupCounselReservationDto", groupCounselReservationDto);
				
				groupCounselReservationByStudentList.add(map2);
			}
			
			map.put("count", count);
			map.put("groupCounselDto", groupCounselDto);
			map.put("groupCounselReservationByStudentList", groupCounselReservationByStudentList);
			
			grouopCounselList.add(map);
		}
		
		return grouopCounselList;
	}

	
	// 집단 상담 디테일 가져오기
	public GroupCounselDto readGroupCounselDetail(int id) {
		
		GroupCounselDto groupCounselDto = groupCounselStaffMapper.selectGroupCounselById(id);
		
		return groupCounselDto;
	}
	
	
	
}
