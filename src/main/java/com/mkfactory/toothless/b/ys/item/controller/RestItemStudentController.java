package com.mkfactory.toothless.b.ys.item.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;
import com.mkfactory.toothless.b.ys.item.service.ItemStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_b/ys/*")
public class RestItemStudentController {
	
	@Autowired
	private ItemStudentServiceImpl itemStudentService;
	
	@Autowired
	private ItemStaffServiceImpl itemStaffService;
	
	@RequestMapping("restStudentInfo")
	public B_RestResponseDto restStudentInfo(HttpSession session) {
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(sessionStudentInfo);
		
		return restResponseDto;
		
	}
	
	@RequestMapping("restGetItemAndItemApplyList")
	public B_RestResponseDto restGetItemAndItemApplyList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStudentService.getItemAndItemApplyList());
		
		return restResponseDto;
	}
	
	@RequestMapping("restGetItemAndItemApplyListByCategoryPk")
	public B_RestResponseDto restGetItemAndItemApplyListByCategoryPk(int item_cat_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();

		if(item_cat_pk == 0) {
			
			restResponseDto.setData(itemStudentService.getItemAndItemApplyList());
			restResponseDto.setResult("success");
			
			return restResponseDto;
		}else {
			restResponseDto.setResult("success");
			restResponseDto.setData(itemStudentService.getItemAndItemApplyListByCategoryPk(item_cat_pk));
			
			return restResponseDto;
		}
	}
	
	@RequestMapping("restGetStudentItem")
	public B_RestResponseDto restGetStudentItem(int item_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStaffService.getItem(item_pk));
		
		return restResponseDto;
	}
	
	
	
	
	@RequestMapping("reststudentItemApply")
	public B_RestResponseDto reststudentItemApply(ItemApplyDto itemApplyDto) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		itemStudentService.applyItem(itemApplyDto);
		
		return restResponseDto;
	}
	
	@RequestMapping("restItemStatus")
	public B_RestResponseDto restItemStatus(int item_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStudentService.getItemApplyStatus(item_pk));		
		
		return restResponseDto;
	}
	
	@RequestMapping("restItemApplyCount")
	public B_RestResponseDto restItemApplyCount(int item_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStudentService.getItemApplyCount(item_pk));
		
		return restResponseDto;
	}
	
	@RequestMapping("restStudentSearchItemList")
	public B_RestResponseDto restStudentSearchItemList(
			@RequestParam(name = "searchItemName", defaultValue = "default" ) String searchItemName,
			@RequestParam(name = "searchCategory", required = false ) int searchCategory){
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setResult("success");
		restResponseDto.setData(itemStudentService.searchItemList(searchItemName, searchCategory));		
		
		return restResponseDto;
	}
}
