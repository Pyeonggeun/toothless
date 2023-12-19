package com.mkfactory.toothless.a.staff.jw.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.a.staff.jw.service.DormStaffServiceJw;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerJw {

	@Autowired
	private DormStaffServiceJw dormStaffServiceJw;
	
	@RequestMapping("jw_exitSituationPage")
	public String jw_exitSituationPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("exitListMap", dormStaffServiceJw.getAllExitSituation());
		model.addAttribute("dormBuildingList", dormStaffServiceJw.getAllDormBuilding());
		
		return "/tl_a/staff/jw_exitSituationPage";
	}
	
	@RequestMapping("jw_exitSituationByDormPkPage")
	public String jw_exitSituationByDormPkPage(Model model, HttpSession session,int dorm_pk) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("exitListMap", dormStaffServiceJw.getExitSituationByDormPk(dorm_pk));
		model.addAttribute("dormBuildingList", dormStaffServiceJw.getAllDormBuilding());
		
		return "/tl_a/staff/jw_exitSituationByDormPkPage";
	}
	
	@RequestMapping("jw_callAttendSituationPage")
	public String jw_callAttendSituationPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatedNow = now.format(formatter);

		model.addAttribute("formatedNow",formatedNow);
		model.addAttribute("callAbsenceListMap", dormStaffServiceJw.getAllCallAbsence());
		
		return "/tl_a/staff/jw_callAttendSituationPage";
	}
	
	// 상벌코드 목록
	@RequestMapping("jw_pointCategoryPage")
	public String jw_pointCategoryPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		List<PointCategory> pointCategoryListAll = dormStaffServiceJw.getPointCategory();
		model.addAttribute("pointCategoryListAll", pointCategoryListAll);
		
		return "/tl_a/staff/jw_pointCategoryPage";
	}
	
	// 상벌코드 등록 프로세스
	@RequestMapping("jw_registerPointCategoryProcess")
	public String mj_registerPointCategoryProcess(PointCategory params) {

		dormStaffServiceJw.registerPointCategory(params);
		
		return "redirect:../staff/jw_pointCategoryPage";
	}
	
	@RequestMapping("jw_pointManagementPage")
	public String jw_pointManagementPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("pointManagementListMap", dormStaffServiceJw.getAllPointManagementList());
		
		return "/tl_a/staff/jw_pointManagementPage";
	}
	
	@RequestMapping("jw_pointRegisterProcess")
	public String jw_pointRegisterProcess(HttpSession session, PointDto pointDto) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffPk = staffInfoDto.getStaff_pk();
		
		pointDto.setStaff_pk(staffPk);
		
		dormStaffServiceJw.registerPoint(pointDto);
		
		return "redirect:/tl_a/staff/jw_pointManagementPage";
	}
	
	@RequestMapping("jw_pointSituationPage")
	public String jw_pointSituationPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("pointListMap", dormStaffServiceJw.getAllPointScoreList());
		
		return "/tl_a/staff/jw_pointSituationPage";
	}
	
	@RequestMapping("jw_executiveAssignmentPage")
	public String jw_executiveAssignmentPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("dormStudentListMap", dormStaffServiceJw.getAllDormStudentList());
		
		return "/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	@RequestMapping("jw_deleteExecutiveProcess")
	public String jw_deleteExecutiveProcess(int dorm_student_pk) {
		
		dormStaffServiceJw.deleteExecutive(dorm_student_pk);
		
		return "redirect:/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	
	@RequestMapping("jw_executiveAssignmentProcess")
	public String jw_executiveAssignmentProcess(int dorm_student_pk) {
		
		dormStaffServiceJw.registerExecutive(dorm_student_pk);
		
		return "redirect:/tl_a/staff/jw_executiveAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomAssignmentPage")
	public String jw_executiveRoomAssignmentPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("executiveListMap", dormStaffServiceJw.getAllExecutiveList());
		
		return "/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomassignmentProcess")
	public String jw_executiveRoomassignmentProcess(@RequestParam("dorm_room_pk") int dorm_room_pk, @RequestParam("executive_pk") int executive_pk) {
		
		dormStaffServiceJw.assignmentExecutiveRoom(dorm_room_pk, executive_pk);
		
		return "redirect:/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveRoomRemoveProcess")
	public String jw_executiveRoomRemoveProcess(@RequestParam("executive_pk") int executive_pk, @RequestParam("dorm_room_pk") int dorm_room_pk) {
		
		dormStaffServiceJw.removeExecutivePerRoom(executive_pk, dorm_room_pk);
		
		return "redirect:/tl_a/staff/jw_executiveRoomAssignmentPage";
	}
	
	@RequestMapping("jw_executiveAssignmentSituationPage")
	public String jw_executiveAssignmentSituationPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("executiveManagemenListMap", dormStaffServiceJw.getAllExecutiveManagementList());
		
		return "/tl_a/staff/jw_executiveAssignmentSituationPage";
	}
	
	@RequestMapping("jw_diaryManagementPage")
	public String jw_diaryManagementPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		model.addAttribute("getAllDiaryList", dormStaffServiceJw.getAllDiaryList());
		
		return "/tl_a/staff/jw_diaryManagementPage";
	}
	
}
