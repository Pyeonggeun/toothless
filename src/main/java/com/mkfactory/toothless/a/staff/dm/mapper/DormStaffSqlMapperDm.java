package com.mkfactory.toothless.a.staff.dm.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStaffSqlMapperDm {
	
	
	public List<DormStudentDto> allDormStudent();
	
	public DormRoomDto dormRoomInfoByDormRoomPk(int dorm_room_pk);
	
	public DormBuildingDto dormBuildingInfoByDormPk(int dorm_pk);
	
	public StudentInfoDto studentInfoByStudentPk(int student_pk);
}
