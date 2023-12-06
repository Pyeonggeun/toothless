package com.mkfactory.toothless.b.dy.staffboard.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface StaffboardSqlMapper {
	
	public void insertStaffboardText(StaffboardDto staffboardDto);
	
	public List<StaffboardDto> selectBoardContentsInfo();

	public StaffInfoDto selectStaffInfo(int staff_pk);
	
	public StaffboardDto selectContentsDetailInfo(int staffboard_pk);
	
	public void updateTextReadCount(int staffboard_pk);
	
	public void deleteText(int staffboard_pk);
	
	public void updateModifyText(StaffboardDto staffboardDto);
	
	public void insertWriteReply(StaffboardReplyDto staffboardReplyDto);
	
	public List<StaffboardReplyDto> selectContentReplyInfo(int staffboard_pk);

	public void deleteReply(StaffboardReplyDto staffboardReplyDto);
	
	public void updateReply(StaffboardReplyDto staffboardReplyDto);
	
}
