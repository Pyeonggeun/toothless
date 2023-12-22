package com.mkfactory.toothless.b.ys.item.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemCatDto;
import com.mkfactory.toothless.b.dto.ItemDto;

public interface ItemStaffSqlMapper {
	
	public List<ItemDto> selectItemList();
	
	public List<ItemDto> selectItemListByCategoryId(int item_cat_pk);
	
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
	
	//검색
	//@Param은 xml파일에서 해당 변수명을 쓸 수 있도록 바인딩해주는 것
	
//	public List<Map<String,Object>> searchSelectAll(
//			@Param("searchItemName") String searchItemName,
//			@Param("searchCategory") int searchCategory);
	
	public List<Map<String,Object>> searchBycheckBox(
			@Param("searchItemName") String searchItemName,
			@Param("searchCategory") int[] searchCategory);
	
}
