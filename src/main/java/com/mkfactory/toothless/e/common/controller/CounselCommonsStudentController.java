package com.mkfactory.toothless.e.common.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.groupcounsel.service.CounselCommonsStudentServiceImpl;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonsStudentController {
	
	@Autowired
	CounselCommonsStudentServiceImpl counselCommonsStudentService;	
	
	
	@RequestMapping("counselCenterStudentMainPage")
	public String counselCenterStudentMainPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto == null) {
			return "redirect: /toothless/another/student/loginPage";
		}
		
		
		int student_pk = studentInfoDto.getStudent_pk();
		
		
		List<Map<String, Object>> groupCounselReservationList = counselCommonsStudentService.getGroupCounselList(student_pk);
		model.addAttribute("groupCounselReservationList", groupCounselReservationList);
				
		List<Map<String, Object>> noticeList = counselCommonsStudentService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		List<FreeboardDto> freeboardList = counselCommonsStudentService.getFreeboardList();
		model.addAttribute("freeboardList", freeboardList);
		
		List<Map<String, Object>> offlineCounselList = counselCommonsStudentService.getOfflineCounselList(student_pk);
		model.addAttribute("offlineCounselList", offlineCounselList);
		

		
		return "tl_e/commons/counselCenterStudentMainPage";
		
	}

	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return "redirect: ./../another/student/loginPage";
	}
	
	
	
	
	
}
