package com.mkfactory.toothless.a.staff.dm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStaffSqlMapperDm {
	
	
	public List<DormStudentDto> allDormStudent();
	
	public DormRoomDto dormRoomInfoByDormRoomPk(int dorm_room_pk);
	
	public DormBuildingDto dormBuildingInfoByDormPk(int dorm_pk);
	
	public StudentInfoDto studentInfoByStudentPk(int student_pk);
	
	public void assignmentDeleteByDormStudentPk(int dorm_student_pk);
	
	public List<StudentInfoDto> studentInfoAllList();
	
	public JoinDormApplicationDto joinDormAppliByStudentPK(int student_pk);
	
	public DormStudentDto dormStudentInfoByStudentPk(int student_pk);
	
	public DormCategoryDto dormCategoryInfoByDormAmountPk(int dorm_amount_pk);

	public List<DormRoomDto> dormRoomAllList();
	
	public List<DormBuildingDto> dormListDong();
	
	public SemesterDto SemesterCheckY();
	
	public void dormStudentAssignmentInsert(DormStudentDto dormStudentDto);
	
	public List<DormRoomDto> dormRoomInfoByDormPk(int dorm_pk);
	
	//map 으로 리턴받을때 param 붙이자..
	public List<Map<String, Object>> dormInfoTestByDormPk(@Param("dorm_pk") int dorm_pk);
	
	public boolean dormAssignCheckByDormRoomPk(int dorm_room_pk);
	
	public List<Map<String, Object>> searchListBySearchWordAndSearchType(@Param("searchWord") String searchWord, @Param("searchType") String searchType);
}
