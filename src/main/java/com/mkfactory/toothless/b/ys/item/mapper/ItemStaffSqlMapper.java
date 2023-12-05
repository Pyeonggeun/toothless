package com.mkfactory.toothless.b.ys.item.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemCatDto;
import com.mkfactory.toothless.b.dto.ItemDto;

public interface ItemStaffSqlMapper {
	
	public List<ItemDto> selectItemList();
	
	public ItemDto selectItemByItemCategoryPk(int item_cat_pk);
	
	public ItemCatDto selectItemCatByItemCategoryPk(int item_cat_pk);
	
	public List<ItemCatDto> selectItemCategoryList();
	
	public void insertItem(ItemDto itemDto);
	
	public ItemDto selectItemByItemPk(int item_pk);
	
	public void updateItemByItemPk(ItemDto itemDto);
	
	public void deleteItemByItemPk(int item_pk);
	
	
	public List<Map<String, Object>> selectItemJoinCategoryList();
	
	public List<Map<String,Object>> selectItemApplyList();
	
	public void updateRentalStatus(int item_apply_pk);
	
	public void updateReturnStatus(int item_apply_pk);
	
	public void deleteItemApply(int item_apply_pk);
}
