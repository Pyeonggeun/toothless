package com.mkfactory.toothless.a.staff.dm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.staff.dm.mapper.DormStaffSqlMapperDm;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class DormStaffServiceDm {
	
	@Autowired
	public DormStaffSqlMapperDm dormStaffSqlMapperDm;
	
	
	public List<Map<String, Object>> allDormStudent(){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<DormStudentDto> DormStudentDto = dormStaffSqlMapperDm.allDormStudent();
		
		for(DormStudentDto dormStudentDto : DormStudentDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int dorm_room_pk = dormStudentDto.getDorm_room_pk();
			DormRoomDto dormRoomDto = dormStaffSqlMapperDm.dormRoomInfoByDormRoomPk(dorm_room_pk);
			int dorm_pk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffSqlMapperDm.dormBuildingInfoByDormPk(dorm_pk);
			int student_pk = dormStudentDto.getStudent_pk();
			StudentInfoDto studentInfoDto = dormStaffSqlMapperDm.studentInfoByStudentPk(student_pk);
			
			map.put("dormStudentDto", dormStudentDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("studentInfoDto", studentInfoDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	public List<Map<String, Object>> allDormStudentA() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<DormStudentDto> DormStudentDto = dormStaffSqlMapperDm.allDormStudent();	
		
		for(DormStudentDto dormStudentDto : DormStudentDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int dorm_room_pk = dormStudentDto.getDorm_room_pk();
			DormRoomDto dormRoomDto = dormStaffSqlMapperDm.dormRoomInfoByDormRoomPk(dorm_room_pk);
			int dorm_pk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffSqlMapperDm.dormBuildingInfoByDormPk(dorm_pk);
			int student_pk = dormStudentDto.getStudent_pk();
			StudentInfoDto studentInfoDto = dormStaffSqlMapperDm.studentInfoByStudentPk(student_pk);
			
			if(dormBuildingDto.getName().equals("A동")) {
				map.put("dormStudentDto", dormStudentDto);
				map.put("dormRoomDto", dormRoomDto);
				map.put("dormBuildingDto", dormBuildingDto);
				map.put("studentInfoDto", studentInfoDto);
				
				list.add(map);
			}
			
		}
		
		return list;
	}
	
	public List<Map<String, Object>> allDormStudentB() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<DormStudentDto> DormStudentDto = dormStaffSqlMapperDm.allDormStudent();	
		
		for(DormStudentDto dormStudentDto : DormStudentDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int dorm_room_pk = dormStudentDto.getDorm_room_pk();
			DormRoomDto dormRoomDto = dormStaffSqlMapperDm.dormRoomInfoByDormRoomPk(dorm_room_pk);
			int dorm_pk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffSqlMapperDm.dormBuildingInfoByDormPk(dorm_pk);
			int student_pk = dormStudentDto.getStudent_pk();
			StudentInfoDto studentInfoDto = dormStaffSqlMapperDm.studentInfoByStudentPk(student_pk);
			
			if(dormBuildingDto.getName().equals("B동")) {
				map.put("dormStudentDto", dormStudentDto);
				map.put("dormRoomDto", dormRoomDto);
				map.put("dormBuildingDto", dormBuildingDto);
				map.put("studentInfoDto", studentInfoDto);
				
				list.add(map);
			}
			
		}
		
		return list;
	}
	
	
	
	
}
