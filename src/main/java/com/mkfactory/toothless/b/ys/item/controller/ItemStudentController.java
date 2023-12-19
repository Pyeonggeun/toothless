package com.mkfactory.toothless.b.ys.item.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;
import com.mkfactory.toothless.b.ys.item.service.ItemStudentServiceImpl;

@Controller
@RequestMapping("/tl_b/ys/*")
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
	
	@RequestMapping("studentItemApplyInformationPage")
	public String studentItemApplyInformationPage() {
	
		
		return "tl_b/ys/studentItemApplyInformationPage";
	}
	
	@RequestMapping("studentItemApplyProcess")
	public String studentItemApplyProcess(ItemApplyDto itemApplyDto) {
		
		itemStudentService.applyItem(itemApplyDto);
		
		return "redirect:./studentItemListPage";
	}
	
}
