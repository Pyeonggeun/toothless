package com.mkfactory.toothless.e.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.mapper.NoticeSqlMapper;

@Service
public class NoticeServiceImpl {
	
	@Autowired
	private NoticeSqlMapper noticeSqlMapper;

	public void insertNoticeArticle(NoticeBoardDto noticeBoardDto, List<NoticeImageDto> noticeImageDtoList) {
		int noticePk = noticeSqlMapper.createNoticePk();
		noticeBoardDto.setId(noticePk);
		noticeSqlMapper.insertNoticeArticle(noticeBoardDto);
		
		for(NoticeImageDto noticeImageDto : noticeImageDtoList) {
			noticeImageDto.setNotice_id(noticePk);
			
			noticeSqlMapper.insertNoticeImage(noticeImageDto);
		}
	}
}
