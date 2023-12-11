package com.mkfactory.toothless.a.staff.sj.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface BuildingSqlMapper {
	//건물 등록(동)
	public void registerDormInfo(DormBuildingDto dormBuilding);
	
	//건물!
	public List<DormBuildingDto> dormBuildings();
	public DormBuildingDto dormBuildinChoice(int dorm_pk);
	
	//건물 정보 삭제
	public void deleteForDormInfo(int dorm_pk);
	
	//호실 등록(호)
	public void registerRoomInfo(DormRoomDto dormRoomDto);
	
	//호실 
	public List<DormRoomDto> selectRooms();
	public DormRoomDto selectRoomByPk(int dorm_room_pk);
	public void deleteRoom(int dorm_room_pk);
	public void updateRoom(DormRoomDto dorRoomDto);
	
	//호실에 해당하는 학생들 학번, 이름 뽑기.
	public List<DormStudentDto> selectStudents();
	public DormStudentDto selectStudentPk(int student_pk);
	public StudentInfoDto forStudentName(int student_pk);
	
	//정원 카테고리 
	public List<DormCategoryDto> dormCategory();
	public DormCategoryDto selectDormCategoryPk(int dorm_amount_pk);
	public void insertCategoryImgs(DormCategoryDto dormCategory);
	
	//상벌점
	public PointDto stPk(int dorm_student_pk);
	public PointDto selectPointPk(int dorm_point_pk);
	public PointCategory selectPointCategoryPk(int point_category_pk);
	
	//public List<DormStudentDto> selectStudentPoints();
	
	public List<PointDto> selectStudentPoints();
	
}
