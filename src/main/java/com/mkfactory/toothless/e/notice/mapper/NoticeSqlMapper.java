package com.mkfactory.toothless.e.notice.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardLikeDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;

public interface NoticeSqlMapper {
	
	public int createNoticePk();
	// 공지사항 등록
	public void insertNoticeArticle(NoticeBoardDto noticeBoardDto);
	// 공지사항 이미지 등록
	public void insertNoticeImage(NoticeImageDto noticeImageDto);
	// 공지시항 리스트 출력
	public List<NoticeBoardDto> selectNoticeList();
	// 교직원 정보 검색
	public StaffInfoDto selectStaffInfoByStaff_Pk(int staff_pk);
	// 공지사항별 이미지
	public List<NoticeImageDto> selectNoticeImageByNotice_Id(int notice_id);
	// 글번호별 공지사항
	public NoticeBoardDto selectNoticeBoardById(int id);
	// 공지사항 조회수 증가
	public void increaseReadCount(int id);
	// 공지사항 삭제
	public void deleteNoticeArticle(int id);
	// 공지사항 수정
	public void updateNoticeArticle(NoticeBoardDto noticeBoardDto);
	// 공지사항 댓글 등록
	public void insertNoticeComment(NoticeCommentDto noticeCommentDto);
	// 공지사항 댓글 출력
	public List<NoticeCommentDto> selectCommentByNotice_Id(int notice_id);
	public StudentInfoDto selectStudentInfoByStudent_Pk(int student_pk);
	// 공지사항 댓글 삭제
	public void deleteNoticeComment(int id);
	// 공지사항 추천 여부
	public int noticeLikeCheck(NoticeBoardLikeDto noticeBoardLikeDto);
	public int noticeUpThumbCheck(NoticeBoardLikeDto noticeBoardLikeDto);
	public int noticeDownThumbCheck(NoticeBoardLikeDto noticeBoardLikeDto);
	// 공지사항 추천 추가
	public void insertThumb(NoticeBoardLikeDto noticeBoardLikeDto);
}
