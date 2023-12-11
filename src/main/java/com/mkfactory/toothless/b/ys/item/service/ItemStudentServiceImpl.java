package com.mkfactory.toothless.b.ys.item.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemCatDto;
import com.mkfactory.toothless.b.dto.ItemDto;
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
	
	//물품, 물품 신청 자료구조로 묶기
	public List<Map<String,Object>> getItemAndItemApplyList(){
		
		List<Map<String,Object>> list = new ArrayList<>();
		
		List<ItemDto> itemList = itemStaffSqlMapper.selectItemList();
		
		for(ItemDto e : itemList) {
			int itemPk = e.getItem_pk();
			int item_cat_pk = e.getItem_cat_pk();
			ItemCatDto itemCatDto = itemStaffSqlMapper.selectItemCatByItemCategoryPk(item_cat_pk);
			String status = itemStudentSqlMapper.ItemApplyStatus(itemPk);
			int itemApplyCount = itemStudentSqlMapper.ItemApplyCount(itemPk);
			
			Map<String,Object> map = new HashMap<>();
			map.put("itemCatDto", itemCatDto);
			map.put("itemDto", e);
			map.put("status", status);
			map.put("itemApplyCount", itemApplyCount);
			list.add(map);
		}
		return list;
	}
	
	//학생 신청 물품 리스트
	public List<Map<String,Object>> getStudentApplyItemList(){
		
		return itemStudentSqlMapper.studentApplyItemList();
	}
	
	public String getItemApplyStatus(int item_pk){
		
		return itemStudentSqlMapper.ItemApplyStatus(item_pk);
	}
	
	public boolean getItemApplyCount(int item_pk) {
		
		int count = itemStudentSqlMapper.ItemApplyCount(item_pk);
	
		if(count > 0) {
			
			return true;
		}else
			return false;
		
	}
	
}
