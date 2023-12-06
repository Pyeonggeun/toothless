package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;

public interface GroupCounselStaffSqlMapper {
	
	// 집단상담 등록
	public void insertGroupCounsel(GroupCounselDto groupCounselDto);
	
	// 등록된 상담 리스트
	public List<GroupCounselDto> selectGroupCounselList();
	
	// 신청 가능 인원 - 신청 인원 수
	public int selectGroupCounselReservationCount(int group_counsel_id);
	
	// 신청현황 리스트
	public List<GroupCounselReservationDto> selectGroupCounselReservationList(int group_counsel_id);
	
	// 학생 Dto
	public StudentInfoDto selectGroupCounselReservationByStudent(int student_pk);
	
	
	
	// pk별 집단 상담
	public GroupCounselDto selectGroupCounselById(int id);
}
