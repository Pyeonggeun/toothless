package com.mkfactory.toothless.d.hc.board.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.NoticeStaffBoardDto;
import com.mkfactory.toothless.d.dto.QnABoardDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface HcBoardSqlMapper {

	public void insert(QnABoardDto qnABoardDto);
	
	public List<QnABoardDto> selectAll();
	
	public StaffInfoDto selectBypk(int staff_pk);
	
	public QnABoardDto selectById(int board_pk);
	
	public void delete(int board_pk);
	
	public void update(QnABoardDto qnABoardDto);
	
	public void notice(NoticeStaffBoardDto noticeStaffBoardDto);
	
	public List<NoticeStaffBoardDto> selectNoticeAll();
	
	public StaffInfoDto selectBynoticepk(int staff_pk);
	
	public NoticeStaffBoardDto selectpk(int notice_board_pk);
	
	public void deletenotice(int notice_board_pk);
	
	public void updateno(NoticeStaffBoardDto noticeStaffBoardDto);
	
	
}
