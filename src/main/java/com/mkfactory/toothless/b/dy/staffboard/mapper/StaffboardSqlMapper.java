package com.mkfactory.toothless.b.dy.staffboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface StaffboardSqlMapper {
//글 작성	
	public void insertStaffboardText(StaffboardDto staffboardDto);
// 글 리스트 출력	
	public List<StaffboardDto> selectBoardContentsInfo(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord //여기 변수명 중요하지 않음
		);
//@Param 은 mapper에서 2개 이상의 파라메터를 받을 때, 위처럼 사용된다.
	
	public StaffInfoDto selectStaffInfo(int staff_pk);
	
	public StaffboardDto selectContentsDetailInfo(int staffboard_pk);

//조회수
	public void updateTextReadCount(int staffboard_pk);
//글 삭제	
	public void deleteText(int staffboard_pk);
//글 수정	
	public void updateModifyText(StaffboardDto staffboardDto);

//댓글	
	public void insertWriteReply(StaffboardReplyDto staffboardReplyDto);
	
	public List<StaffboardReplyDto> selectContentReplyInfo(int staffboard_pk);

	public void deleteReply(StaffboardReplyDto staffboardReplyDto);
	
	public StaffboardReplyDto selectReply(int staffboard_reply_pk);
	
	public void updateReply(StaffboardReplyDto staffboardReplyDto);

//좋아요
	public void insertAddLike (StaffboardLikeDto staffboardLikeDto);
	
	public StaffboardLikeDto selectPressLike(StaffboardLikeDto staffboardLikeDto);
	
	public void deleteCanselLike(StaffboardLikeDto staffboardLikeDto);
	
	public int selectCheckLike(StaffboardLikeDto staffboardLikeDto);
	
//좋아요 카운트
	public int selectLikeCount(int staffboard_pk);
	
//댓글 카운트
	public int selectReplyCount(int staffboard_pk);
	
}
