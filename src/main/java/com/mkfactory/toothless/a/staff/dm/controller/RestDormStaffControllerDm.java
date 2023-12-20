package com.mkfactory.toothless.a.staff.dm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.dm.service.DormStaffServiceDm;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/staff/*")
public class RestDormStaffControllerDm {
	
	@Autowired
	public DormStaffServiceDm dormStaffServiceDm;
	
	//호실정보에 동정보까지 엮어서 가져온 리스트
	@RequestMapping("dongHoList")
	public RestResponseDto dongHoList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormRoomAllList());
		
		return restResponseDto;
	}
	
	@RequestMapping("AdongList")
	public RestResponseDto AdongList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.allDormStudentA());
		
		return restResponseDto;
	}
	
	@RequestMapping("BdongList")
	public RestResponseDto BdongList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.allDormStudentB());
		
		return restResponseDto;
	}
	
	@RequestMapping("assignmentAdd")
	public RestResponseDto assignmentAddProcess(DormStudentDto dormStudentDto) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		//semesterPk 가 Y인 녀석 가져오기
		SemesterDto semesterDto = dormStaffServiceDm.SemesterCheckY();
		int semester_pk = semesterDto.getSemester_pk();
		// Y인 녀석 세팅
		dormStudentDto.setSemester_pk(semester_pk);
		// 사생 배정하기
		dormStaffServiceDm.dormStudentAssignmentInsert(dormStudentDto);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
		
	}
	
	@RequestMapping("assignCancel")
	public RestResponseDto assignCancel(int dorm_student_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
	 	dormStaffServiceDm.assignmentDeleteByDormStudentPk(dorm_student_pk);
	 	// 시메스터 pk 세팅하고 넘겨줌
	 	
	 	
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("assignNeedCancelList")
	public RestResponseDto assignNeedCancelList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.allDormStudent());
		return restResponseDto;
	}
	
	@RequestMapping("assignNeedAddList")
	public RestResponseDto assignNeedAddList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.studentInfoAllList());
		
		return restResponseDto;
	}
	
	@RequestMapping("buildingInfoList")
	public RestResponseDto buildingInfoList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormListDong());
		
		return restResponseDto;
	}
	
	@RequestMapping("hoInfoList")
	public RestResponseDto HoInfoList() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		List<DormRoomDto> dormRoomDtos =  new ArrayList<DormRoomDto>();
		
		List<Map<String, Object>> list = dormStaffServiceDm.dormRoomAllList();
		
		for(Map<String, Object> map : list) {
			
			dormRoomDtos.add((DormRoomDto)map.get("dormRoomDto"));
			
		} 
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormRoomDtos);
		
		return restResponseDto;
	}
	@RequestMapping("selectList")
	public RestResponseDto selectList(int dorm_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormRoomInfoByDormPk(dorm_pk));
		
		return restResponseDto;
	}
	
	// 바꾸는거.. 리스트에 해당하는 호수랑 
	@RequestMapping("sselectList")
	public RestResponseDto sselectList(int dorm_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.ddormRoomInfoByDormPk(dorm_pk));
		
		return restResponseDto;
	}
	
	@RequestMapping("selectListTest")
	public RestResponseDto selectListTest(int dorm_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormInfoTestByDormPk(dorm_pk));
		
		return restResponseDto;
	}
	
	@RequestMapping("assignCheck")
	public RestResponseDto assignCheck(int dorm_room_pk) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.dormAssignCheckByDormRoomPk(dorm_room_pk));
		
		return restResponseDto;
	}
	
	@RequestMapping("allDormStudent")
	public RestResponseDto allDormStudent() {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.allDormStudent());
		
		return restResponseDto;
	}
	
	@RequestMapping("searchList")
	public RestResponseDto searchList(String searchWord, String searchType) {
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(dormStaffServiceDm.searchListBySearchWordAndSearchType(searchWord, searchType));
		
		return restResponseDto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
