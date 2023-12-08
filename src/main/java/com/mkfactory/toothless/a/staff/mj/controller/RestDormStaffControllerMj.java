package com.mkfactory.toothless.a.staff.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
		List<JoinDormInfoDto> infoList =  staffService.getAllDormInfoList();
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
