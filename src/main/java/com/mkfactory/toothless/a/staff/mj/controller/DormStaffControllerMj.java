package com.mkfactory.toothless.a.staff.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/tl_a/staff/*")
public class DormStaffControllerMj {
	
	@Autowired
	private DormStaffServiceImpl staffService;
	
	@Autowired
	private DormStudentServiceImpl studentService;
	
	@Autowired
	private StaffServiceImpl commonStaffService;

	
	// 사감 로그인 페이지로
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "another/staff/loginPage";
	}
	
	// 사감 로그인
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StaffInfoDto params) {
		
		StaffInfoDto staffInfoDto = commonStaffService.loginByStaffIdAndPassword(params);
	
		if(staffInfoDto == null) {
			return "redirect:../another/staff/loginPage";
		}
		
		session.setAttribute("sessionStaffInfo", staffInfoDto);
		return "redirect:../staff/mj_mainPage";
	}
	
	// 사감 로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect:../../another/staff/loginPage";
	}
	

	// 사감 메인페이지
	@RequestMapping("mj_mainPage")
	public String mj_mainPage(Model model, HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		// 입사신청 전체 리스트
		List<Map<String, Object>> applyList =  staffService.getAllDormApplyList();
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		// 납부완료 리스트
		List<Map<String, Object>> paymentYesList =  staffService.getPaymentYesList();
		// 메인페이지 공고리스트
		List<DormNoticeDto> dormNoticeList = staffService.getDormNotice();
		
		// 입사신청 전체 개수
		int countApplyList = applyList.size();
		model.addAttribute("countApplyList", countApplyList);
		
		// 선발완료 전체 개수
		int countDormSelectedList = dormSelectedList.size();
		model.addAttribute("countDormSelectedList", countDormSelectedList);
	
		// 납부완료 전체 개수
		int countPaymentYesList = paymentYesList.size();
		model.addAttribute("countPaymentYesList", countPaymentYesList);
		
		// 임원, 상/벌점 관리탭 기준 학기
		model.addAttribute("thisSemester", staffService.getThisSemester());
		
		model.addAttribute("dormNoticeList", dormNoticeList);
		model.addAttribute("countExecutive", staffService.getCountExecutive());
		model.addAttribute("countTodayDiary", staffService.getCountTodayDiary());
		model.addAttribute("countPlusPointDormStudent", staffService.getCountPlusPointDormStudent());
		model.addAttribute("countMinusPointDormStudent", staffService.getCountMinusPointDormStudent());
		model.addAttribute("countTodayExit", staffService.getCountTodayExit());
		model.addAttribute("countTodayCallAbsence", staffService.getCountTodayCallAbsence());
		
		//사생 배정 인원 수
		model.addAttribute("assignedDormStudentCount", staffService.assignedDormStudentCount());
		
	
		return "tl_a/staff/mj_mainPage";
	}
	
	
	// 학년도/학기 관리 페이지
	@RequestMapping("mj_manageYearPage")
	public String mj_manageYearPage(Model model) {
		
		// 학년도/학기 리스트
		List<Map<String, Object>> yearList =  staffService.getYearList();
		model.addAttribute("yearList", yearList);
		
		// 리스트 개수
		int countYearList = yearList.size();
		model.addAttribute("countYearList", countYearList);
;		
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
	public String mj_changeProgressProcess(int SEMESTER_PK) {
		
		staffService.updateSemester(SEMESTER_PK);
			
		return "redirect:../staff/mj_manageYearPage";
	}
	
	// 학년도/학기 삭제 프로세스
	@RequestMapping("deleteSemesterProcess")
	public String deleteSemesterProcess(int SEMESTER_PK) {
		
		staffService.deleteSemester(SEMESTER_PK);
			
		return "redirect:../staff/mj_manageYearPage";
	}

	// 공고등록 페이지
	@RequestMapping("mj_registerJoinInfoPage")
	public String mj_registerJoinInfoPage(HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}

		return "tl_a/staff/mj_registerJoinInfoPage";
	}

	// 입사신청 목록 관리 페이지 (= 선발관리)
	@RequestMapping("mj_readApplyDormInfoPage")
	public String mj_readApplyDormInfoPage(HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		return "tl_a/staff/mj_readApplyDormInfoPage";
	}
	
	// 납부관리 페이지로(전체)
	@RequestMapping("mj_managePaymentPage")
	public String mj_managePaymentPage(HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(staffInfoDto == null) {
			return "redirect:../../tl_a/staff/loginPage";
		}
		
		return "tl_a/staff/mj_managePaymentPage";
	}
	
	// 이전내역 조회 페이지로..(추후 수정필요)
	@RequestMapping("mj_readBeforeInfoPage")
	public String mj_readBeforeInfoPage() {
		
		return "tl_a/staff/mj_readBeforeInfoPage";
	}
	
	//=================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
