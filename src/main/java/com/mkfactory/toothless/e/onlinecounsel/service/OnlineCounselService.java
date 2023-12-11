package com.mkfactory.toothless.e.onlinecounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.onlinecounsel.mapper.OnlineCounselSqlMapper;

@Service
public class OnlineCounselService {

	@Autowired
	private OnlineCounselSqlMapper onlineCounselSqlMapper;
	
	
	//		****	공용		****
	
	public List<TypeCategoryDto> getAllCategory() {
		
		
		return onlineCounselSqlMapper.takeAllCategory();
		
	}
	
	
	
	
	
	//		**		학생 관련 		**
	
	//		**	상담 등록 **
	public void writeOnlineCounsel(OnlineCounselBoardDto onlineCounselBoardDto) {
		
		onlineCounselSqlMapper.insertOnlineCounsel(onlineCounselBoardDto);
		
	}
	
	
	
	
	
	public List<Map<String, Object>> getAllCounselListByStudentPk(int studentPk){
		
		List<Map<String, Object>> counselList = new ArrayList<>();
		List<OnlineCounselBoardDto> list = onlineCounselSqlMapper.selectAllCounselListByStudentPk(studentPk);
		
		
		for(OnlineCounselBoardDto onlineCounselBoardDto : list) {
			TypeCategoryDto typeCategoryDto = onlineCounselSqlMapper.selectCategoryDto(onlineCounselBoardDto.getType_category_id());
						
			Map<String, Object> map = new HashMap<>();
			
			map.put("studentDto", onlineCounselSqlMapper.getStudentInfo(onlineCounselBoardDto.getStudent_id()));
			map.put("onlineCounselBoardDto", onlineCounselBoardDto);
			map.put("category", typeCategoryDto);
			
			counselList.add(map);
		}
		
		return counselList;		
	}
	
	
	public Map<String, Object> readCounsel(int counsel_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		OnlineCounselBoardDto onlineCounselBoardDto = onlineCounselSqlMapper.selectCounsel(counsel_pk);
		map.put("category", onlineCounselSqlMapper.selectCategoryDto(onlineCounselBoardDto.getType_category_id()));
		map.put("studentInfo", onlineCounselSqlMapper.getStudentInfo(onlineCounselBoardDto.getStudent_id()));
		map.put("counselDto", onlineCounselBoardDto);
		return map;
		
	}
	
	
	//		**	상담원 관련	**
	
	public List<List<Map<String, Object>>> getCounselInfoList(int externalPk) {
		
		CounselorDto counselorDto = onlineCounselSqlMapper.selectCounselorDto(externalPk);
		int counselorId = counselorDto.getId();
		List<List<Map<String, Object>>> list = new ArrayList<>();
		
		List<CounselorTypeDto> counselorTypeList = onlineCounselSqlMapper.selectCounselTypeDto(counselorId);
		for(CounselorTypeDto counselorTypeDto : counselorTypeList) {
			int typeCategoryId = counselorTypeDto.getType_category_id();
			List<OnlineCounselBoardDto> counselDtoList = onlineCounselSqlMapper.selectCounselList(typeCategoryId);
			
			
			List<Map<String, Object>> mapList = new ArrayList<>();
			for(OnlineCounselBoardDto onlineCounselBoardDto : counselDtoList) {
				
				int studentPk = onlineCounselBoardDto.getStudent_id();				
				TypeCategoryDto typeCategoryDto = onlineCounselSqlMapper.selectCategoryDto(onlineCounselBoardDto.getType_category_id());
				StudentInfoDto studentInfoDto = onlineCounselSqlMapper.getStudentInfo(studentPk);
				
				
				
				Map<String, Object> map = new HashMap<>();
				map.put("typeCategoryDto", typeCategoryDto);
				map.put("studentInfoDto", studentInfoDto);
				map.put("onlineCounselBoardDto", onlineCounselBoardDto);
				
				mapList.add(map);
			}
			
			list.add(mapList);
		}
		
		
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//
//	
//
//	public CounselorDto getCounselorInfo(int externalPk) {
//		
//		return onlineCounselSqlMapper.selectCounselorInfo(externalPk);
//		
//		
//	}
//	
//	public List<CounselorTypeDto> getCounselorTypeInfo (int id){
//		
//		return onlineCounselSqlMapper.selectCounselorTypeInfo(id);
//		
//	}
//	
//	
//	public List<OnlineCounselBoardDto> getCounselBoardInfo(int typeCategoryId){
//		
//		
//		return onlineCounselSqlMapper.selectCounselBoardInfo(typeCategoryId);
//	}
//	
//	public StudentInfoDto getStudentInfo(int studentPk){
//		
//		return onlineCounselSqlMapper.getStudentInfo(studentPk);
//		
//	}
	
}
