package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;

public interface CounselCommonsStudentSqlMapper {
	
	public List<Map<String, Object>> getGroupCounselReservationById(int student_pk);
	
	public List<NoticeBoardDto> getNoticeList();
	
	public List<FreeboardDto> getFreeboardList();
	
	public StaffInfoDto getStaffInfoByStaffPk(int staff_pkd);
	
	public int getCountNoticeCommentByNoticeId(int notice_id);
	
	
	
	
}
