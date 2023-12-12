package com.mkfactory.toothless.d.jm.consulting.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.jm.consulting.service.ConsultingService;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_d/jm_consulting/*")
public class RestConsultingController {

	@Autowired
	private ConsultingService consultingService;
	
	//학생 본인 상담 리스트 출력
	@RequestMapping("reloadMyOnlineConsultingList")
	public D_RestResponseDto reloadMyOnlineConsultingList(HttpSession session, Model model,
			@RequestParam(value="isReply", defaultValue="all") String isReply				
			) {
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();		
		List<Map<String, Object>> list = consultingService.getMyOnlineConsultingList(student_pk, isReply);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(list);
		
	
		return d_RestResponseDto;
	}
	
	
	//온라인컨설팅 등록 프로세스
	@RequestMapping("onlineConsultingProcess")
	public D_RestResponseDto insertOnlineConsulting(OnlineConsultingDto onlineConsulting, Model model, HttpSession session) {
		

		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		//구직희망 신청번호 뽑아오기
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		//신청 가능or불가능 이미 페이지에서 막음
//		boolean isboolean= consultingService.isOnlineconsulting(student_pk);
		
		//학생 온라인상담 정보 입력
		HopeJobDto hopeJobDto = consultingService.getLastHopejob(student_pk);
		onlineConsulting.setHope_job_pk(hopeJobDto.getHope_job_pk());
		consultingService.insertOnlineConsulting(onlineConsulting);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
		
		}	
	
	@RequestMapping("reloadIsOnlineconsulting")
	public D_RestResponseDto isOnlineconsulting(HttpSession session) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		boolean isboolean = consultingService.isOnlineconsulting(student_pk);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(isboolean);
		
		return d_RestResponseDto;
	}
	











}	
	
	

