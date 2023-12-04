package com.mkfactory.toothless.b.ys.item.service;

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
}
