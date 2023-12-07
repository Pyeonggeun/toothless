package com.mkfactory.toothless.e.freeboardcounsel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.freeboardcounsel.service.FreeboardCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/freeboardCounsel/*")
public class FreeboardCounselController {

	@Autowired
	FreeboardCounselServiceImpl  freeboardCounselService;
	
	//작성글이 리스팅 되야하는 자유게시판 페이지
	@RequestMapping("freeboardCounselPage")
	public String freeboardCounsel(Model model, FreeboardDto paraFreeboardDto) {
		
		List<Map<String, Object>> combinedFreeboardList = freeboardCounselService.getfreeboardList();
		//게시글 목록
		model.addAttribute("combinedFreeboardList", combinedFreeboardList);
			System.out.println("상담게시판 메인페이지 리스팅 완료 ");
			
		//조회수 기준 베스트 글 목록
		List<Map<String, Object>> bestFreeboardPostList = freeboardCounselService.getBestFreeboardPost();
		model.addAttribute("bestFreeboardPostList",bestFreeboardPostList);
		
		//총게시물 수 뽑아오기 
		int countedPost = freeboardCounselService. selectFreeboardCount(paraFreeboardDto);
		model.addAttribute("countedPost", countedPost);	
			
		return "tl_e/freeboardCounsel/freeboardCounselPage";
	}
	
	//자유게시판 글 작성 페이지
	@RequestMapping("createFreeboardPostsPage")
	public String createFreeboardPostsPage() {
		  
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	 }
	
	//자유게시판 글 작성한 내용 dto에 집어넣는 프로세스 
	@RequestMapping("createFreeboardPostsProcess")
	public String createFreeboardPostsProcess(FreeboardDto paraFreeboardDto) {
			System.out.println("createFreeboardPostsProcess 시작");
		freeboardCounselService.createFreeboardPostsProcess (paraFreeboardDto);
			System.out.println("createFreeboardPostsProcess 완료");
		return "tl_e/freeboardCounsel/createFreeboardPostsComplete";
	}
	
	//자유게시판 상세 글보기 페이지
	@RequestMapping("readFreeboardPostPage")
	public String readFreeboardPostPage(Model model, int id) {
		
		//조회수 카운트
		freeboardCounselService.readCount(id);
		
		Map<String, Object> pickpostMap = freeboardCounselService.pickPost(id);
		model.addAttribute("pickpostMap", pickpostMap);

		return "tl_e/freeboardCounsel/readFreeboardPostPage";
	}
	
	
	
	//자유게시판 글 수정 페이지
	@RequestMapping("updateFreeboardPostPage")
	public String updateFreeboardPostPage(Model model, int id) {
		
		model.addAttribute("pickpostMap",freeboardCounselService.pickPost(id));
		
		return "./tl_e/freeboardCounsel/updateFreeboardPostPage";
	}
	
	//자유게시판 글 수정 프로세스
	@RequestMapping("updateFreeboardPostProcess")
	public String updateFreeboardPostProcess(FreeboardDto paraFreeboardDto) {
			
		freeboardCounselService.updateFreeboardPost(paraFreeboardDto);
			
		return "redirect: ./readFreeboardPostPage?id=" + paraFreeboardDto.getId();
	}
	//자유게시판 글 삭제 프로세스
	@RequestMapping("deleteFreeboardPostProcess")
	public String deleteFreeboardPostProcess(int id) {
		
		freeboardCounselService.deleteFreeboardPost(id);
		
		return "redirect:./freeboardCounselPage";
	}
	
	//자유게시판에서 학생계정 로그아웃 하기
		@RequestMapping("logoutProcess")
		public String logoutProcess(HttpSession session) {
			session.invalidate();
			return "redirect:../../another/student/loginPage";
		}
	

}
