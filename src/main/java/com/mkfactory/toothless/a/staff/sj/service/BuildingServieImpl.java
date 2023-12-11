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
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.a.staff.sj.mapper.BuildingSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

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
	
//	public Map<String, Object> printPoints(int dorm_student_pk){
//		Map<String, Object> pointMap = new HashMap<>();
//		
//		PointDto pointDto = buildingSqlMapper.stPk(dorm_student_pk);
//		int categoryPk = pointDto.getPoint_category_pk();
//		PointCategory categoryDto =buildingSqlMapper.selectPointCategoryPk(categoryPk);
//		
//		pointMap.put("categoryDto", categoryDto);
//		pointMap.put("pointDto", pointDto);
//		
//		return pointMap;
//		
//	}
	
	//동과 호실에 해당하는 학생의 이름과 학번 뽑기.
	public List<Map<String, Object>> studentList(){
		List<Map<String, Object>> stList = new ArrayList<>();
		
		List<DormStudentDto> studentDto = buildingSqlMapper.selectStudents();
		
		for(DormStudentDto student : studentDto) {
			
	        int roomPk = student.getDorm_room_pk();
	        DormRoomDto roomDto = buildingSqlMapper.selectRoomByPk(roomPk);

	        int dormPk = roomDto.getDorm_pk();
	        DormBuildingDto dormDto = buildingSqlMapper.dormBuildinChoice(dormPk);

	        int studentPk = student.getStudent_pk();
	        StudentInfoDto stInfo = buildingSqlMapper.forStudentName(studentPk);
	        
	
	        Map<String, Object> stMap = new HashMap<>();
			
			stMap.put("roomDto", roomDto);
			stMap.put("dormDto", dormDto);
			stMap.put("student", student);
			stMap.put("stInfo", stInfo);

	
			
//			로그확인용
//			System.out.println("-----------------");
//			System.out.println("hey read this");
//			System.out.println("기숙사 동 "+dormDto.getDorm_pk());
//			System.out.println("기숙사 호 "+roomDto.getDorm_room_pk());
//			System.out.println("학생 학번 "+student.getDorm_student_pk());
//			System.out.println("학생 이름 "+stInfo.getName());
//			
//			
			stList.add(stMap);
		}
		
		return stList;
	}
	
	public List<Map<String, Object>> pointsL(int dorm_student_pk){
		return buildingSqlMapper.selectStudentPoints(dorm_student_pk);
	}
	
//	public List<Map<String, Object>> pointList(){
//		List<Map<String, Object>> pointMapList = new ArrayList<>();
//		
//		List<PointDto> point = buildingSqlMapper.selectStudentPoints();
//		
//		for(PointDto pointDto : point) {
//			
//			int categoryPk = pointDto.getPoint_category_pk();
//			PointCategory poinCategory = buildingSqlMapper.selectPointCategoryPk(categoryPk);
//			
//			int dormStudentPk = pointDto.getDorm_student_pk();
//			DormStudentDto student = buildingSqlMapper.selectPk(dormStudentPk);			
//			
////			int pointPk = pointDto.getDorm_point_pk();
////			pointDto.setDorm_point_pk(pointPk);
//			
//			Map<String, Object> map = new HashMap<>();
//			map.put("pointDto", pointDto);
//			map.put("poinCategory", poinCategory);
//			map.put("student", student);
//			
//			pointMapList.add(map);
//			
//			System.out.println("point Pk : "+pointDto.getDorm_point_pk());
//			System.out.println("dorm student Pk : "+pointDto.getDorm_student_pk());
//		}
//		
//		return pointMapList;
//	}
	
//	 public List<Map<String, Object>> getPointsForStudent(int dorm_studen_tPk) {
//	        List<Map<String, Object>> pointMapList = new ArrayList<>();
//
//	        List<PointDto> pointList = buildingSqlMapper.selectStudentPoints(dorm_studen_tPk);
//
//	        for (PointDto pointDto : pointList) {
//	            int categoryPk = pointDto.getPoint_category_pk();
//	            PointCategory pointCategory = buildingSqlMapper.selectPointCategoryPk(categoryPk);
//
//	            // Assuming you have a method to get student details by dorm_student_pk
//	            DormStudentDto student = buildingSqlMapper.selectPk(dorm_studen_tPk);
//
//	            Map<String, Object> map = new HashMap<>();
//	            map.put("pointDto", pointDto);
//	            map.put("pointCategory", pointCategory);
//	            map.put("student", student);
//
//	            pointMapList.add(map);
//
//	            System.out.println("Point Pk: " + pointDto.getDorm_point_pk());
//	            System.out.println("Dorm student Pk: " + pointDto.getDorm_student_pk());
//	        }
//
//	        return pointMapList;
//	    }

	
	//기숙사 동 삭제
	public void deleteForDormInfoProcess(int dorm_pk) {
		buildingSqlMapper.deleteForDormInfo(dorm_pk);
	}
	
	//기숙사 호실 삭제
	public void deleteForRoomProcess(int room_pk) {
		buildingSqlMapper.deleteRoom(room_pk);
	}
	

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
