package com.mkfactory.toothless.e.common.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.freeboardcounsel.service.FreeboardCounselServiceImpl;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;
import com.mkfactory.toothless.e.onlinecounsel.service.OnlineCounselService;

@Controller
@RequestMapping("/tl_e/commons/*")
public class CounselCommonsStaffController {

	@Autowired
	GroupCounselStaffServiceImpl groupCounselStaffServiceImpl;
	@Autowired
	NoticeServiceImpl noticeServiceImpl;
	@Autowired
	FreeboardCounselServiceImpl freeboardCounselServiceImpl;
	@Autowired
	OnlineCounselService onlineCouneslService;
	
	@RequestMapping("counselCenterStaffMainPage")
	public String counselCenterStaffMainPage(HttpSession session, Model model ) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		
		if(sessionStaffInfo == null) {
			return "tl_e/commons/loginRequired";
		}else {
			

			//공지사항
			model.addAttribute("noticeList", onlineCouneslService.getNoticeListSpecificNum());
			
			// 집단상담
			model.addAttribute("groupCounselList", onlineCouneslService.getGroupCounselListSpecificNum());

			// 자유게시판
			model.addAttribute("freeboardList", onlineCouneslService.getFreeboardListSpecificNum());
			
			return "tl_e/commons/counselCenterStaffMainPage";
		}
		
	}

	
	
	
}
