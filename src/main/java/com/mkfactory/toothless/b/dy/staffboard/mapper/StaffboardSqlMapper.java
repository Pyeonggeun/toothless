package com.mkfactory.toothless.b.dy.staffboard.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface StaffboardSqlMapper {
//글 작성	
	public void insertStaffboardText(StaffboardDto staffboardDto);
// 글 리스트 출력	
	public List<StaffboardDto> selectBoardContentsInfo();

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
	
	public int selectCheckLike(int count);
	
	
	
	
}
