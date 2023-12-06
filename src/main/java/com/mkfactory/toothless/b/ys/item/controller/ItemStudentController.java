package com.mkfactory.toothless.b.ys.item.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;
import com.mkfactory.toothless.b.ys.item.service.ItemStudentServiceImpl;

@Controller
@RequestMapping("tl_b/ys/*")
public class ItemStudentController {

	@Autowired
	private ItemStudentServiceImpl itemStudentService;
	
	@Autowired
	public ItemStaffServiceImpl itemStaffService;
	
	@RequestMapping("studentItemListPage")
	public String studentItemListPage(Model model) {
	
		//model.addAttribute("itemList",itemStaffService.getItemList()); 
		model.addAttribute("itemList",itemStudentService.getItemAndItemApplyList());
		
		return "tl_b/ys/studentItemListPage";
	}
	
	@RequestMapping("studentItemApplyPage")
	public String studentItemApplyPage(Model model, int item_pk) {
		
		ItemDto getItem = itemStaffService.getItem(item_pk);
		model.addAttribute("getItem",getItem);
		
		return "tl_b/ys/studentItemApplyPage";
	}
	
	@RequestMapping("studentItemApplyProcess")
	public String studentItemApplyProcess(ItemApplyDto itemApplyDto) {
		
		itemStudentService.applyItem(itemApplyDto);
		
		return "redirect:./studentItemListPage";
	}
}
