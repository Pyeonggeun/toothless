package com.mkfactory.toothless.a.staff.dm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.dm.service.DormStaffServiceDm;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerDm {
	
	@Autowired
	public DormStaffServiceDm dormStaffServiceDm;
	
	@RequestMapping("dm_readRoomAssignment")
	public String dm_readRoomAssignment(Model model, HttpSession session) {
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(sessionStaffInfo == null) {
			
			
			return "redirect:../../another/staff/loginPage";
		}
		
		model.addAttribute("dormList", dormStaffServiceDm.allDormStudent());
		
		return "/tl_a/staff/dm_readRoomAssignment";
	}
	
	@RequestMapping("dm_roomAssignment")
	public String dm_roomAssignment(Model model, HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(sessionStaffInfo == null) {
			
			
			return "redirect:../../another/staff/loginPage";
		}
		
		model.addAttribute("dormList", dormStaffServiceDm.allDormStudent());
		model.addAttribute("studentAssignmentList", dormStaffServiceDm.studentInfoAllList());
		
		List<DormRoomDto> dormRoomDtos =  new ArrayList<DormRoomDto>();
		List<Map<String, Object>> list = dormStaffServiceDm.dormRoomAllList();
		
		for(Map<String, Object> map : list) {
			
			dormRoomDtos.add((DormRoomDto)map.get("dormRoomDto"));
			
		}
		
		model.addAttribute("dormBuildingDtos", dormStaffServiceDm.dormListDong());
		model.addAttribute("dormRoomDtos", dormRoomDtos);
		
		return "/tl_a/staff/dm_roomAssignment";
	}
	
	@RequestMapping("dm_readRoomAssignmentA")
	public String dm_readRoomAssignmentA(Model model) {
		
		model.addAttribute("dormListA", dormStaffServiceDm.allDormStudentA());
		
		return "/tl_a/staff/dm_readRoomAssignmentA";
	}
	
	@RequestMapping("dm_readRoomAssignmentB")
	public String dm_readRoomAssignmentB(Model model) {
		
		model.addAttribute("dormListB", dormStaffServiceDm.allDormStudentB());
		
		return "/tl_a/staff/dm_readRoomAssignmentB";
	}
	
	@RequestMapping("dm_roomAssignmentY")
	public String dm_roomAssignmentY(Model model) {
		
		model.addAttribute("dormList", dormStaffServiceDm.allDormStudent());
		
		return "/tl_a/staff/dm_roomAssignmentY";
	}
	
	@RequestMapping("dm_roomAssignmentN")
	public String dm_roomAssignmentN(Model model) {
		
		//여기서는 선발여부 Y 납부여부 Y인 학생들을 끌어올거임 
		//★★★ 조건이 하나 더생김 미배정 이니까 배정된 애들이 셀렉트 되면 안됨 ★★★
		
		// 동 호수의 모든정보 리스트임 새로운 동정보가 생겼을 때 jsp에서 if문 추가해주면됩니다.
		
		List<DormRoomDto> dormRoomDtos =  new ArrayList<DormRoomDto>();
		
		List<Map<String, Object>> list = dormStaffServiceDm.dormRoomAllList();
		
		for(Map<String, Object> map : list) {
			
			dormRoomDtos.add((DormRoomDto)map.get("dormRoomDto"));
			
		}
		
		model.addAttribute("dormBuildingDtos", dormStaffServiceDm.dormListDong());
		model.addAttribute("dormRoomDtos", dormRoomDtos);
		model.addAttribute("studentAssignmentList", dormStaffServiceDm.studentInfoAllList());
		
		
		
		return "/tl_a/staff/dm_roomAssignmentN";
	}
	
	@RequestMapping("assignmentDeleteProcess")
	public String assignmentDeleteProcess(int dorm_student_pk) {
		
		dormStaffServiceDm.assignmentDeleteByDormStudentPk(dorm_student_pk);
		
		return "redirect:./dm_roomAssignmentY";
	}
	
	@RequestMapping("assignmentDeleteProcessS")
	public String assignmentDeleteProcessS(int dorm_student_pk) {
		
		dormStaffServiceDm.assignmentDeleteByDormStudentPk(dorm_student_pk);
		
		return "redirect:./dm_roomAssignment";
	}
	
	
	@RequestMapping("assignmentAddProcess")
	public String assignmentAddProcess(DormStudentDto dormStudentDto) {
		//semesterPk 가 Y인 녀석 가져오기
		SemesterDto semesterDto = dormStaffServiceDm.SemesterCheckY();
		int semester_pk = semesterDto.getSemester_pk();
		// Y인 녀석 세팅
		dormStudentDto.setSemester_pk(semester_pk);
		// 사생 배정하기
		dormStaffServiceDm.dormStudentAssignmentInsert(dormStudentDto);
		
		return "redirect:./dm_roomAssignmentN";
	}
	
	@RequestMapping("assignmentAddProcessMainBack")
	public String assignmentAddProcessMainBack(DormStudentDto dormStudentDto) {
		//semesterPk 가 Y인 녀석 가져오기
		SemesterDto semesterDto = dormStaffServiceDm.SemesterCheckY();
		int semester_pk = semesterDto.getSemester_pk();
		// Y인 녀석 세팅	
		dormStudentDto.setSemester_pk(semester_pk);
		// 사생 배정하기
		dormStaffServiceDm.dormStudentAssignmentInsert(dormStudentDto);
		
		return "redirect:./dm_roomAssignment";
	}
	
	
}
