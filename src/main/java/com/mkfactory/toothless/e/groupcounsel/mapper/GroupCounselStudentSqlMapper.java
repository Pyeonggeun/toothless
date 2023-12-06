package com.mkfactory.toothless.e.groupcounsel.mapper;

import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;

public interface GroupCounselStudentSqlMapper {
	
	public void insertGroupCounselReservation(GroupCounselReservationDto groupCounselReservationDto);

	public int countGroupCounselReservationByStudentId(GroupCounselReservationDto groupCounselReservationDto);


}
