package com.mkfactory.toothless.a.staff.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
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
	public String mj_readApplyDormInfoPage(Model model) {
		
		// 입사신청 전체 리스트
		List<Map<String, Object>> applyList =  staffService.getAllDormApplyList();
		model.addAttribute("applyList", applyList);
		
		// 입사신청 전체 개수
		int countApplyList = applyList.size();
		model.addAttribute("countApplyList", countApplyList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		

		return "tl_a/staff/mj_readApplyDormInfoPage";
	}
	

	// 선발 프로세스
	@RequestMapping("mj_selectDormStudentProcess")
	public String mj_selectDormStudentProcess(String selection_status, int dorm_application_pk) {
		
		staffService.updateSelectionStatus(selection_status, dorm_application_pk);
		
		if ("Y".equals(selection_status)) {
			return "redirect:../staff/mj_readApplyDormInfoPage";
		}else if("N".equals(selection_status)) {
			return "redirect:../staff/mj_readSelectedDormStudentPage";
		}
		
		return "";	
		
	}
	
	
	// 선발완료 목록 관리 페이지 (= 선발관리)
	@RequestMapping("mj_readSelectedDormStudentPage")
	public String mj_readSelectedDormStudentPage(Model model) {
		
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		model.addAttribute("dormSelectedList", dormSelectedList);
		
		// 선발완료 전체 개수
		int countDormSelectedList = dormSelectedList.size();
		model.addAttribute("countDormSelectedList", countDormSelectedList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		

		return "tl_a/staff/mj_readSelectedDormStudentPage";
	}
	
	
	// 납부관리 페이지로(전체)
	@RequestMapping("mj_managePaymentPage")
	public String mj_managePaymentPage(Model model) {
		
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		model.addAttribute("dormSelectedList", dormSelectedList);
		
		// 선발완료 전체 개수
		int countDormSelectedList = dormSelectedList.size();
		model.addAttribute("countDormSelectedList", countDormSelectedList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		
		return "tl_a/staff/mj_managePaymentPage";
	}
	
	// 납부관리 페이지로(납부완료)
	@RequestMapping("mj_managePaymentYesPage")
	public String mj_managePaymentPage2(Model model) {
		
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		model.addAttribute("dormSelectedList", dormSelectedList);
		
		// 납부완료 전체 리스트
		List<Map<String, Object>> paymentYesList =  staffService.getPaymentYesList();
		model.addAttribute("paymentYesList", paymentYesList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		
		return "tl_a/staff/mj_managePaymentYesPage";
	}
	
	// 납부관리 페이지로(미납부)
	@RequestMapping("mj_managePaymentNoPage")
	public String mj_managePaymentPage3(Model model) {
		
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		model.addAttribute("dormSelectedList", dormSelectedList);
		
		// 미납부 전체 리스트
		List<Map<String, Object>> paymentNoList =  staffService.getPaymentNoList();
		model.addAttribute("paymentNoList", paymentNoList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		
		return "tl_a/staff/mj_managePaymentNoPage";
	}

	// 납부 프로세스
	@RequestMapping("mj_updatePaymentStatusProcess")
	public String mj_updatePaymentStatusProcess(int page, String payment_status, int dorm_application_pk) {
		
		staffService.updatePaymentStatus(payment_status, dorm_application_pk);
		
		if ("Y".equals(payment_status)) {
			if(page == 1) {
				return "redirect:../staff/mj_managePaymentPage";
			}else if(page == 2) {
				return "redirect:../staff/mj_managePaymentYesPage";
			}else if(page == 3) {
				return "redirect:../staff/mj_managePaymentNoPage";
			}

		}else if("N".equals(payment_status)) {
			if(page == 1) {
				return "redirect:../staff/mj_managePaymentPage";
			}else if(page == 2) {
				return "redirect:../staff/mj_managePaymentYesPage";
			}else if(page == 3) {
				return "redirect:../staff/mj_managePaymentNoPage";
			}
		}
		
		return "";	
		
	}
	
	// 상벌코드 목록
	@RequestMapping("mj_pointCategoryPage")
	public String mj_pointCategoryPage(Model model) {
		
		List<PointCategory> pointCategoryListAll = staffService.getPointCategory();
		model.addAttribute("pointCategoryListAll", pointCategoryListAll);
		
		return "tl_a/staff/mj_pointCategoryPage";
	}
	
	// 상벌코드 등록 프로세스
	@RequestMapping("mj_registerPointCategoryProcess")
	public String mj_registerPointCategoryProcess(PointCategory params) {

		staffService.registerPointCategory(params);
		
		return "redirect:../staff/mj_pointCategoryPage";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
