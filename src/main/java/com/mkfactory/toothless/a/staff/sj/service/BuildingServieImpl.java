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
	
	//호실 등록
	public void registerRoom(DormRoomDto dormRoomDto) {
		int dormPk = dormRoomDto.getDorm_pk();
		dormRoomDto.setDorm_pk(dormPk);
		buildingSqlMapper.registerRoomInfo(dormRoomDto);
	}
	
	//기숙사 동 리스트
	public List<DormBuildingDto> dormBuildNames(){
		return buildingSqlMapper.dormBuildings();
	}
	
	//카테고리 리스트
	public List<DormCategoryDto> dormCategoryList(){

		return buildingSqlMapper.dormCategory();
	}

	
	//호실 리스트
	public List<DormRoomDto> dormRoomList(){
		return buildingSqlMapper.selectRooms();
		
	}
	
	//호실 별 이미지 등록
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
	
	//기숙사 동 list/map
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
	
	//기숙사 호실 list/map
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
	
	//호실 수정하려고 만든 맵
	public Map<String, Object> printRooms(int dorm_room_pk){
		Map<String, Object> justRoomMap = new HashMap<>();
	
		DormRoomDto roomDto = buildingSqlMapper.selectRoomByPk(dorm_room_pk);
		int dormPk = roomDto.getDorm_pk();
		DormBuildingDto dormDto = buildingSqlMapper.dormBuildinChoice(dormPk);
		
		int categoryPk = roomDto.getDorm_amount_pk();
		DormCategoryDto categoryDto = buildingSqlMapper.selectDormCategoryPk(categoryPk);
		
//		System.out.println("-------------------");
//		System.out.println("dormPk : "+dormDto.getDorm_pk());
//		System.out.println("roomPk : "+roomDto.getDorm_room_pk());
//		System.out.println("categoryAmount : "+categoryDto.getDorm_amount());
//		아니 ㅅㅂ 로그 확인되는데?
		
		justRoomMap.put("categoryDto", categoryDto);
		justRoomMap.put("roomDto", roomDto);
		justRoomMap.put("dormDto", dormDto);
		
		
		return justRoomMap;
	}
	
	//기숙사 동 삭제
	public void deleteForDormInfoProcess(int dorm_pk) {
		buildingSqlMapper.deleteForDormInfo(dorm_pk);
	}
	
	//기숙사 호실 삭제
	public void deleteForRoomProcess(int room_pk) {
		buildingSqlMapper.deleteRoom(room_pk);
	}
	
//	public void deleteForRoomDetailImg(int dorm_amount) {
//		
//		buildingSqlMapper.deleteCategoryImg(dorm_amount);
//		
//	}

	//기숙사 호실 수정
	public void updateForRoom(DormRoomDto roomDto) {
//		로그확인용
//		System.out.println("--------------------------");
//	    System.out.println("Updating room with the following values:");
//	    System.out.println("DORM_PK: " + roomDto.getDorm_pk());
//	    System.out.println("roomPk : "+roomDto.getDorm_room_pk());
//	    System.out.println("DORM_AMOUNT_PK: " + roomDto.getDorm_amount_pk());
//	    System.out.println("ROOM_NAME: " + roomDto.getRoom_name());
//	    System.out.println("GENDER: " + roomDto.getGender());
//	    System.out.println("DORM_FLOOR: " + roomDto.getDorm_floor());
		buildingSqlMapper.updateRoom(roomDto);
	}
	
}
