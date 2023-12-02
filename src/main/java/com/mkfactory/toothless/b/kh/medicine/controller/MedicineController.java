package com.mkfactory.toothless.b.kh.medicine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_b/kh/*")
public class MedicineController {
	
	@RequestMapping("codeRegistPage")
	public String codeRegistPage() {
		
		return "tl_b/kh/codeRegistPage";
	}
	@RequestMapping("medicineAdd")
	public String medicineAdd() {
		
		return "tl_b/kh/medicineAdd";
	}
	@RequestMapping("medicineInventory")
	public String medicineInventory() {
		
		return "tl_b/kh/medicineInventory";
	}
	
	

	
	
	@RequestMapping("sidebar")
	public String sidebar() {
		
		return "tl_b/kh/sidebar";
	}
}
