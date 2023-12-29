package com.mkfactory.toothless.b.dy.staffboard.controller;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardImageDto;
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
	public String staffboardPage(Model model, String searchType, String searchWord) {
		
		List<Map<String, Object>> staffboardList = staffboardService.getBoardContentsInfo(searchType, searchWord);
		
		model.addAttribute("list", staffboardList);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		
		
		return "tl_b/dy/staffboardPage";
	}
	
	//글쓰기
	@RequestMapping("writeTextPage")
	public String writeTextPage() {
		
		return "tl_b/dy/writeTextPage";
	}
	//글 작성 프로세스
	@RequestMapping("writeTextProcess")
	public String writeTextProcess(HttpSession session, StaffboardDto params, MultipartFile[] imgFiles) {
		
		List<StaffboardImageDto> staffboardImageDtoList = new ArrayList<>();
		
		//파일저장
		if(imgFiles != null) {
			for(MultipartFile multipartFile : imgFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
		//날짜별 폴더 생성
				
				String rootPath = "/Users/doxhi/uploadFiles/staffboard/";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String todayPath = sdf.format(new Date()); 
				
				File todayFolderForCreate = new File(rootPath + todayPath); 
				
				if(!todayFolderForCreate.exists()) {		
					todayFolderForCreate.mkdirs();			
				}
				
				
				String originalFileName = multipartFile.getOriginalFilename();
		//파일충돌회피
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName = uuid + "_" + currentTime; 
				
		//확장자
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				fileName += ext;	
				
				try {
					multipartFile.transferTo(new File(rootPath+todayPath+fileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				StaffboardImageDto staffboardImageDto = new StaffboardImageDto();
				staffboardImageDto.setImg_link(todayPath + fileName);
				staffboardImageDto.setOriginal_link(originalFileName);
				
				staffboardImageDtoList.add(staffboardImageDto);
				
			}
		}
		
		
		System.out.println(params.getTitle());
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		int staffPk = sessionStaffInfo.getStaff_pk();
		
		params.setStaff_pk(staffPk);
		
		staffboardService.writeStaffboardText(params, staffboardImageDtoList); //파라메터에 추가로 삼미지DtoList 추
		
		return "redirect:./staffboardPage";
	}

	//작성 글 보기
	@RequestMapping("readTextPage")
	public String readTextPage(HttpSession session, Model model, int staffboard_pk) {
		
		staffboardService.createTextReadCount(staffboard_pk);
		
		Map<String, Object> readText = staffboardService.readContentsDetailInfo(staffboard_pk, true);
		
		List<Map<String, Object>> replyList = staffboardService.getContentReplyInfo(staffboard_pk);
		
		
		model.addAttribute("readText", readText);
		model.addAttribute("replyList", replyList);
		
		//좋아요
		
		StaffboardLikeDto likeDto = new StaffboardLikeDto();
		
		likeDto.setStaffboard_pk(staffboard_pk);
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		if(sessionStaffInfo != null) {
			
		
		int staffPk = sessionStaffInfo.getStaff_pk();
		
		likeDto.setStaff_pk(staffPk);
		
		int count = staffboardService.checkLike(likeDto);
		
		model.addAttribute("count", count);
		//좋아요 수
		int likeCount = staffboardService.likeCount(staffboard_pk);
		
		System.out.println(likeCount);
		
		model.addAttribute("likeCount", likeCount);
		//댓글 수
		int replyCountInContent = staffboardService.replyCountInContent(staffboard_pk);
		
		model.addAttribute("replyCountInContent", replyCountInContent);
		
		return "tl_b/dy/readTextPage";
		}else {
			return "tl_b/dy/staffboardPage";
		}
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
		
		Map<String, Object> readText = staffboardService.readContentsDetailInfo(staffboard_pk, false);
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
	// 좋아요 프로세스 입력되면 서비스에서 좋아요 체크/블랭크
	@RequestMapping("addLikeProcess")
	public String addLikeProcess(StaffboardLikeDto params) {

		System.out.println(params.getStaff_pk());
		System.out.println(params.getStaffboard_pk());
		staffboardService.addLike(params);

		
		return "redirect:./readTextPage?staffboard_pk="+ params.getStaffboard_pk();
	}
	
	@RequestMapping("canselLikeProcess")
	public String canselLikeProcess(StaffboardLikeDto params) {
	
		staffboardService.canselLike(params);

		return "redirect:./readTextPage?staffboard_pk="+ params.getStaffboard_pk();
	}
	
}




















