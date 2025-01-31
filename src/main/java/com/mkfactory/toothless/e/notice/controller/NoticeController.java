package com.mkfactory.toothless.e.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardLikeDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("/tl_e/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	// 공지사항 직원 메인페이지
	@RequestMapping("noticeMainPage_Staff")
	public String noticeMainPage_Staff(Model model, String searchType, String searchWord) {	
		model.addAttribute("list", noticeService.getNoticeList(searchType, searchWord));
		model.addAttribute("bList", noticeService.selectBestNotice());
		return "tl_e/notice/noticeMainPage_Staff";
	}
	// 공지사항 학생 메인페이지
	@RequestMapping("noticeMainPage_Student")
	public String noticeMainPage_Student(Model model, String searchType, String searchWord) {	
		model.addAttribute("list", noticeService.getNoticeList(searchType, searchWord));
		model.addAttribute("bList", noticeService.selectBestNotice());
		return "tl_e/notice/noticeMainPage_Student";
	}
	// 직원 뒤로가기
	@RequestMapping("staffReturnToMainPage")
	public String staffReturnToMainPage() {
		return "redirect:../commons/counselCenterStaffMainPage";
	}
	// 학생 뒤로가기
	@RequestMapping("studentReturnToMainPage")
	public String studentReturnToMainPage() {
		return "redirect:../commons/counselCenterStudentMainPage";
	}
	// 로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:../../another/staff/loginPage";
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
		
		return "redirect:./noticeMainPage_Staff";
	}
	// 공지사항 상세글보기
	@RequestMapping("readNoticeBoardPage_Staff")
	public String readNoticeBoardPage_Staff(Model model, int id) {
		model.addAttribute("list", noticeService.getNoticeBoardDetaiilById(id));
		model.addAttribute("cList", noticeService.selectCommentByNotice_Id(id));
		model.addAttribute("mainList", noticeService.getNoticeList(null, null));
		model.addAttribute("commentCount", noticeService.commentCountByNotice_id(id));

		noticeService.increaseReadCount(id);
		
		return "tl_e/notice/readNoticeBoardPage_Staff";
	}
	// 공지사항 상세글보기
	@RequestMapping("readNoticeBoardPage_Student")
	public String readNoticeBoardPage_Student(HttpSession session, Model model, int id) {
		if(session.getAttribute("sessionStudentInfo") != null) {
			StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
			int studentPk = studentInfoDto.getStudent_pk();
			
			NoticeBoardLikeDto noticeBoardLikeDto = new NoticeBoardLikeDto();
			noticeBoardLikeDto.setStudent_pk(studentPk);
			noticeBoardLikeDto.setNotice_id(id);
			
			model.addAttribute("likeCheck", noticeService.noticeLikeCheck(noticeBoardLikeDto));				// 추천,비추천 체크여부
			model.addAttribute("upThumbCheck", noticeService.noticeUpThumbCheck(noticeBoardLikeDto));
			model.addAttribute("downThumbCheck", noticeService.noticeDownThumbCheck(noticeBoardLikeDto));
			model.addAttribute("list", noticeService.getNoticeBoardDetaiilById(id));
			model.addAttribute("cList", noticeService.selectCommentByNotice_Id(id));
		}else {
			
			model.addAttribute("list", noticeService.getNoticeBoardDetaiilById(id));
			model.addAttribute("cList", noticeService.selectCommentByNotice_Id(id));
		}
		model.addAttribute("mainList", noticeService.getNoticeList(null, null));
		model.addAttribute("commentCount", noticeService.commentCountByNotice_id(id));

		noticeService.increaseReadCount(id);
		
		return "tl_e/notice/readNoticeBoardPage_Student";
	}
	// 공지사항 삭제
	@RequestMapping("deleteNoticeArticleProcess")
	public String deleteNoticeArticleProcess(int id) {
		noticeService.deleteNoticeArticle(id);
		return "redirect:./noticeMainPage_Staff";
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
		return "redirect:./readNoticeBoardPage_Staff?id=" + noticeBoardDto.getId();
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
	// 공지사항 추천 추가
	@RequestMapping("insertNoticeLike")
	public String insertNoticeLike(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeService.insertThumb(noticeBoardLikeDto);
		return "redirect:./readNoticeBoardPage_Student?id=" + noticeBoardLikeDto.getNotice_id();
	}
	// 공지사항 추천 삭제
	@RequestMapping("deleteNoticeLike")
	public String deleteNoticeLike(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeService.deleteNoticeLike(noticeBoardLikeDto);
		return "redirect:./readNoticeBoardPage_Student?id=" + noticeBoardLikeDto.getNotice_id();
	}
	@RequestMapping("deleteNoticeDisLike")
	public String deleteNoticeDisLike(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeService.deleteNoticeDisLike(noticeBoardLikeDto);
		return "redirect:./readNoticeBoardPage_Student?id=" + noticeBoardLikeDto.getNotice_id();
	}
}
