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
import com.mkfactory.toothless.e.groupcounsel.mapper.GroupCounselStudentSqlMapper;

@Service
public class GroupCounselStudentServiceImpl {
	
	@Autowired
	GroupCounselStaffSqlMapper groupCounselStaffMapper;
	@Autowired
	GroupCounselStudentSqlMapper groupCounselStudentMapper;
	
	//집단상담 리스트 가져오기
	public List<Map<String, Object>> readGroupCounselList(int student_pk) {
		 
		List<GroupCounselDto> groupCounselList = groupCounselStaffMapper.selectGroupCounselList();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselDto groupCounselDto : groupCounselList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int group_counsel_id = groupCounselDto.getId();
			
			GroupCounselReservationDto groupCounselReservationDto = new GroupCounselReservationDto();
			groupCounselReservationDto.setStudent_pk(student_pk);
			groupCounselReservationDto.setGroup_counsel_id(group_counsel_id);
			
			
			int count = groupCounselStudentMapper.countGroupCounselReservationByStudentId(groupCounselReservationDto);
			
			map.put("groupCounselDto", groupCounselDto);
			map.put("count", count);
			
			list.add(map);
		}
		
		return list;
	}
	

	//집단상담 상세정보 가져오기
	public GroupCounselDto readGroupCounselDetail(int id) {
		
		return groupCounselStaffMapper.selectGroupCounselById(id);
	}
	
	//집단상담 신청
	public void reserveGroupCounsel(GroupCounselReservationDto groupCounselReservationDto) {
		groupCounselStudentMapper.insertGroupCounselReservation(groupCounselReservationDto);
		
		
	}
}
