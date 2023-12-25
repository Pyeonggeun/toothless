package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselCounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;
import com.mkfactory.toothless.e.dto.GroupCounselSurvey;
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
			int reservationCount = groupCounselStaffMapper.selectGroupCounselReservationCount(groupCounselDto.getId());
			Date sysdate = groupCounselStaffMapper.selectSysdate();
			
			map.put("groupCounselDto", groupCounselDto);
			map.put("count", count);
			map.put("reservationCount", reservationCount);
			map.put("sysdate", sysdate);
			
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
	
	
	// 학생별 집단 상담 예약 리스트 가져오기
	public List<Map<String, Object>> readGroupCounselReservationListByStudent(int student_pk) {
		
		List<GroupCounselReservationDto> list = groupCounselStudentMapper.selectGroupCounselReservationListByStudentId(student_pk);
		
		List<Map<String, Object>> groupCounselReservationListByStudent = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselReservationDto groupCounselReservationDto : list) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			// 설문조사count
			int count = groupCounselStudentMapper.countGroupSurvey(groupCounselReservationDto.getId());
			//해당 집단상담
			GroupCounselDto groupCounselDto = groupCounselStaffMapper.selectGroupCounselById(groupCounselReservationDto.getGroup_counsel_id());
			//집단상담에 등록된 상담원들
			List<GroupCounselCounselorDto> list2 = groupCounselStaffMapper.selectGroupCounselByCounselor(groupCounselReservationDto.getGroup_counsel_id());
			
			List<Map<String, Object>> groupCounselCounselorListByGroupCounsel = new ArrayList<Map<String,Object>>();
			
				for(GroupCounselCounselorDto groupCounselCounselorDto : list2) {
					
					Map<String, Object> map2 = new HashMap<String, Object>();
					
					CounselorDto counselorDto = groupCounselStaffMapper.selectCounselorById(groupCounselCounselorDto.getCounselor_id());
					
					map2.put("counselorDto", counselorDto);
					
					groupCounselCounselorListByGroupCounsel.add(map2);
				}
			map.put("count", count);	
			map.put("groupCounselReservationDto", groupCounselReservationDto);
			map.put("groupCounselDto", groupCounselDto);
			map.put("groupCounselCounselorListByGroupCounsel", groupCounselCounselorListByGroupCounsel);
			
			groupCounselReservationListByStudent.add(map);
		}
		
		return groupCounselReservationListByStudent;
	}
	
	//sysdate 가져오기
	public Date getSysdate() {
		
		return groupCounselStaffMapper.selectSysdate();
	}
	
	
	//만족도 조사 등록
	public void registerGroupCounselSurvey(GroupCounselSurvey groupCounselSurvey) {
		
		groupCounselStudentMapper.insertGroupCounselSurvey(groupCounselSurvey);
	}
	
	
	
	
	
	
	
	
	
}


















