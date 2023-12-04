package com.mkfactory.toothless.b.dy.staffboard.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.StaffNoticeboardDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface StaffboardSqlMapper {

	public void insertStaffboardText(StaffNoticeboardDto staffNoticeboardDto);
	
	public List<StaffNoticeboardDto> selectBoardContentsInfo();

	public StaffInfoDto selectStaffInfo(int id);
}
