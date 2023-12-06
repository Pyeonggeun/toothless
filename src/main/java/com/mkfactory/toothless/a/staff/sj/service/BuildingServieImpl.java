package com.mkfactory.toothless.a.staff.sj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.staff.sj.mapper.BuildingSqlMapper;

@Service
public class BuildingServieImpl {
	
	@Autowired
	private BuildingSqlMapper buildingSqlMapper;
	
	public void registerBuilding(DormBuildingDto dormBuildingDto) {
		buildingSqlMapper.registerDormInfo(dormBuildingDto);
	}
	
	public void registerRoom(DormRoomDto dormRoomDto) {
		
		int dormPk = dormRoomDto.getDorm_pk();
		dormRoomDto.setDorm_pk(dormPk);
		
		buildingSqlMapper.registerRoomInfo(dormRoomDto);
		
	}
	
	public List<DormBuildingDto> dormBuildNames(){
		return buildingSqlMapper.dormBuildings();
	}
	
	//새로 리스트 만들어서 int값 가져오기 pk. 
	
	
	public List<DormCategoryDto> dormCategoryList(){
		return buildingSqlMapper.dormCategory();
	}
	
	public List<DormRoomDto> dormRoomList(){
		return buildingSqlMapper.selectRooms();
	}
	
	public void insertRegisterCategory(DormCategoryDto dormCateogory, List<DormCategoryDto> categoryList) {
		
		int ctPk = dormCateogory.getDorm_amount_pk();
		int ctAmount = dormCateogory.getDorm_amount();
		
		dormCateogory.setDorm_amount_pk(ctPk);
		dormCateogory.setDorm_amount(ctAmount);
		
		for(DormCategoryDto dcd :categoryList) {
			dcd.setDorm_amount_pk(ctPk);
			dcd.setDorm_amount(ctAmount);
			buildingSqlMapper.insertCategoryImgs(dcd);
		}
		
	}
	
	public List<Map<String, Object>> dormList(){
		List<Map<String, Object>> forDorm = new ArrayList<>();
		
		List<DormRoomDto> roomsDto = buildingSqlMapper.selectRooms();
		
		for(DormRoomDto rDto:roomsDto) {
			
			int dormPkk = rDto.getDorm_pk();
			DormBuildingDto buildingDto = buildingSqlMapper.dormBuildinChoice(dormPkk);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("roomsDto", rDto);
			map.put("buildingDto", buildingDto);
			//map.put("dormPk", dormPk);
			
			forDorm.add(map);
		}
		return forDorm;
	}
	
	public List<Map<String, Object>> roomList(){
		List<Map<String, Object>> roomL = new ArrayList<>();
		
		List<DormRoomDto> dormRoomDto = buildingSqlMapper.selectRooms();
		
		for(DormRoomDto rooms : dormRoomDto) {
			int amountPk = rooms.getDorm_amount_pk();
			DormCategoryDto categoryDto = buildingSqlMapper.selectDormCategoryPk(amountPk);
			
			int dormPk = rooms.getDorm_pk();
			DormBuildingDto dormBuildingDto = buildingSqlMapper.dormBuildinChoice(dormPk);
			
			Map<String, Object> roomMap = new HashMap<>();
			
			roomMap.put("dormRoomDto", rooms);
			roomMap.put("categoryDto", categoryDto);
			roomMap.put("dormBuildingDto", dormBuildingDto);
			
			roomL.add(roomMap);
		}
		
		return roomL;
	}
	
//	public Map<String, Object> roomMaps(int pk){
//		Map<String, Object> justRoomMap = new HashMap<>();
//				
//		DormCategoryDto categoryDto = buildingSqlMapper.selectDormCategoryPk(pk);
//		int categoryPk = categoryDto.getDorm_amount_pk();
//		DormRoomDto roomDto = buildingSqlMapper.selectRoomByPk(categoryPk);
//		
//		justRoomMap.put("roomDto", roomDto);
//		justRoomMap.put("categoryDto", categoryDto);
//		
//		return justRoomMap;
//	}
	
	public void deleteForDormInfoProcess(int dorm_pk) {
		
		buildingSqlMapper.deleteForDormInfo(dorm_pk);
		
	}
	
	public void deleteForRoomProcess(int room_pk) {
		buildingSqlMapper.deleteRoom(room_pk);
	}
	
	
	
}
