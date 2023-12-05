package com.mkfactory.toothless.a.staff.mj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerMj {
	
	@Autowired
	DormStaffServiceImpl staffService;
	
	@Autowired
	StudentServiceImpl commonStudentService;
	
	/*
	@Autowired
	StaffServiceImpl commonStaffService;
	
	// 사감 로그인 페이지로
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "another/staff/loginPage";
	}
	
	// 사감 로그인
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StaffInfoDto params) {
		
		StaffInfoDto staffInfoDto = staffService.loginByStaffIdAndPassword(params);
	
		if(staffInfoDto == null) {
			return "redirect: ./loginPage";
		}
		
		
		session.setAttribute("sessionStaffInfo", staffInfoDto);
		if(staffInfoDto.getCenter_pk() == 1) {
			
			return "redirect: ../../tl_c/woojae/staff/ajdksStaffMainPage";
			
		}else if(staffInfoDto.getCenter_pk() == 2){
			
			return "redirect: ../../tl_b/common/studentMainPage";
			
		}else if(staffInfoDto.getCenter_pk() == 3){
			
			return "redirect: ../../tl_e/commons/counselCenterStaffMainPage";
			
		}else if(staffInfoDto.getCenter_pk() == 4){
			
			return "redirect: ../../tl_a/staff/mj_mainPage";
			
		}else if(staffInfoDto.getCenter_pk() == 5){
			
			return "redirect: ../../tl_b/common/staffMainPage";
			
		}else{
			return "redirect: ./anotherMainPage";
		}
	
	}
	
	// 사감 로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect: ./loginPage";
	}
	
	
	*/
	
	
	// 사감 메인페이지
	@RequestMapping("mj_mainPage")
	public String mj_mainPage() {
		
		return "tl_a/staff/mj_mainPage";
	}
	
	
	
	
	// 학년도/학기 관리 페이지
	@RequestMapping("mj_manageYearPage")
	public String mj_manageYearPage(Model model) {
		
		// 학년도/학기 리스트
		List<SemesterDto> yearList =  staffService.getYearList();
		model.addAttribute("yearList", yearList);
		
		// 리스트 개수
		int countYearList = yearList.size();
		model.addAttribute("countYearList", countYearList);
		
		return "tl_a/staff/mj_manageYearPage";
	}
	
	
	// 학년도/학기 추가 페이지
	@RequestMapping("mj_registerYearPage")
	public String mj_registerYearPage() {
			
		return "tl_a/staff/mj_registerYearPage";
	}
	
	// 학년도/학기 추가 프로세스
	@RequestMapping("mj_registerYearProcess")
	public String mj_registerYearProcess(SemesterDto params) {
			
		staffService.registerYear(params);
		
		return "redirect:../staff/mj_manageYearPage";
	}
	
	// 학년도/학기 진행상태 변경 프로세스
	@RequestMapping("mj_changeProgressProcess")
	public String mj_changeProgressProcess(SemesterDto params) {
			
		return "redirect:../staff/mj_changeProgressProcess";
	}

	// 공고등록 페이지
	@RequestMapping("mj_registerJoinInfoPage")
	public String mj_registerJoinInfoPage() {

		return "tl_a/staff/mj_registerJoinInfoPage";
	}
	
	// 공고등록 프로세스
	@RequestMapping("mj_registerInfoProcess")
	public String mj_registerInfoProcess(JoinDormInfoDto params) {
		
		SemesterDto thisSemesterDto = staffService.getThisSemester();
		params.setSemester_pk(thisSemesterDto.getSemester_pk());
	
		staffService.registerInfo(params);
		
		return "redirect:../staff/mj_readRegisterJoinInfoPage";
	}
	
	
	// 공고 전체 조회/수정 페이지
	@RequestMapping("mj_readRegisterJoinInfoPage")
	public String mj_readRegisterJoinInfoPage(Model model) {
		
		// 공고전체 리스트
		List<JoinDormInfoDto> infoList =  staffService.getAllDormInfoList();
		model.addAttribute("infoList", infoList);
		
		// 리스트 개수
		int countInfoList = infoList.size();
		model.addAttribute("countInfoList", countInfoList);
		
		return "tl_a/staff/mj_readRegisterJoinInfoPage";
	}
	
	// 입사신청 목록 관리 페이지 (= 선발관리)
	@RequestMapping("mj_readApplyDormInfoPage")
	public String mj_readApplyDormInfoPage() {

		return "tl_a/staff/mj_readApplyDormInfoPage";
	}
	

	
	
}
