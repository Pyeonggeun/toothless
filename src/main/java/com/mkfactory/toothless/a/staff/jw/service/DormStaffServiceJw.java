package com.mkfactory.toothless.a.staff.jw.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DiaryDto;
import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.ExecutiveDto;
import com.mkfactory.toothless.a.dto.ExecutiveManagementDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.a.staff.jw.mapper.DormStaffMapperJw;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class DormStaffServiceJw {

	@Autowired
	private DormStaffMapperJw dormStaffMapperJw;
	
	public List<Map<String, Object>> getAllExitSituation() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ExitDto> exitList = dormStaffMapperJw.selectExitList();
		
		for(ExitDto exitDto : exitList) {
			
			int dormStudentPk = exitDto.getDorm_student_pk();
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("exitDto", exitDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	public List<Map<String, Object>> getAllCallAbsence(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<DormStudentDto> callAbsenceDormStudentList = dormStaffMapperJw.selectCallAbsenceDormStudentList();
		
		for(DormStudentDto dormStudentDto : callAbsenceDormStudentList) {
			
			int dormStudentPk = dormStudentDto.getDorm_student_pk();
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("dormStudentDto", dormStudentDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			
			list.add(map);
		}
		return list;
	}
	
	
	
	public List<Map<String, Object>> getAllDormStudentList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<DormStudentDto> dormStudentList = dormStaffMapperJw.selectAllDormStudentList();
		
		for(DormStudentDto dormStudentDto : dormStudentList) {
			
			int dormStudentPk = dormStudentDto.getDorm_student_pk();
			
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			
			if(studentInfoDto == null) {
				continue;
			}
			
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			int isExecutiveCheck;
			ExecutiveDto executiveDto = dormStaffMapperJw.selectExecutiveByDormStudentPk(dormStudentPk);
			if(executiveDto == null) {
				isExecutiveCheck = 0;
			}else {
				isExecutiveCheck = 1;
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("dormStudentDto", dormStudentDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("isExecutiveCheck", isExecutiveCheck);
			list.add(map);
		}
		
		return list;
	}
	
	public List<Map<String, Object>> getAllExecutiveList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ExecutiveDto> executiveList = dormStaffMapperJw.selectAllExecutiveList();
		
		for(ExecutiveDto executiveDto : executiveList) {
			
			int dormStudentPk = executiveDto.getDorm_student_pk();
			
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			List<DormRoomDto> dormRoomListByDormFloorAndDormPk = dormStaffMapperJw.selectDormRoomListByDormFloorAndDormPk(dormRoomDto.getDorm_floor(), dormPk);
			
			// 배정 - 배정 취소 수정필요(호실 중에 하나만 배정취소로 변경되고 여러 문제 발생)
			List<Map<String, Object>> dormRoomListByDormFloorAndDormPkListAndNY = new ArrayList<Map<String,Object>>();
			
			for(DormRoomDto dormRoomDtoqqq : dormRoomListByDormFloorAndDormPk) {
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("dormRoomListByDormFloorAndDormPk", dormRoomDtoqqq);
				map.put("isCount", dormStaffMapperJw.countExecutivePerRoomPk(executiveDto.getExecutive_pk(), dormRoomDto.getDorm_room_pk()));
												
				dormRoomListByDormFloorAndDormPkListAndNY.add(map);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("executiveDto", executiveDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("dormRoomListByDormFloorAndDormPkListAndNY", dormRoomListByDormFloorAndDormPkListAndNY);

			
			list.add(map);
		}
		
		return list;
	}
	
	public ExecutiveDto getExecutiveByDormStudentPk(int dorm_student_pk) {
		return dormStaffMapperJw.selectExecutiveByDormStudentPk(dorm_student_pk);
	}
	
	public void registerExecutive(int dorm_student_pk) {
		dormStaffMapperJw.insertExecutive(dorm_student_pk);
	}
	
	public void deleteExecutive(int dorm_student_pk) {
		dormStaffMapperJw.deleteExecutiveByDormStudentPk(dorm_student_pk);
	}
	
	// 임원 방배정
	public void assignmentExecutiveRoom(int dorm_room_pk, int executive_pk) {
		
		List<DormStudentDto> dormStudentListByPsAndDr = dormStaffMapperJw.selectDormStudentByProgressSemesterAndDormRoom(dorm_room_pk);
		
		for(DormStudentDto dormStudentDto : dormStudentListByPsAndDr) {
			
			int dormStudentPk = dormStudentDto.getDorm_student_pk();
			ExecutiveManagementDto executiveManagementDto = new ExecutiveManagementDto();
			executiveManagementDto.setExecutive_pk(executive_pk);
			executiveManagementDto.setDorm_student_pk(dormStudentPk);
			
			dormStaffMapperJw.insertExecutiveManagement(executiveManagementDto);
		}
	}
	
	public void removeExecutivePerRoom(int executive_pk, int dorm_room_pk) {
		dormStaffMapperJw.deleteExecutivePerRoomPk(executive_pk, dorm_room_pk);
	}
	
	// 임원 관리
	public List<Map<String, Object>> getAllExecutiveManagementList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ExecutiveDto> executiveList = dormStaffMapperJw.selectAllExecutiveList();
		
		for(ExecutiveDto executiveDto : executiveList) {
			
			int executivePk = executiveDto.getExecutive_pk();
			
			List<DormRoomDto> personalExecutiveRoomList = dormStaffMapperJw.selectPersonalExecutiveRoomList(executivePk);
			
			if(personalExecutiveRoomList.isEmpty()) {
				continue;
			}
			
			int dormStudentPk = executiveDto.getDorm_student_pk();
			
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("executiveDto", executiveDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("personalExecutiveRoomList", personalExecutiveRoomList);
			
			list.add(map);
			
		}
		
		return list;
	}
	
	public List<Map<String, Object>> getAllDiaryList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<DiaryDto> diaryList = dormStaffMapperJw.selectAllDiaryList();
		
		for(DiaryDto diaryDto : diaryList) {
			
			int executivetPk = diaryDto.getExecutive_pk();
			ExecutiveDto executiveDto = dormStaffMapperJw.selectExecutiveByExecutivePk(executivetPk);
			int dormStudentPk = executiveDto.getDorm_student_pk();
			
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("diaryDto", diaryDto);
			map.put("executiveDto", executiveDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	public List<Map<String, Object>> getAllPointManagementList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<DormStudentDto> dormStudentExceptExecutive = dormStaffMapperJw.selectDormStudentExceptExecuteByProgressSemester();
		
		for(DormStudentDto dormStudentDto : dormStudentExceptExecutive) {
			
			int dormStudentPk = dormStudentDto.getDorm_student_pk();
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("dormStudentDto", dormStudentDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("pointCategoryDto", dormStaffMapperJw.selectAllPointCategory());
			
			list.add(map);
		}
		
		return list;
	}
	
	public void registerPoint(PointDto pointDto) {
		dormStaffMapperJw.insertPoint(pointDto);
	}
	
public List<Map<String, Object>> getAllPointScoreList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<DormStudentDto> dormStudentExceptExecutive = dormStaffMapperJw.selectDormStudentExceptExecuteByProgressSemester();
		
		for(DormStudentDto dormStudentDto : dormStudentExceptExecutive) {
			
			int dormStudentPk = dormStudentDto.getDorm_student_pk();
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByProgressSemesterDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			Integer sumPointByDormStudentPk = dormStaffMapperJw.sumPointByDormStudentPk(dormStudentPk);
			
			int intSumPointValue = (sumPointByDormStudentPk != null) ? sumPointByDormStudentPk : 0;
			
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("dormStudentDto", dormStudentDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			map.put("intSumPointValue", intSumPointValue);
			
			list.add(map);
		}
		
		return list;
	}
	
}
