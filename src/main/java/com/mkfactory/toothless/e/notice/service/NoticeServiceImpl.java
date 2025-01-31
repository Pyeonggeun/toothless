package com.mkfactory.toothless.e.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardLikeDto;
import com.mkfactory.toothless.e.dto.NoticeCommentDto;
import com.mkfactory.toothless.e.dto.NoticeImageDto;
import com.mkfactory.toothless.e.notice.mapper.NoticeSqlMapper;

@Service
public class NoticeServiceImpl {
	
	@Autowired
	private NoticeSqlMapper noticeSqlMapper;
	// 공지사항 입력
	public void insertNoticeArticle(NoticeBoardDto noticeBoardDto, List<NoticeImageDto> noticeImageDtoList) {
		int noticePk = noticeSqlMapper.createNoticePk();
		noticeBoardDto.setId(noticePk);
		noticeSqlMapper.insertNoticeArticle(noticeBoardDto);
		
		for(NoticeImageDto noticeImageDto : noticeImageDtoList) {
			noticeImageDto.setNotice_id(noticePk);
			
			noticeSqlMapper.insertNoticeImage(noticeImageDto);
		}
	}
	// 공지사항 출력
	public List<Map<String, Object>> getNoticeList(String searchType, String searchWord) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<NoticeBoardDto> noticeBoardDtoList = noticeSqlMapper.selectNoticeList(searchType, searchWord);
		
		for(NoticeBoardDto noticeBoardDto : noticeBoardDtoList) {
			
			int staffPk = noticeBoardDto.getStaff_pk();
			int boardPk = noticeBoardDto.getId();
			StaffInfoDto staffInfoDto = noticeSqlMapper.selectStaffInfoByStaff_Pk(staffPk);
			int commentCount = noticeSqlMapper.commentCountByNotice_id(boardPk);	// 댓글 갯수
			int likeCount = noticeSqlMapper.likeCountByNotice_id(boardPk);			// 추천 갯수
			int disLikeCount = noticeSqlMapper.dislikeCountByNotice_id(boardPk);	// 비추천 갯수
			int imageCount = noticeSqlMapper.countImageByNotice_id(boardPk);
					
			Map<String, Object> map = new HashMap<>();
			map.put("noticeBoardDto", noticeBoardDto);
			map.put("staffInfoDto", staffInfoDto);	
			map.put("commentCount", commentCount);
			map.put("likeCount", likeCount);
			map.put("disLikeCount", disLikeCount);
			map.put("imageCount", imageCount);
			
			list.add(map);	
		}
		return list;
	}
	// 공지사항 상세글 보기
	public Map<String, Object> getNoticeBoardDetaiilById(int id) {
		NoticeBoardDto noticeBoardDto = noticeSqlMapper.selectNoticeBoardById(id);
		List<NoticeImageDto> noticeImageList = noticeSqlMapper.selectNoticeImageByNotice_Id(id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("noticeBoardDto", noticeBoardDto);
		map.put("noticeImageList", noticeImageList);
		
		return map;
	}
	// 공지사항 조회수 증가
	public void increaseReadCount(int id) {
		noticeSqlMapper.increaseReadCount(id);
	}
	// 공지사항 삭제
	public void deleteNoticeArticle(int id) {
		noticeSqlMapper.deleteNoticeArticle(id);
	}
	// 공지사항 수정
	public void updateNoticeArticle(NoticeBoardDto noticeBoardDto) {
		noticeSqlMapper.updateNoticeArticle(noticeBoardDto);
	}
	// 공지사항 댓글 등록
	public void insertNoticeComment(NoticeCommentDto noticeCommentDto) {
		noticeSqlMapper.insertNoticeComment(noticeCommentDto);
	}
	// 공지사항 댓글 출력
	public List<Map<String, Object>> selectCommentByNotice_Id(int notice_id) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<NoticeCommentDto> noticeCommentList = noticeSqlMapper.selectCommentByNotice_Id(notice_id);
		for(NoticeCommentDto noticeCommentDto : noticeCommentList) {
			int studentPk = noticeCommentDto.getStudent_pk();
			StudentInfoDto studentInfoDto = noticeSqlMapper.selectStudentInfoByStudent_Pk(studentPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("noticeCommentDto", noticeCommentDto);
			map.put("studentInfoDto", studentInfoDto);
			
			list.add(map);
		}
		return list;
	}
	// 공지사항 댓글 삭제
	public void deleteNoticeComment(int id) {
		noticeSqlMapper.deleteNoticeComment(id);
	}
	// 공지사항 추천 여부
	public int noticeLikeCheck(NoticeBoardLikeDto noticeBoardLikeDto) {
		return noticeSqlMapper.noticeLikeCheck(noticeBoardLikeDto);
	}
	public int noticeUpThumbCheck(NoticeBoardLikeDto noticeBoardLikeDto) {
		return noticeSqlMapper.noticeUpThumbCheck(noticeBoardLikeDto);
	}
	public int noticeDownThumbCheck(NoticeBoardLikeDto noticeBoardLikeDto) {
		return noticeSqlMapper.noticeDownThumbCheck(noticeBoardLikeDto);
	}
	// 공지사항 추천,비추천 추가
	public void insertThumb(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeSqlMapper.insertThumb(noticeBoardLikeDto);
	}
	// 공지사항 추천 삭제
	public void deleteNoticeLike(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeSqlMapper.deleteNoticeLike(noticeBoardLikeDto);
	}
	// 공지사항 비추천 삭제
	public void deleteNoticeDisLike(NoticeBoardLikeDto noticeBoardLikeDto) {
		noticeSqlMapper.deleteNoticeDisLike(noticeBoardLikeDto);
	}
	// 공지사항 베스트글
	public List<Map<String, Object>> selectBestNotice(){
		return noticeSqlMapper.selectBestNotice();
	}
	// 공지사항 개시글별 댓글 갯수
	public int commentCountByNotice_id(int notice_id) {
		return noticeSqlMapper.commentCountByNotice_id(notice_id);
	}

}
