package com.mkfactory.toothless.b.ys.item.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.b.dto.ItemApplyDto;
import com.mkfactory.toothless.b.dto.ItemCatDto;
import com.mkfactory.toothless.b.dto.ItemDto;
import com.mkfactory.toothless.b.ys.item.service.ItemStaffServiceImpl;

@Controller
@RequestMapping("/tl_b/ys/*")
public class ItemStaffController {
	
	@Autowired
	private ItemStaffServiceImpl itemStaffService;
	
	@RequestMapping("itemListAndRegistPage")
	public String itemListAndRegistPage(Model model) {
	
		
		List<Map<String, Object>> list =  itemStaffService.getItemAndCategoryList();
		
		
		//테스트 코드
//		Map<String, Object> map = list.get(0);
//		
//		System.out.println(map.get("ITEM_PK")); 
//		System.out.println(map.get("CAT_NAME"));
//		System.out.println(map.get("ITEM_NAME"));

		
//		//물품 리스트
//		List<Map<String,Object>> itemList = itemStaffService.getItemList();
//		model.addAttribute("itemList",itemList);
		
		//물품 and 카테고리 조인 리스트
		model.addAttribute("itemAndCategoryList",itemStaffService.getItemAndCategoryList());
		
		//카테고리 리스트
		model.addAttribute("itemCategoryList",itemStaffService.getCategoryList()); 
		
		return "tl_b/ys/itemListAndRegistPage";
	}
	
	@RequestMapping("itemRegistProcess")
	public String itemRegistProcess(
			ItemDto params,
			MultipartFile mainImage
			) {
		
		
		if(mainImage != null) {
			 
			String rootPath = "C:/uploadFiles/mainImage/";
			
			// 날짜별 폴더 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			// 아래 new Date는 현재 날짜 반환 format으로 문자로 반환
			String todayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(rootPath + todayPath);
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = mainImage.getOriginalFilename();
			
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
			
			// 확장자 추출
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			fileName += ext;
			
			try {
				mainImage.transferTo(new File(rootPath + todayPath + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			params.setImg_link(todayPath + fileName);	
			
			
			}
		
			itemStaffService.registItem(params);
			return "redirect:./itemListAndRegistPage";
		}
	
	@RequestMapping("itemUpdateAndDeleteDetailPage")
	public String itemUpdateAndDeleteDetailPage(Model model, int item_pk) {
		
		model.addAttribute("getItem",itemStaffService.getItem(item_pk));
		
		//카테고리 리스트
		model.addAttribute("itemCategoryList",itemStaffService.getCategoryList());
		
		
		return "tl_b/ys/itemUpdateAndDeleteDetailPage";
	}
	
	@RequestMapping("itemUpdateProcess")
	public String itemUpdateProcess(ItemDto params , MultipartFile mainImage){
		System.out.println(params.getItem_pk());
		System.out.println(params.getItem_cat_pk());
		System.out.println(params.getName());
		System.out.println(params.getContent());
		System.out.println(params.getImg_link());
		if(mainImage != null) {
			 
			String rootPath = "C:/uploadFiles/mainImage/";
			
			// 날짜별 폴더 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			// 아래 new Date는 현재 날짜 반환 format으로 문자로 반환
			String todayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(rootPath + todayPath);
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = mainImage.getOriginalFilename();
			
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
			
			// 확장자 추출
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			fileName += ext;
			
			try {
				mainImage.transferTo(new File(rootPath + todayPath + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			params.setImg_link(todayPath + fileName);	
			
			
			}
		
		itemStaffService.updateItem(params);	
		return "redirect:./itemListAndRegistPage";
	}
	
	@RequestMapping("itemDeleteProcess")
	public String itemDeleteProcess(int item_pk) {
	
		itemStaffService.deleteItem(item_pk);
		
		return "redirect:./itemListAndRegistPage";
	}
	
	
	@RequestMapping("staffItemApplyListPage")
	public String staffItemApplyListPage(Model model) {
		
		model.addAttribute("itemApplyList",itemStaffService.getItemApplyList());
		
		return "tl_b/ys/staffItemApplyListPage";
	}
	
	//REST API
//	@RequestMapping("staffItemApplyListPage")
//	public List<Map<String,Object>> staffItemApplyListPage(Model model) {
//		
//		List<Map<String,Object>> itemApplyList = itemStaffService.getItemApplyList();
//		
//		return itemApplyList;
//
//	}
	
	@RequestMapping("rentalProcess")
	public String rentalProcess(int item_apply_pk) {
		
		
		itemStaffService.updateItemRentalStatus(item_apply_pk);
		
		
		return "redirect:./staffItemApplyListPage";
	}
	
	@RequestMapping("returnProcess")
	public String returnProcess(int item_apply_pk) {
		
		itemStaffService.updateItemReturnStatus(item_apply_pk);
		itemStaffService.deleteItemApply(item_apply_pk);
		
		return "redirect:./staffItemApplyListPage";
	}
}


