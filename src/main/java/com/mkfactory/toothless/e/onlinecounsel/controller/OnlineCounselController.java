package com.mkfactory.toothless.e.onlinecounsel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.OnlineCounselReplyDto;
import com.mkfactory.toothless.e.dto.OnlineCounselSurveyDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;
import com.mkfactory.toothless.e.onlinecounsel.service.OnlineCounselService;


@Controller
@RequestMapping("/tl_e/onlineCounsel/*")
public class OnlineCounselController {

	@Autowired
	private OnlineCounselService onlineCounselService;
	
	@Autowired
	private NoticeServiceImpl noticeServiceImpl;
	
	@Autowired
	private GroupCounselStaffServiceImpl groupCounselStaffServiceImpl;
	
	
	
	// 모든 엔트리 출력
//  List<Map<String, Object>> testList = onlineCounselService.getAllCounselListByStudentPk(studentPk);
//  Map<String, Object> testMap = testList.get(0);
//  for (Map.Entry<String, Object> entry : testMap.entrySet()) {
//      String key = entry.getKey();
//      Object value = entry.getValue();
//      System.out.println("Key: " + key + ", Value: " + value);
//  }
	
	
	
	
	//	****	학생 메인페이지		****
	
	
	@RequestMapping("onlineCounselMainPage")
	public String onlineCounselMainPage() {
		
		
		return "tl_e/onlineCounsel/onlineCounselMainPage";
	}
	
	
	@RequestMapping("studentMyCounselPage")
	public String studentMyCounselPage(HttpSession session, Model model) {
		
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = studentInfoDto.getStudent_pk();
		model.addAttribute("counselList", onlineCounselService.getAllCounselListByStudentPk(studentPk));
		

		return "tl_e/onlineCounsel/studentMyCounselPage";
	}
	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		
		return "redirect:../../another/student/loginPage";
	}
	
	
	
	//		******** 상담 등록 ********
	
	@RequestMapping("writeOnlineCounselPage")
	public String writeOnlineCounselPage(Model model) {
		
		model.addAttribute("category", onlineCounselService.getAllCategory());
		
		return "tl_e/onlineCounsel/writeOnlineCounselPage";
	}
	
	
	@RequestMapping("writeOnlineCounselProcess")
	public String writeOnlineCounselProcess(OnlineCounselBoardDto onlineCounselBoardDto) {
		
		onlineCounselService.writeOnlineCounsel(onlineCounselBoardDto);
		
		return "redirect:./studentMyCounselPage";
	}
	
	

	//		**** 학생 - 본인이 작성한 상담 읽기 ****
	
	@RequestMapping("readCounselPage")
	public String readCounselPage(int counsel_pk, Model model) {
		
		model.addAttribute("replyDtoList", onlineCounselService.getOnlineCounselReplyList(counsel_pk));
		model.addAttribute("targetCounselDto", onlineCounselService.readCounsel(counsel_pk));
		
		return "tl_e/onlineCounsel/readCounselPage";
	}
	
	@RequestMapping("writeOnlineCounselSurveyPage")
	public String writeOnlineCounselSurveyPage(int online_counsel_board_id, Model model) {
		
		
		model.addAttribute("replyDtoList", onlineCounselService.getOnlineCounselReplyList(online_counsel_board_id));
		model.addAttribute("online_counsel_board_id", online_counsel_board_id);
		return "tl_e/onlineCounsel/writeOnlineCounselSurveyPage";
	}
	
	
	@RequestMapping("writeOnlineCounselSurveyProcess")
	public String writeOnlineCounselSurveyProcess(OnlineCounselSurveyDto onlineCounselSurveyDto) {
		
		onlineCounselService.writeOnlineCounselSurvey(onlineCounselSurveyDto);
		return "redirect:./readCounselPage?counsel_pk=" + onlineCounselSurveyDto.getOnline_counsel_board_id();
	}
	
	
	
	
	
	
	
	
	
	//	********	상담원 메인페이지	********

	@RequestMapping("counselorOnlineCounselMainPage")
	public String counselorOnlineCounselMainPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		model.addAttribute("counselList", onlineCounselService.getCounselInfoList(externalPk));
		
		return "tl_e/onlineCounsel/counselorOnlineCounselMainPage";
	}
	



	@RequestMapping("counselorOnlineCounselReadCounselPage")
	public String counselorOnlineCounselReadCounselPage(int counsel_pk, Model model) {
		
		System.out.println(counsel_pk + "글 번호");
		model.addAttribute("replyDtoList", onlineCounselService.getOnlineCounselReplyList(counsel_pk));
		model.addAttribute("targetCounselDto", onlineCounselService.readCounsel(counsel_pk));
		return "tl_e/onlineCounsel/counselorOnlineCounselReadCounselPage";
	}
	
	
	
	
	@RequestMapping("writeOnlineCounselReplyProcess")
	public String writeOnlineCounselReplyProcess(OnlineCounselReplyDto onlineCounselReplyDto) {
		
		onlineCounselService.writeOnlineCounselReply(onlineCounselReplyDto);
		
		
		return "redirect:./counselorOnlineCounselReadCounselPage?counsel_pk=" + onlineCounselReplyDto.getOnline_counsel_board_id();
	}
	
	

	

	
	

}	







