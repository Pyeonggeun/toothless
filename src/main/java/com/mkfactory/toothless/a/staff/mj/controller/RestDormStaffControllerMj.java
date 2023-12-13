package com.mkfactory.toothless.a.staff.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.Mj_RestResponseDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@RestController
@RequestMapping("/tl_a/staff/*")
public class RestDormStaffControllerMj {
	
	@Autowired
	private DormStaffServiceImpl staffService;
	
	@Autowired
	private DormStudentServiceImpl studentService;

	
	// 세션 아이디값 넘기기
	@RequestMapping("getSessionStaffId")
	public Mj_RestResponseDto getSessionStaffId(HttpSession session) {

		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		StaffInfoDto sessionStaff = (StaffInfoDto) session.getAttribute("sessionStaffInfo");

		// 로그인 돼있는 경우에만 data에 아이디를 입력하는거지~
		// 결과 : 로그인 X - {"result":"success","data":null} / 로그인 O - {"result":"success","data":43}	
		if(sessionStaff != null) {
			restResponseDto.addData("sessionSaffId", sessionStaff.getStaff_id());
		}
				
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	// 입주공고 등록
	@RequestMapping("mj_registerInfoProcess")
	public Mj_RestResponseDto mj_registerInfoProcess(JoinDormInfoDto params) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		SemesterDto thisSemesterDto = staffService.getThisSemester();
		params.setSemester_pk(thisSemesterDto.getSemester_pk());
	
		staffService.registerInfo(params);

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	
	// 입주공고 목록 가져오기(= 공고관리 - 조회/수정 페이지)
	@RequestMapping("getRegisterJoinInfo")
	public Mj_RestResponseDto getRegisterJoinInfo(HttpSession session) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 공고전체 리스트
		List<Map<String, Object>> infoList =  staffService.getAllDormInfoList();
		restResponseDto.addData("infoList", infoList);
		
		// 리스트 개수
		int countInfoList = infoList.size();
		restResponseDto.addData("countInfoList", countInfoList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		restResponseDto.addData("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
				
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	// 공고 수정
	@RequestMapping("updateJoinInfo")
	public Mj_RestResponseDto updateJoinInfo(JoinDormInfoDto joinDormInfoDto) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		staffService.updateJoinInfo(joinDormInfoDto);

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	// 공고 삭제
	@RequestMapping("deleteJoinInfo")
	public Mj_RestResponseDto deleteJoinInfo(@RequestParam int DORM_INFO_PK) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		staffService.deleteJoinInfo(DORM_INFO_PK);
		
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	
	// 입사신청 목록 관리 페이지 (= 선발관리)
	@RequestMapping("getApplyDormInfoList")
	public Mj_RestResponseDto getApplyDormInfoList() {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 입사신청 전체 리스트
		List<Map<String, Object>> applyList =  staffService.getAllDormApplyList();
		restResponseDto.addData("applyList", applyList);
		
		// 입사신청 전체 개수
		int countApplyList = applyList.size();
		restResponseDto.addData("countApplyList", countApplyList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		restResponseDto.addData("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)	
	}
	
	
	
	// 선발완료 목록 관리 페이지 (= 선발관리)
	@RequestMapping("getSelectedDormStudentList")
	public Mj_RestResponseDto mj_readSelectedDormStudentPage() {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
			
		// 선발완료 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		restResponseDto.addData("dormSelectedList", dormSelectedList);
		
		// 선발완료 전체 개수
		int countDormSelectedList = dormSelectedList.size();
		restResponseDto.addData("countDormSelectedList", countDormSelectedList);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		restResponseDto.addData("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)	
	}
	
	// 선발 프로세스
	@RequestMapping("mj_selectDormStudentProcess")
	public Mj_RestResponseDto mj_selectDormStudentProcess(
			@RequestParam String selection_status, 
			@RequestParam int dorm_application_pk) {
		
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		staffService.updateSelectionStatus(selection_status, dorm_application_pk);
		
		if ("Y".equals(selection_status)) {
			restResponseDto.addData("selectionStatus", "Y");
		}else if("N".equals(selection_status)) {
			restResponseDto.addData("selectionStatus", "N");
		}
			
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	// 납부 프로세스
	@RequestMapping("mj_updatePaymentStatusProcess")
	public Mj_RestResponseDto mj_updatePaymentStatusProcess(
			@RequestParam String payment_status, 
			@RequestParam int dorm_application_pk) {
		
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		staffService.updatePaymentStatus(payment_status, dorm_application_pk);
		
		if ("Y".equals(payment_status)) {
			restResponseDto.addData("paymentStatus", "Y");
		}else if("N".equals(payment_status)) {
			restResponseDto.addData("paymentStatus", "N");
		}
		
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	// 납부현황 페이지로 (납부완료 / 미납부)
	@RequestMapping("getPaymentList")
	public Mj_RestResponseDto getPaymentList() {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
				
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		restResponseDto.addData("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		
		// (선발완료) 전체 리스트
		List<Map<String, Object>> dormSelectedList =  staffService.getAllDormSelectedList();
		restResponseDto.addData("dormSelectedList", dormSelectedList);
		
		// 납부완료 리스트
		List<Map<String, Object>> paymentYesList =  staffService.getPaymentYesList();
		restResponseDto.addData("paymentYesList", paymentYesList);
		
		// 미납부 리스트
		List<Map<String, Object>> paymentNoList =  staffService.getPaymentNoList();
		restResponseDto.addData("paymentNoList", paymentNoList);
		
	
		// 선발완료 전체 개수
		int countDormSelectedList = dormSelectedList.size();
		restResponseDto.addData("countDormSelectedList", countDormSelectedList);

		// 납부완료 전체 개수
		int countPaymentYesList = paymentYesList.size();
		restResponseDto.addData("countPaymentYesList", countPaymentYesList);
		
		// 미납부 전체 개수
		int countPaymentNoList = paymentNoList.size();
		restResponseDto.addData("countPaymentNoList", countPaymentNoList);
	
		
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)	
	}
	
	// 현재학기에 해당하는 년도의 모든 학기들..
	@RequestMapping("getThisYearAllSemester")
	public Mj_RestResponseDto getThisYearAllSemester(HttpSession session) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		List<Map<String, Object>> thisYearSemesterList = staffService.getThisYearAllSemester();
		restResponseDto.addData("thisYearSemesterList", thisYearSemesterList);
		
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	// 이전년도의 모든 학기들..
	@RequestMapping("getBeforeYearAllSemester")
	public Mj_RestResponseDto getBeforeYearAllSemester(HttpSession session) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		List<Map<String, Object>> beforeYearList = staffService.getBeforeYearAll();
		restResponseDto.addData("beforeYearList", beforeYearList);
		
		List<Map<String, Object>> beforeYearSemesterList = staffService.getBeforeYearAllSemester();
		restResponseDto.addData("beforeYearSemesterList", beforeYearSemesterList);
		
		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}

	
	
	
	
	
	
	
	
	
	
	// =========================
	// templete - 항상 같은구조니까 만들어놓고 붙이면되지.
	@RequestMapping("#")
	public Mj_RestResponseDto templete(HttpSession session) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
	

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}

	
	
	
	
	
	
	
	
	
}
