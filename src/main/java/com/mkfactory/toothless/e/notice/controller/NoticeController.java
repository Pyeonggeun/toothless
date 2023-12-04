package com.mkfactory.toothless.e.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("/tl_e/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;

	@RequestMapping("noticeMainPage")
	public String noticeMainPage() {
		
		return "tl_e/notice/noticeMainPage";
	}
	
	@RequestMapping("writeNoticeArticlePage")
	public String writeNoticeArticlePage() {
		
		return "tl_e/notice/writeNoticeArticlePage";
	}
	
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
		
		return "tl_e/notice/noticeMainPage";
	}
}
