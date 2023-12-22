package com.mkfactory.toothless.b.ty.studentboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.b.dto.StudentboardDto;
import com.mkfactory.toothless.b.dto.StudentboardLikeDto;
import com.mkfactory.toothless.b.dto.StudentboardReplyDto;
import com.mkfactory.toothless.b.ty.staffboard.service.StaffBoardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_b/ty/*")
public class StudentBoardController {
	
	@Autowired
	private StaffBoardServiceImpl staffBoardService;
	
	@RequestMapping("studentBoardTestPage")
	public String studentBoardTestPage(Model model, StudentboardLikeDto likeDto, StudentboardDto params, 
			   String searchType,
			   String searchWord
				){
		int total = staffBoardService.totalList(params);
		int aa = staffBoardService.upAndDownCount(likeDto);
		
		
		List<Map<String, Object>>list=staffBoardService.boardNoticeList(searchType, searchWord);
		List<Map<String, Object>>readList = staffBoardService.bestRead();
		
		model.addAttribute("aa" , aa);
		model.addAttribute("noticeList", list);
		model.addAttribute("total", total);
		model.addAttribute("readList", readList);
		
		System.out.println(list);
		System.out.println("aa =" + aa);
		System.out.println("total =" + total);
		
		return"tl_b/ty/studentBoardTestPage";
		
	}
	
	
	
	
	
	
	
	
	@RequestMapping("studentBoardPage")
	public String studentBoardPage(Model model, StudentboardLikeDto likeDto, StudentboardDto params,
		   String searchType,
		   String searchWord
			){
		
		
		int total = staffBoardService.totalList(params);
		int aa = staffBoardService.upAndDownCount(likeDto);
		
		List<Map<String, Object>>list=staffBoardService.boardNoticeList(searchType, searchWord);
		List<Map<String, Object>>readList = staffBoardService.bestRead();
		
		model.addAttribute("aa" , aa);
		model.addAttribute("noticeList", list);
		model.addAttribute("total", total);
		model.addAttribute("readList", readList);
		
		System.out.println(list);
		System.out.println("aa =" + aa);
		System.out.println("total =" + total);
		
		return"tl_b/ty/studentBoardPage";
	}
	
	@RequestMapping("studentAndStaffBoardReadPage")
	public String studentAndStaffBoardReadPage(Model model, int id, HttpSession session, StudentboardReplyDto params) {
		staffBoardService.increaseCount(id);
		

		List<Map<String, Object>>readList = staffBoardService.bestRead();
		List<Map<String, Object>> reply = staffBoardService.replyList(id);
		Map<String, Object> read = staffBoardService.viewDtls(id);
		
		
		StudentboardLikeDto likeDto = new StudentboardLikeDto();
		likeDto.setStudentboard_pk(id);
		
		StudentInfoDto sessionStudentInfo =(StudentInfoDto) session.getAttribute("sessionStudentInfo");
		if(sessionStudentInfo != null) {
			int studentPk = sessionStudentInfo.getStudent_pk();
			likeDto.setStudent_pk(studentPk);
		}
			
		
		
		
		int replyCount = staffBoardService.replyCount(id);
		model.addAttribute("replyCount",replyCount);
		
		int count = staffBoardService.count(likeDto);
		model.addAttribute("count",count);
		
		int aa = staffBoardService.upAndDownCount(likeDto);
		model.addAttribute("aa" , aa);

		model.addAttribute("read", read);
		model.addAttribute("reply", reply);
		model.addAttribute("readList", readList);
		
		return"tl_b/ty/studentAndStaffBoardReadPage";
	}
	
	@RequestMapping("studentReplyProcess")
	public String studentReplyProcess (HttpSession session, StudentboardReplyDto params) {
		StudentInfoDto sessionStudentInfo =(StudentInfoDto) session.getAttribute("sessionStudentInfo");
		int studentPk = sessionStudentInfo.getStudent_pk();
		params.setStudent_pk(studentPk);
				
				
		staffBoardService.boardReplay(params);
		return"redirect:./studentAndStaffBoardReadPage?id="+params.getStudentboard_pk();
	}
	
	@RequestMapping("studentReplyDeleteProcess")
	public String studentReplyDeleteProcess(int id, int deleteId, int boardPk) {
		staffBoardService.deleteBoardReply(id);
		return"redirect:./studentAndStaffBoardReadPage?id="+ boardPk;
		
	}
	@RequestMapping("StudentlogoutProcess")
	public String StudentlogoutProcess(HttpSession session) {
		session.invalidate();
		return"redirect:./studentBoardPage";
	}
	@RequestMapping("likeProcess")
	public String likeProcess(StudentboardLikeDto params) {
		staffBoardService.studentBoardLike(params);
		
		return"redirect:./studentAndStaffBoardReadPage?id=" + params.getStudentboard_pk();
	}
	
	
	
}