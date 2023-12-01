package com.mkfactory.toothless.d.jm.consulting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.jm.consulting.service.ConsultingService;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/t1_d/consulting/*")
public class ConsultingController {
	
	@Autowired
	private ConsultingService consultingService;
	
	
	
	//구직희망신청 insert
	@RequestMapping("hopeJobApplyProcess")
	public String insertHopeJobApply(HopeJobDto par, HttpSession session) {
		
		//학생정보 pk 입력
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		par.setStudent_pk(studentInfoDto.getStudent_pk());
		
		
		//구직희망신청 insert 실행
		consultingService.insertHopeJobApply(par);
		return "";
	}
}
