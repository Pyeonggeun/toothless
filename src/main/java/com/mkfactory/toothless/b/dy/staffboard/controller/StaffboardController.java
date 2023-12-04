package com.mkfactory.toothless.b.dy.staffboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.StaffNoticeboardDto;
import com.mkfactory.toothless.b.dy.staffboard.service.StaffboardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_b/dy/*")
public class StaffboardController {

	@Autowired
	private StaffboardServiceImpl staffboardService;
	
	//교직원용 게시판 페이지
	@RequestMapping("staffNoticeboardPage")
	public String staffNoticeboardPage(Model model) {
		
		List<Map<String, Object>> staffboardList = staffboardService.getBoardContentsInfo();
		
		model.addAttribute("list", staffboardList);
		
		return "tl_b/dy/staffNoticeboardPage";
	}
	
	//글쓰기
	@RequestMapping("writeTextPage")
	public String writeTextPage() {
		
		
		return "tl_b/dy/writeTextPage";
	}
	//글 작성 프로세스
	@RequestMapping("writeTextProcess")
	public String writeTextProcess(HttpSession session, StaffNoticeboardDto params) {
		
		System.out.println(params.getTitle());
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		int staffPk = sessionStaffInfo.getStaff_pk();
		
		params.setStaff_pk(staffPk);
		
		staffboardService.StaffboardText(params);
		
		return "redirect:./staffNoticeboardPage";
	}

	//작성 글 보기
	@RequestMapping("readTextPage")
	public String readTextPage(Model model, int staff_noticeboard_pk) {
		
		staffboardService.createTextReadCount(staff_noticeboard_pk);
		
		Map<String, Object> readText = staffboardService.readContentsDetailInfo(staff_noticeboard_pk);
		
		model.addAttribute("readText", readText);
		
		
		return "tl_b/dy/readTextPage";
	}
}
