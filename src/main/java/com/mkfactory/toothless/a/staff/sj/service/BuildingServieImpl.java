package com.mkfactory.toothless.a.staff.sj.service;

import java.util.List;

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
	
	public void registerRoom(DormRoomDto dormRoomDto,DormBuildingDto dormBuildingDto, 
							 List<DormCategoryDto> dormCateogory) {
		
		int dormBuildPk = dormBuildingDto.getDorm_pk();
		dormRoomDto.setDorm_pk(dormBuildPk);
		
		buildingSqlMapper.dormBuildinChoice(dormBuildPk);
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
		System.out.println(ctPk);
		dormCateogory.setDorm_amount_pk(ctPk);
		
		for(DormCategoryDto dcd :categoryList) {
			dcd.setDorm_amount_pk(ctPk);
			buildingSqlMapper.updateCategory(dcd);
			System.out.println(dcd.getDorm_imgs());
		}
		
	}
}
