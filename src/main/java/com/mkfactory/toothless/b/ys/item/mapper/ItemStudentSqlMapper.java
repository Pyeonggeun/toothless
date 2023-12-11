package com.mkfactory.toothless.b.ys.item.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.b.dto.ItemApplyDto;

public interface ItemStudentSqlMapper {

	
	public void insertItemApply(ItemApplyDto itemApplyDto);
	
	public List<Map<String,Object>> studentApplyItemList();
	
	public String ItemApplyStatus(int item_pk);
	
	public int ItemApplyCount(int item_pk);
}
