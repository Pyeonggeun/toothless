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
		List<Map<String, Object>> list = consultingService.getOnlineConsultingList(student_pk, isReply);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(list);
		
	
		return d_RestResponseDto;
	}
}
