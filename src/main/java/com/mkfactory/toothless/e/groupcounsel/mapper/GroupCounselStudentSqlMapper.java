package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;
import com.mkfactory.toothless.e.dto.GroupCounselSurvey;

public interface GroupCounselStudentSqlMapper {
	
	public void insertGroupCounselReservation(GroupCounselReservationDto groupCounselReservationDto);

	public int countGroupCounselReservationByStudentId(GroupCounselReservationDto groupCounselReservationDto);

	public List<GroupCounselReservationDto> selectGroupCounselReservationListByStudentId(int student_pk);
	
	
	public void insertGroupCounselSurvey(GroupCounselSurvey groupCounselSurvey);
}
