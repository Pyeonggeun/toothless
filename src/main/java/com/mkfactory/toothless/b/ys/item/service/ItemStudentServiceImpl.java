package com.mkfactory.toothless.b.ys.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.ys.item.mapper.ItemStaffSqlMapper;
import com.mkfactory.toothless.b.ys.item.mapper.ItemStudentSqlMapper;

@Service
public class ItemStudentServiceImpl {

	@Autowired
	private ItemStudentSqlMapper itemStudentSqlMapper;
	
	@Autowired
	private ItemStaffSqlMapper itemStaffSqlMapper;

	
	public void applyItem(ItemApplyDto itemApplyDto) {
		
		itemStudentSqlMapper.insertItemApply(itemApplyDto);
		
	}
	
	//학생 신청 물품 리스트
	public List<Map<String,Object>> getStudentApplyItemList(){
		
		return itemStudentSqlMapper.studentApplyItemList();
	}
}
