package com.mkfactory.toothless.e.notice.mapper;

import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;

public interface NoticeSqlMapper {
	
	public int createNoticePk();
	// 공지사항 등록
	public void insertNoticeArticle(NoticeBoardDto noticeBoardDto);
	// 공지사항 이미지 등록
	public void insertNoticeImage(NoticeImageDto noticeImageDto);
}
