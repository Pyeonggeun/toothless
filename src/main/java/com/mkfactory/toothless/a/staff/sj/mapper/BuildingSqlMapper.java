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
	
	//호실 등록(호)
	public void registerRoomInfo(DormRoomDto dormRoomDto);
	
	//정원 카테고리 
	public List<DormCategoryDto> dormCategory();
	
	//정원 카테고리 insert
	public void insertRegisterCategory(DormCategoryDto dormCategory);
	
	
	
}
