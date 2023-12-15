package com.mkfactory.toothless.a.student.dm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.student.dm.service.DormStudentServiceDm;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

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
	
	@RequestMapping("dm_dormNoticePage")
	public String dm_dormNoticePage(Model model, HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		model.addAttribute("sessionStaffInfo", sessionStaffInfo);
		model.addAttribute("noticeList", dormStudentServiceDm.dormNoticeAllList());
		
		
		return "/tl_a/student/dm_dormNoticePage";
	}
	
	@RequestMapping("dm_NoticeWritePage")
	public String dm_NoticeWritePage(HttpSession session) {
		
		
		
		
		return "/tl_a/student/dm_NoticeWritePage";
	}
	@RequestMapping("NoticeWriteProcess")
	public String NoticeWriteProcess(HttpSession session, DormNoticeDto dormNoticeDto) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(sessionStaffInfo == null) {
			
			return "redirect:../another/staff/loginPage";
			
		}else {
			int staff_pk = sessionStaffInfo.getStaff_pk();
			dormNoticeDto.setStaff_pk(staff_pk);
			
			dormStudentServiceDm.dormNoticeInsertByDormNoticeDto(dormNoticeDto);
			
			return "redirect:./dm_dormNoticePage";
		}
		
		
		
		
	}
	
	@RequestMapping("dm_NoticeArticlePage")
	public String dm_NoticeArticlePage(Model model, int dorm_notice_pk, HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		model.addAttribute("staffSession", sessionStaffInfo);
		model.addAttribute("noticeInfo", dormStudentServiceDm.dormNoticeInfoByDormNoticePk(dorm_notice_pk));
		
		
		return "/tl_a/student/dm_NoticeArticlePage";
	}
	
	@RequestMapping("noticeDeleteProcess")
	public String noticeDeleteProcess(int dorm_notice_pk) {
		
		dormStudentServiceDm.deleteDormNoticeInfoByDormNoticePk(dorm_notice_pk);
		
		return "redirect:./dm_dormNoticePage";
	}
	
}
