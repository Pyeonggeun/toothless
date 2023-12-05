package com.mkfactory.toothless.a.staff.jw.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStaffMapperJw {

	// 외출/외박 신청
	public List<ExitDto> selectExitList();
	
	// 사생정보 리스트
//	public List<StudentInfoDto> selectAllStudentInDormStudent();
//	
	// 특정 학생정보(by 사생키)
	public StudentInfoDto selectStudentInfoByDormStudentPk(int dorm_student_pk);
	
	// 특정 학생 호실정보(by 사생키)
	public DormRoomDto selectDormRoomByDormStudentPk(int dorm_student_pk);
	
	// 특정 학생 동정보
	public DormBuildingDto selectDormByDormPk(int dorm_pk);
	
	
	
}
