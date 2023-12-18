package com.mkfactory.toothless.e.notice.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;

@RestController
@RequestMapping("/tl_e/notice/*")
public class RestNoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	// 공지사항 리스트 출력
	@RequestMapping("getNoticeList")
	public RestResponseDto getNoticeList() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(noticeService.getNoticeList(null, null));
		return restResponseDto;
	}
	
	// 댓글쓰기
	@RequestMapping("writeComment")
	public RestResponseDto writeComment(HttpSession session, NoticeCommentDto noticeCommentDto) {
		RestResponseDto restResponseDto = new RestResponseDto();
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = sessionStudentInfo.getStudent_pk();
		noticeCommentDto.setStudent_pk(studentPk);
		
		noticeService.insertNoticeComment(noticeCommentDto);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	// 댓글삭제
	@RequestMapping("deleteComment")
	public RestResponseDto deleteComment(int id) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		noticeService.deleteNoticeComment(id);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	// 댓글리스트 출력
	@RequestMapping("getCommentList")
	public RestResponseDto getCommentList(int notice_id) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setData(noticeService.selectCommentByNotice_Id(notice_id));
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}

	
	
	
}
