package com.mkfactory.toothless.a.staff.sj.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;

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
	
	//정원 카테고리 
	public List<DormCategoryDto> dormCategory();
	public DormCategoryDto selectDormCategoryPk(int dorm_amount_pk);
	public void insertCategoryImgs(DormCategoryDto dormCategory);
	
	//정원 카테고리 update
	public void updateCategory(DormCategoryDto dormCategory);
	
	
	
}
