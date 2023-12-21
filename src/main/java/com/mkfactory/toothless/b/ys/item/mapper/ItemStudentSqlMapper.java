package com.mkfactory.toothless.b.ys.item.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.ItemApplyDto;

public interface ItemStudentSqlMapper {

	
	public void insertItemApply(ItemApplyDto itemApplyDto);
	
	public List<Map<String,Object>> studentApplyItemList();
	
	public List<Map<String,Object>> studentApplyItemListByCategoryId(
			@Param("item_cat_pk") int item_cat_pk);
	
	public String ItemApplyStatus(int item_pk);
	
	public int ItemApplyCount(int item_pk);
	
	public List<Map<String,Object>> searchSelectItemAll(
			@Param("searchItemName") String searchItemName,
			@Param("searchCategory") int searchCategory);
}
