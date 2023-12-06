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
	
	public List<DormCategoryDto> dormCategoryList(){
		return buildingSqlMapper.dormCategory();
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
	
//	public List<Map<String, Object>> printDormList(){
//		List<Map<String, Object>> bList= new ArrayList<>();
//		
//		List<DormBuildingDto> dormL = buildingSqlMapper.dormBuildings();
//		
//		for(DormBuildingDto db : dormL) {
//			int dormPk = db.getDorm_pk();
//			db.setDorm_pk(dormPk);
//			
//			Map<String, Object> dMap = new HashMap<>();
//			dMap.put("db", db);
//			
//			bList.add(dMap);
//		}
//		return bList;
//	}
	
	public void deleteForDormInfoProcess(int dorm_pk) {
		
		buildingSqlMapper.deleteForDormInfo(dorm_pk);
		
	}
	
	
	
}
