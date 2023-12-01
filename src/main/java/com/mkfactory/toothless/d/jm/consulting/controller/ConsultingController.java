package com.mkfactory.toothless.d.jm.consulting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.jm.consulting.service.ConsultingService;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/jm_consulting/*")
public class ConsultingController {
	
	@Autowired
	private ConsultingService consultingService;
	

	
	//구직희망 신청서 등록 페이지
	@RequestMapping("applyHopeJobPage")
	public String applyHopeJobPage() {
		return "tl_d/jm_consulting/applyHopeJobPage";
	}
	
	
	//구직희망신청 insert
	@RequestMapping("hopeJobApplyProcess")
	public String insertHopeJobApply(HopeJobDto par, HttpSession session) {
		
			
			
		//학생정보 pk 출력
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		//구직희망 프로그램을 아직 진행중인 학생이라면 등록 거부
		
		
		
		//학생정보 pk 입력
		par.setStudent_pk(studentInfoDto.getStudent_pk());
		
		//구직희망신청 insert 실행
		consultingService.insertHopeJobApply(par);
		return "redirect:./applyHopeJobPage";
	}
}
