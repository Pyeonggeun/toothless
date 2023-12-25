package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselCounselorDto;
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
		List<GroupCounselDto> groupCounselList = groupCounselStaffMapper.selectGroupCounselList();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselDto groupCounselDto : groupCounselList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int count = groupCounselStaffMapper.selectGroupCounselReservationCount(groupCounselDto.getId());

			map.put("count", count);
			map.put("groupCounselDto", groupCounselDto);
			
			list.add(map);
		}
		
		return list;
	}

	
	// 집단 상담 상세 정보 가져오기
	public Map<String, Object> readGroupCounselDetail(int id) {
		
		GroupCounselDto groupCounselDto = groupCounselStaffMapper.selectGroupCounselById(id);
		//인원 - 신청인원 수
		int count = groupCounselStaffMapper.selectGroupCounselReservationCount(groupCounselDto.getId());
		
		List<GroupCounselReservationDto> groupCounselReservationList = groupCounselStaffMapper.selectGroupCounselReservationList(id);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselReservationDto groupCounselReservationDto : groupCounselReservationList) {
			
			//집단 상담 신청한 학생들 정보
			Map<String, Object> map = new HashMap<String, Object>();
			int student_pk = groupCounselReservationDto.getStudent_pk();
			StudentInfoDto studentInfoDto = groupCounselStaffMapper.selectStudentInfoById(student_pk);
			
			int department_pk = studentInfoDto.getDepartment_pk();
			DepartmentCategoryDto departmentCategoryDto = groupCounselStaffMapper.selectDepartmentCatecoryByStudentId(department_pk);
			
			map.put("groupCounselReservationDto", groupCounselReservationDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("departmentCategoryDto", departmentCategoryDto);
			
			list.add(map);
		}
		
		List<GroupCounselCounselorDto> groupCounselCounselorList = groupCounselStaffMapper.selectGroupCounselByCounselor(id);
		List<Map<String, Object>> list2 = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselCounselorDto groupCounselCounselorDto : groupCounselCounselorList) {
			
			//집단 상담 등록된 상담원
			Map<String, Object> map = new HashMap<String, Object>();
			int counselor_id = groupCounselCounselorDto.getCounselor_id();
			CounselorDto counselorDto = groupCounselStaffMapper.selectCounselorById(counselor_id);
			
			map.put("counselorDto", counselorDto);
			
			list2.add(map);
		}		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("counselorList", list2);
		map.put("studentInfoList", list);
		map.put("groupCounselDto", groupCounselDto);
		map.put("count", count);
		
		return map;
	}
	
	
	public List<CounselorDto> readGrouopCounselCounselorList(){
		
		return groupCounselStaffMapper.selectCounselorList();
	}
	
	public void insertGroupCounselCounselor(GroupCounselCounselorDto groupCounselCounselorDto) {
		groupCounselStaffMapper.insertGroupCounselCounselor(groupCounselCounselorDto);
		
	}
	
	//학생 출석체크
	public void studentIsAttendCheck(int id) {
		
		GroupCounselReservationDto groupCounselReservationDto = groupCounselStaffMapper.selectGroupCounselReservationById(id);
		
		if(groupCounselReservationDto.getIsAttend().equals("Y")) {
			groupCounselStaffMapper.studentIsAttendSetN(id);
			
			
		}else if(groupCounselReservationDto.getIsAttend().equals("N")) {
			groupCounselStaffMapper.studentIsAttendSetY(id);
	
		
		}
	}
		
	public GroupCounselReservationDto getGroupCounselReservationById(int id) {
		
		
		return groupCounselStaffMapper.selectGroupCounselReservationById(id);
	}
	
	
	
	//sysdate 가져오기
	public Date getSysdate() {
		
		return groupCounselStaffMapper.selectSysdate();
	}
	
	
	public List<Map<String, Object>> getGroupCounselByCounselorId(int counselor_id){
		
		List<GroupCounselCounselorDto> counselorList =  groupCounselStaffMapper.getGroupCounselCounselor(counselor_id);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(GroupCounselCounselorDto groupCounselCounselorDto : counselorList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int groupCounselId = groupCounselCounselorDto.getGroup_counsel_id();
			GroupCounselDto groupCounselDto = groupCounselStaffMapper.getGroupCounsel(groupCounselId);
			
			int count = groupCounselStaffMapper.selectGroupCounselReservationCount(groupCounselId);
			Date today = groupCounselStaffMapper.selectSysdate();
			
			map.put("today", today);
			map.put("count", count);
			map.put("groupCounselCounselorDto", groupCounselCounselorDto);
			map.put("groupCounselDto", groupCounselDto);
			
			list.add(map);
			
		}
		
		return list;
	}
	
	
	public CounselorDto getCounselor(int external_pk) {
		
		return groupCounselStaffMapper.getCounselor(external_pk);
	}
	
	
	
	
	
}
