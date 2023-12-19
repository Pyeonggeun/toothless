package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface CounselCommonsStudentSqlMapper {
	
	public List<Map<String, Object>> getGroupCounselReservationById(int student_pk);
	
	public List<NoticeBoardDto> getNoticeList();
	
	public List<FreeboardDto> getFreeboardList();
	
	public StaffInfoDto getStaffInfoByStaffPk(int staff_pkd);
	
	public int getCountNoticeCommentByNoticeId(int notice_id);
	
	public List<Map<String, Object>> getOfflineCounselListByStudentId(int student_pk);
	
	public CounselorDto getCounselorInfoById(int id);
	
	public TypeCategoryDto getCounselorType(int id);
}
