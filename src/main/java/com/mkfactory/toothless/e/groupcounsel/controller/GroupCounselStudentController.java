package com.mkfactory.toothless.e.groupcounsel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStudentServiceImpl;

@Controller
@RequestMapping("/tl_e/groupcounsel/student/*")
public class GroupCounselStudentController {
	
	@Autowired
	GroupCounselStudentServiceImpl groupCounselStudentService;
	
	@RequestMapping("groupCounselListPage")
	public String groupCounselListPage(Model model, HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		int student_pk = studentInfoDto.getStudent_pk();
		
		List<Map<String, Object>> groupCounselList = groupCounselStudentService.readGroupCounselList(student_pk);
		model.addAttribute("groupCounselList", groupCounselList);
		
		return "tl_e/groupcounsel/student/groupCounselListPage";
	}
	
	@RequestMapping("groupCounselReservationCheckPage")
	public String groupCounselReservationPage(Model model, int id) {
		
		GroupCounselDto groupCounselDto = groupCounselStudentService.readGroupCounselDetail(id);
		model.addAttribute("groupCounselDto", groupCounselDto);
		
		return "tl_e/groupcounsel/student/groupCounselReservationCheckPage";
	}
	
	@RequestMapping("groupCounselReservationProcess")
	public String groupCounselReservationProcess(int student_pk, int group_counsel_id) {
		
		GroupCounselReservationDto groupCounselReservationDto = new GroupCounselReservationDto();
		groupCounselReservationDto.setStudent_pk(student_pk);
		groupCounselReservationDto.setGroup_counsel_id(group_counsel_id);
		
		groupCounselStudentService.reserveGroupCounsel(groupCounselReservationDto);
		
		
		return "redirect: ./groupCounselListPage";
	}
	
	
	
}
