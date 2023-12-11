package com.mkfactory.toothless.b.ys.item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;
import com.mkfactory.toothless.b.ys.item.service.ItemStudentServiceImpl;

@RestController
@RequestMapping("/tl_b/ys/*")
public class RestItemStaffController {

	@Autowired
	private ItemStaffServiceImpl itemStaffService;
	
	@Autowired
	private ItemStudentServiceImpl itemStudentService;
	
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
}
