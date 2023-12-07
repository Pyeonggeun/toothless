package com.mkfactory.toothless.b.dy.staffboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
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
		
		List<Map<String, Object>> replyList = staffboardService.getContentReplyInfo(staffboard_pk);
		
		model.addAttribute("readText", readText);
		model.addAttribute("replyList", replyList);
		
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
		
		staffboardService.modifyText(params);
		
		return "redirect:./readTextPage?staffboard_pk="+params.getStaffboard_pk();
	}
	
	// 댓글 등록
	@RequestMapping("writeReplyProcess")
	public String writeReplyProcess(HttpSession session, StaffboardReplyDto params, int staffboard_pk) {

		//session으로 직원유저번호 가져와
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		//staffPk 변수로 메모리를 받고
		int staffPk = sessionStaffInfo.getStaff_pk();
		//staffPk의 정보로 set을 통해 직원유저번호 보냄
		params.setStaff_pk(staffPk);
		
		//set을 통해 글번호 보냄 
		params.setStaffboard_pk(staffboard_pk);
		
		
		staffboardService.writeReply(params);
		
		System.out.println(params.getStaffboard_reply_pk());
		
		return "redirect:./readTextPage?staffboard_pk="+params.getStaffboard_pk();
	}
	
	// 댓글 삭제
	@RequestMapping("deleteReplyProcess")
	public String deleteReplyProcess(StaffboardReplyDto params, int staffboard_pk) {
		
		staffboardService.removeReply(params);
		
		return"redirect:./readTextPage?staffboard_pk="+ staffboard_pk;
	}
	//댓글 수정 페이지
	@RequestMapping("modifyReplyPage")
	public String modifyReplyPage(Model model, int staffboard_reply_pk) {
	
		Map<String, Object> replyInfo = staffboardService.getReply(staffboard_reply_pk);
		
		model.addAttribute("replyInfo", replyInfo);
				
		return "tl_b/dy/modifyReplyPage";
	}
	
	//댓글 수정 프로세스(컴플릿)
	@RequestMapping("modifyReplyProcess")
	public String modifyReplyProcess(StaffboardReplyDto params) {
		System.out.println(params.getStaffboard_pk());
		
				
		staffboardService.modifyReply(params);
		
		
		
		return "redirect:./readTextPage?staffboard_pk="+ params.getStaffboard_pk();
	}
	
}




















