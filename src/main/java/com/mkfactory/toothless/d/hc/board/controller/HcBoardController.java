package com.mkfactory.toothless.d.hc.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.NoticeStaffBoardDto;
import com.mkfactory.toothless.d.dto.QnABoardDto;
import com.mkfactory.toothless.d.hc.board.service.HcBoardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_d/hc_board/*")
public class HcBoardController {

	@Autowired
	private HcBoardServiceImpl hcBoardService;
	
	
	@RequestMapping("QnABoardPage")
	public String QnABoardPage(Model model) {
		List<Map<String, Object>> list = hcBoardService.getArticleList();
		model.addAttribute("list", list);
		return "tl_d/hc_board/QnABoardPage";
	}
	
	//페이지 보여주기용
	@RequestMapping("BoardWritePage")
	public String BoardWritePage() {
		
		return "tl_d/hc_board/BoardWritePage";
	}
	
	
	
	//요청받은 키값
	@RequestMapping("writeProcess")
	public String writeProcess(HttpSession session,  QnABoardDto ras) {
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffpk = sessionStaffInfo.getStaff_pk();
		ras.setStaff_pk(staffpk);	
		
		hcBoardService.ramses(ras);	
		
		//글쓰기 기능실행 
		
		
		return"redirect:./QnABoardPage";
	}
	@RequestMapping("readPage")
	public String readPage(Model model, int board_pk) {
		
		
		Map<String, Object> map = hcBoardService.getArticle(board_pk);
		
		model.addAttribute("roman", map);
		
		return "tl_d/hc_board/readPage";
	}
	@RequestMapping("deleteProcess")
	public String deleteProcess(int board_pk) {
		
		hcBoardService.deletegam(board_pk);
		
		return"redirect:./QnABoardPage";
		
	}
	
	@RequestMapping("updatePage")
	public String updatePage(Model model, int board_pk) {
		
		Map<String, Object> map = hcBoardService.getArticle(board_pk);
		model.addAttribute("soso", map);

		return "tl_d/hc_board/updatePage";
	}
	
	@RequestMapping("updateProcess")
	public String updateProcess(QnABoardDto ram) {
		
		hcBoardService.updateart(ram);
		
		return "redirect:./readPage?board_pk="+ram.getBoard_pk();
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////	
	
	@RequestMapping("noticeMainPage")
	public String noticeMainPage(Model model, HttpSession session, NoticeStaffBoardDto Params) {

		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");

		if(sessionStaffInfo == null) {
			return"redirect:../../another/staff/loginPage";
			
		}
			 
		List<Map<String, Object>> list = hcBoardService.noticeList();
		
		model.addAttribute("noticelist", list);
		
		return "tl_d/hc_board/noticeMainPage";
	}
	@RequestMapping("noticeWritePage")
	public String noticeWritePage(HttpSession session) {
		
		
		return "tl_d/hc_board/noticeWritePage";
	}
	
	@RequestMapping("noticeWriteProcess")
	public String noticeWriteProcess(NoticeStaffBoardDto ruru) {
		
		hcBoardService.rara(ruru);
		
		return "redirect:./noticeMainPage";
	}
	@RequestMapping("readNoticePage")
	public String readNoticePage(Model model, int id) {
		
		Map<String, Object> map = hcBoardService.getnotice(id);
		
		model.addAttribute("hoho", map);
		
		return "tl_d/hc_board/readNoticePage";
	}
	@RequestMapping("deleteNoticeProcess")
	public String deleteNoticeProcess(int notice_board_pk) {
		
		hcBoardService.deleteno(notice_board_pk);
		
		return "redirect:./noticeMainPage";
		
	}
	@RequestMapping("updateNoticeWritePage")
	public String updateNoticeWritePage(Model model, int notice_board_pk) {
	
		
		Map<String, Object> qwer = hcBoardService.getnotice(notice_board_pk);
		
		model.addAttribute("qwer",qwer);
		return "tl_d/hc_board/updateNoticeWritePage";
		
	}
	@RequestMapping("noticeUpdateProcess")
	public String noticeUpdateProcess(NoticeStaffBoardDto paw) {
		
		int board_pk = paw.getNotice_board_pk();
		hcBoardService.upup(paw);
		
		return "redirect:./readNoticePage?id="+board_pk;
	}
	
	@RequestMapping("noticeMainPageForStudent")
	public String StudentPage(Model model) {
		List<Map<String, Object>> list = hcBoardService.noticeList();
		model.addAttribute("noticelist", list);
		
	return "tl_d/hc_board/noticeMainPageForStudent";
			
	}
	
	@RequestMapping("readNoticePageForStudent")
	public String readNoticePageForStudent(Model model, int id) {
		
		Map<String, Object> map = hcBoardService.getnotice(id);
		
		model.addAttribute("hoho", map);
		
		return "tl_d/hc_board/readNoticePageForStudent";
	}
	
	@RequestMapping("QnABoardPageForStudent")
	public String QnABoardPageForStudent(Model model) {
		List<Map<String, Object>> list = hcBoardService.getArticleList();
		model.addAttribute("list", list);
		return "tl_d/hc_board/QnABoardPageForStudent";
	}
	
	@RequestMapping("readPageForStudent")
	public String readPageForStudent(Model model, int board_pk) {
		
		
		Map<String, Object> map = hcBoardService.getArticle(board_pk);
		
		model.addAttribute("roman", map);
		
		return "tl_d/hc_board/readPageForStudent";
	}
	
	
	
	
	
	
	
	
	
	
}
