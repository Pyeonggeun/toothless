package com.mkfactory.toothless.a.student.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.student.dm.service.DormStudentServiceDm;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormStudentControllerDm {
	
	@Autowired
	public DormStudentServiceDm dormStudentServiceDm;
	
	//건물현황
	@RequestMapping("dm_dormBulidingStatus")
	public String dm_dormBulidingStatus() {
		
		
		
		return "/tl_a/student/dm_dormBulidingStatus";
	}
	//수용인원
	@RequestMapping("dm_dormCapacity")
	public String dm_dormCapacity() {
		
		
		
		return "/tl_a/student/dm_dormCapacity";
	}
	//기숙사 인삿말
	@RequestMapping("dm_dormIntroduction")
	public String dm_dormIntroduction() {
		
		
		
		return "/tl_a/student/dm_dormIntroduction";
	}
	//기숙사 조직도
	@RequestMapping("dm_dormOrganizationChart")
	public String dm_dormOrganizationChart() {
		
		
		
		return "/tl_a/student/dm_dormOrganizationChart";
	}
	// 찾아오시는 길
	@RequestMapping("dm_dormSearchMap")
	public String dm_dormSearchMap() {
		
		
		
		return "/tl_a/student/dm_dormSearchMap";
	}
	// 선발안내
	@RequestMapping("dm_dormSelectionGuide")
	public String dm_dormSelectionGuide() {
		
		
		
		return "/tl_a/student/dm_dormSelectionGuide";
	}
	// 거리배점표
	@RequestMapping("dm_streetDistribution")
	public String dm_streetDistribution() {
		
		
		return "/tl_a/student/dm_streetDistribution";
	}
	
	@RequestMapping("dm_paymentMoney")
	public String dm_paymentMoney() {
		
		
		
		return "/tl_a/student/dm_paymentMoney";
	}
	
	@RequestMapping("dm_dormPosted")
	public String dm_dormPosted(Model model) {
		
		model.addAttribute("joinDormInfoBySemesterPk", dormStudentServiceDm.semesterByProgressState());
		
		return "/tl_a/student/dm_dormPosted";
	}
	@RequestMapping("dm_dormApplyStudentPage")
	public String dm_dormApplyStudentPage() {
		
		
		return "/tl_a/student/dm_dormApplyStudentPage";
	}
	
}
