package com.mkfactory.toothless.a.staff.dm.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.dm.mapper.DormStaffSqlMapperDm;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.AlarmApi;

@Service
public class DormStaffServiceDm {
	
	@Autowired
	public DormStaffSqlMapperDm dormStaffSqlMapperDm;
	
	@Autowired
	public AlarmApi alarmApi;
	
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
	
	public void assignmentDeleteByDormStudentPk(int dorm_student_pk) {
		
		dormStaffSqlMapperDm.assignmentDeleteByDormStudentPk(dorm_student_pk);
		
	}
	
	public List<Map<String, Object>> studentInfoAllList() {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<StudentInfoDto> studentInfoDto = dormStaffSqlMapperDm.studentInfoAllList();
		
			for(StudentInfoDto e : studentInfoDto) {
			
				Map<String, Object> map = new HashMap<String, Object>();
				
				int student_pk = e.getStudent_pk();
				// 수납완료 Y 선발완료 Y 검증
				// 12/11 문제발생 ==> 왜냐면 여기서 joinDormApplicationDto가 studentPk으로 가져왔을때 두명이나올수 있음 
				//
				JoinDormApplicationDto joinDormApplicationDto = dormStaffSqlMapperDm.joinDormAppliByStudentPK(student_pk);
				// dormStudentDto 사생정보 없을때 배정리스트가 뽑히게 하기위한 확인용
				DormStudentDto dormStudentDto = dormStaffSqlMapperDm.dormStudentInfoByStudentPk(student_pk);
				
				// joinDormApplicationDto가 null값이 아닐때
				if(joinDormApplicationDto == null) {
					continue;
				}
				
				if(dormStudentDto != null) {
					continue;
				}
				
				if(joinDormApplicationDto.getPayment_status().equals("Y") && joinDormApplicationDto.getSelection_status().equals("Y")) {
					map.put("studentInfoDto", e); //학생 이름
					
					list.add(map);
				}
				
			}
		
			return list;
		
		}
	
		public List<Map<String, Object>> dormRoomAllList(){
			
			List<Map<String, Object>> list = new ArrayList<>();
			
			List<DormRoomDto> dormRoomDto = dormStaffSqlMapperDm.dormRoomAllList();
			for(DormRoomDto e : dormRoomDto) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				int dorm_pk = e.getDorm_pk();
				DormBuildingDto dormBuildingDto = dormStaffSqlMapperDm.dormBuildingInfoByDormPk(dorm_pk);
				
				map.put("dormRoomDto", e);
				map.put("dormBuildingDto", dormBuildingDto);
				
				list.add(map);
				
			}
			
			return list;
		}
	
	public List<DormBuildingDto> dormListDong(){
		
		
		return dormStaffSqlMapperDm.dormListDong();
	}
	
	public SemesterDto SemesterCheckY(){
		
		return dormStaffSqlMapperDm.SemesterCheckY();
	}
	
	// 배정되었을때 알람가야하니까 ..!
	public void dormStudentAssignmentInsert(DormStudentDto dormStudentDto) {
		
		int student_pk = dormStudentDto.getStudent_pk();
		
		alarmApi.sendAlarm(student_pk, "기숙사 방 배정이 완료되었습니다.", "/toothless/tl_a/student/jw_mainPage");
		
		
		dormStaffSqlMapperDm.dormStudentAssignmentInsert(dormStudentDto);
		
	}
	
	public List<DormRoomDto> dormRoomInfoByDormPk(int dorm_pk){
		
		return dormStaffSqlMapperDm.dormRoomInfoByDormPk(dorm_pk);
	}
	
	public List<Map<String, Object>> ddormRoomInfoByDormPk(int dorm_pk){
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		List<DormRoomDto> dormRoomDto = dormStaffSqlMapperDm.dormRoomInfoByDormPk(dorm_pk);
		
		for(DormRoomDto e : dormRoomDto){
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			//dorm빌딩 정보는 유니크 해야함 무조건 하나
			DormBuildingDto dormBuildingDto = dormStaffSqlMapperDm.dormBuildingInfoByDormPk(dorm_pk);
			
			map.put("dormRoomDto", e);
			map.put("dormBuildingDto", dormBuildingDto);
			
			list.add(map);
			
			
		}
		
		return list;
		
	}
	
	public List<Map<String, Object>> dormInfoTestByDormPk(int dorm_pk){
		
		
		return dormStaffSqlMapperDm.dormInfoTestByDormPk(dorm_pk);
	}
	
	public boolean dormAssignCheckByDormRoomPk(int dorm_room_pk) {
		
		
		
		return dormStaffSqlMapperDm.dormAssignCheckByDormRoomPk(dorm_room_pk);
	}
	
	public List<Map<String, Object>> searchListBySearchWordAndSearchType(String searchWord, String searchType){
		
		
		return dormStaffSqlMapperDm.searchListBySearchWordAndSearchType(searchWord, searchType);
	}
	
}




