package com.mkfactory.toothless.b.ys.item.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.dto.ItemDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;
import com.mkfactory.toothless.b.ys.item.service.ItemStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.JinyongRestResponseDto;

@RestController
@RequestMapping("/tl_b/ys/*")
public class RestItemStaffController {

	@Autowired
	private ItemStaffServiceImpl itemStaffService;
	
	@Autowired
	private ItemStudentServiceImpl itemStudentService;
	
	@RequestMapping("restStaffInfo")
	public B_RestResponseDto restStaffInfo(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(sessionStaffInfo);
		
		return restResponseDto;
		
	}
	
	@RequestMapping("getItemApplyList")
	public B_RestResponseDto getItemApplyList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStaffService.getItemApplyList());
		
		return restResponseDto;
	}
	
	@RequestMapping("restRentalProcess")
	public B_RestResponseDto restRentalProcess(int item_apply_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
				
		restResponseDto.setResult("success");
		itemStaffService.updateItemRentalStatus(item_apply_pk);
		
		return restResponseDto;
		
	}
	
	@RequestMapping("restReturnProcess")
	public B_RestResponseDto restReturnProcess(int item_apply_pk) {
		
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		
		itemStaffService.deleteItemApply(item_apply_pk);
		itemStaffService.updateItemReturnStatus(item_apply_pk);
		
		
		return restResponseDto;
	}
	
	@RequestMapping("restItemAndCategoryList")
	public B_RestResponseDto restItemAndCategoryList(
			String searchWord,
			String searchType) {
		
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		
		restResponseDto.setData(itemStaffService.getItemAndCategoryList());
		
		
		return restResponseDto;
	}
	
	
	@RequestMapping("restItemDeleteProcess")
	public B_RestResponseDto restItemDeleteProcess(int item_pk) {
	
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		itemStaffService.deleteItem(item_pk);
		
		return restResponseDto;
	}
	
	//카테고리 리스트 select box-ajax
	@RequestMapping("restGetCategoryList")
	public B_RestResponseDto restGetCategoryList() {
	
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStaffService.getCategoryList());
		
		return restResponseDto;
	}
	// select-box 검색 쿼리
//	@RequestMapping("restSearchItemList")
//	public B_RestResponseDto restSearchItemList(
//			@RequestParam(name = "searchItemName", defaultValue = "default" ) String searchItemName,  
//			@RequestParam(name = "searchCategory", required = false) int searchCategory) {
//		
//		System.out.println(searchItemName);
//		System.out.println(searchCategory);
//		
//		B_RestResponseDto restResponseDto = new B_RestResponseDto();
//		
//		restResponseDto.setResult("success");
//		restResponseDto.setData(itemStaffService.getSearchItemList(searchItemName, searchCategory)); 
//		
//		return restResponseDto;
//	}
	
	//check-box 검색 쿼리
	@RequestMapping("restSearchItemList")
	public B_RestResponseDto restSearchItemList(
			@RequestParam(name = "searchItemName", defaultValue = "default" ) String searchItemName,  
			@RequestParam(name = "searchCategory", required = false) int[] searchCategory) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStaffService.getSearchItemList(searchItemName, searchCategory));
		
		return restResponseDto;
	}
	
}
