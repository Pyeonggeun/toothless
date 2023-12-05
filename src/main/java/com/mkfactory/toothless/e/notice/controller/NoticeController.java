package com.mkfactory.toothless.e.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("/tl_e/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	// 공지사항 메인페이지
	@RequestMapping("noticeMainPage")
	public String noticeMainPage(Model model) {
		model.addAttribute("list", noticeService.getNoticeList());
		return "tl_e/notice/noticeMainPage";
	}
	// 공지사항 글쓰기 페이지
	@RequestMapping("writeNoticeArticlePage")
	public String writeNoticeArticlePage() {
		
		return "tl_e/notice/writeNoticeArticlePage";
	}
	// 공지사항 업로드 프로세스
	@RequestMapping("writeNoticeArticleProcess")
	public String writeNoticeArticleProcess(NoticeBoardDto noticeBoardDto, MultipartFile[] imageFiles) {
		
		List<NoticeImageDto> noticeImageDtoList = new ArrayList<>();
		
		if(imageFiles != null) {
			for(MultipartFile multipartFile : imageFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				String rootPath = "c:/uploadFiles/detailImage/";
				
				// 날짜별 폴더 생성.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd/");
				String todayPath = sdf.format(new Date());
				
				File todayFolderForCreate = new File(rootPath + todayPath);
				
				if(!todayFolderForCreate.exists()) {
					todayFolderForCreate.mkdirs();
				}
				
				String orginalFileName = multipartFile.getOriginalFilename();
				
				// 파일명 충돌 회피 - 랜덤, 시간 조합
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName = uuid + "_" + currentTime;
				
				// 확장자 추출
				String ext = orginalFileName.substring(orginalFileName.lastIndexOf("."));
				fileName += ext;
				
				System.out.println("test:" + rootPath + todayPath + fileName);
				
				try {
					multipartFile.transferTo(new File(rootPath + todayPath + fileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				NoticeImageDto noticeImageDto = new NoticeImageDto();
				noticeImageDto.setNotice_image_link(todayPath + fileName);
				noticeImageDtoList.add(noticeImageDto);
				
			}
		}
		noticeService.insertNoticeArticle(noticeBoardDto, noticeImageDtoList);
		
		return "redirect:./noticeMainPage";
	}
	// 공지사항 상세글보기
	@RequestMapping("readNoticeBoardPage")
	public String readNoticeBoardPage(Model model, int id) {
		noticeService.increaseReadCount(id);

		model.addAttribute("list", noticeService.getNoticeBoardDetaiilById(id));
		model.addAttribute("cList", noticeService.selectCommentByNotice_Id(id));
		return "tl_e/notice/readNoticeBoardPage";
	}
	// 공지사항 삭제
	@RequestMapping("deleteNoticeArticleProcess")
	public String deleteNoticeArticleProcess(int id) {
		noticeService.deleteNoticeArticle(id);
		return "redirect:./noticeMainPage";
	}
	// 공지사항 수정
	@RequestMapping("updateNoticeArticlePage")
	public String updateNoticeArticlePage(Model model, int id) {
		model.addAttribute("list", noticeService.getNoticeBoardDetaiilById(id));
		return "tl_e/notice/updateNoticeArticlePage";
	}
	// 공지사항 수정 프로세스
	@RequestMapping("updateNoticeArticleProcess")
	public String updateNoticeArticleProcess(NoticeBoardDto noticeBoardDto) {
		noticeService.updateNoticeArticle(noticeBoardDto);
		return "redirect:./readNoticeBoardPage?id=" + noticeBoardDto.getId();
	}
	// 공지사항 댓글 작성
	@RequestMapping("writeNoticeCommentProcess")
	public String writeNoticeCommentProcess(NoticeCommentDto noticeCommentDto) {
		noticeService.insertNoticeComment(noticeCommentDto);
		return "redirect:./readNoticeBoardPage?id=" + noticeCommentDto.getNotice_id();
	}
	// 공지사항 댓글 삭제
	@RequestMapping("deleteNoticeArticleCommentProcess")
	public String deleteNoticeArticleCommentProcess(NoticeCommentDto noticeCommentDto) {
		noticeService.deleteNoticeComment(noticeCommentDto.getId());
		return "redirect:./readNoticeBoardPage?id=" + noticeCommentDto.getNotice_id(); 
	}
}
