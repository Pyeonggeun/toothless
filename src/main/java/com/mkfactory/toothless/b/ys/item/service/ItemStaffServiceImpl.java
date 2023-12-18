package com.mkfactory.toothless.b.ys.item.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.mail.FetchProfile.Item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemCatDto;
import com.mkfactory.toothless.b.dto.ItemDto;
import com.mkfactory.toothless.b.ys.item.mapper.ItemStaffSqlMapper;

@Service
public class ItemStaffServiceImpl {

	@Autowired
	private ItemStaffSqlMapper itemStaffSqlMapper;
	
	//물품,카테고리 자료구조 리스트
	public List<Map<String,Object>> getItemList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ItemDto> itemList = itemStaffSqlMapper.selectItemList();
		
		for(ItemDto itemDto : itemList) {
			int item_cat_pk = itemDto.getItem_cat_pk();
			ItemCatDto itemCatDto = itemStaffSqlMapper.selectItemCatByItemCategoryPk(item_cat_pk);
			
			Map<String,Object> map = new HashMap<>();
			map.put("itemDto", itemDto);
			map.put("itemCatDto", itemCatDto);
			list.add(map);
		}
		return list;
	}
	
	//믈품,카테고리 조인 리스트
	public List<Map<String,Object>> getItemAndCategoryList(){
		
		return itemStaffSqlMapper.selectItemJoinCategoryList();
	}
	//select-box 검색 쿼리 
//	public List<Map<String,Object>> getSearchItemList(String searchItemName, int searchCategory){
//		
//		return itemStaffSqlMapper.searchSelectAll(searchItemName, searchCategory);
//	}
	
	//check-box 검색 쿼리
	public List<Map<String,Object>> getSearchItemList(String searchItemName, int[] searchCagtegory){
		
		return itemStaffSqlMapper.searchBycheckBox(searchItemName, searchCagtegory);
	}
	
	//물품 상세 정보
	public ItemDto getItem(int item_pk) {
		
		return itemStaffSqlMapper.selectItemByItemPk(item_pk);
	}
	
	//물품카테고리 리스트
	public List<ItemCatDto> getCategoryList(){
		
		return itemStaffSqlMapper.selectItemCategoryList();
	}
	
	//물품 등록
	public void registItem(ItemDto itemDto) {
		
		itemStaffSqlMapper.insertItem(itemDto);
	
	}
	
	//물품 수정
	public void updateItem(ItemDto itemDto) {
		
		itemStaffSqlMapper.updateItemByItemPk(itemDto);
	}
	
	//물품 삭제
	public void deleteItem(int item_pk) {
		
		itemStaffSqlMapper.deleteItemByItemPk(item_pk);
	}
	
	//물품 카테고리, 물품, 물품신청, 학생 조인 신청내역 리스트
	public List<Map<String,Object>> getItemApplyList(){
		
		return itemStaffSqlMapper.selectItemApplyList();
	}
	
	//물품 대여 상태 수정
	public void updateItemRentalStatus(int item_apply_pk) {
		
		itemStaffSqlMapper.updateRentalStatus(item_apply_pk);

	}
	
	//물품 반납 상태 수정
	public void updateItemReturnStatus(int item_apply_pk) {
		
		itemStaffSqlMapper.updateReturnStatus(item_apply_pk);

	}
	
	// 신청한 물품 반납했을 시 신청내역에서 삭제
	public void deleteItemApply(int item_apply_pk) {
		
		itemStaffSqlMapper.deleteItemApply(item_apply_pk);
	}
}
