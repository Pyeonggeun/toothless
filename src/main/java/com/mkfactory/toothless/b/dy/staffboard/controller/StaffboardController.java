package com.mkfactory.toothless.b.dy.staffboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dy.staffboard.service.StaffboardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_b/dy/*")
public class StaffboardController {

	@Autowired
	private StaffboardServiceImpl staffboardService;
	
	//교직원용 게시판 페이지
	@RequestMapping("staffboardPage")
	public String staffboardPage(Model model) {
		
		List<Map<String, Object>> staffboardList = staffboardService.getBoardContentsInfo();
		
		model.addAttribute("list", staffboardList);
		
		return "tl_b/dy/staffboardPage";
	}
	
	//글쓰기
	@RequestMapping("writeTextPage")
	public String writeTextPage() {
		
		
		return "tl_b/dy/writeTextPage";
	}
	//글 작성 프로세스
	@RequestMapping("writeTextProcess")
	public String writeTextProcess(HttpSession session, StaffboardDto params) {
		
		System.out.println(params.getTitle());
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		int staffPk = sessionStaffInfo.getStaff_pk();
		
		params.setStaff_pk(staffPk);
		
		staffboardService.StaffboardText(params);
		
		return "redirect:./staffboardPage";
	}

	//작성 글 보기
	@RequestMapping("readTextPage")
	public String readTextPage(Model model, int staffboard_pk) {
		
		staffboardService.createTextReadCount(staffboard_pk);
		
		Map<String, Object> readText = staffboardService.readContentsDetailInfo(staffboard_pk);
		
		model.addAttribute("readText", readText);
		
		
		return "tl_b/dy/readTextPage";
	}
	// 작성 글 삭제
	@RequestMapping("deleteTextProcess")
	public String deleteTextProcess(int staffboard_pk) {
		
		staffboardService.removeText(staffboard_pk);
		
		return "redirect:./staffboardPage";
	}
	// 작성 글 수정하기
	@RequestMapping("modifyTextPage")
	public String modifyTextPage(Model model, int staffboard_pk) {
		
		Map<String, Object> readText = staffboardService.readContentsDetailInfo(staffboard_pk);
		
		model.addAttribute("readText", readText);
		
		return "tl_b/dy/modifyTextPage";
	}
	// 작성 글 수정 프로세스
	@RequestMapping("modifyTextProcess")
	public String modifyTextProcess(StaffboardDto params) {
		
		staffboardService.modifyTextPage(params);
		
		return "redirect:./readTextPage?staffboard_pk="+params.getStaffboard_pk();
	}
	
	
}




















