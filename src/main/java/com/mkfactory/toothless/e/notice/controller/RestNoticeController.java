package com.mkfactory.toothless.e.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;

@RestController
@RequestMapping("/tl_e/notice/*")
public class RestNoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	// 공지사항 리스트 출력
	@RequestMapping("getNoticeList")
	public RestResponseDto getNoticeList(String searchType, String searchWord) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(noticeService.getNoticeList(searchType, searchWord));
		return restResponseDto;
	}
	
	// 공지사항 쓰기
	@RequestMapping("writeNotice")
	public RestResponseDto writeNotice(NoticeBoardDto noticeBoardDto, @RequestParam("imageFiles") MultipartFile[] imageFiles) {
		
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
		
		RestResponseDto restResponseDto = new RestResponseDto();
		restResponseDto.setResult("success");
		
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
