package com.mkfactory.toothless.b.kh.medicine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.kh.medicine.service.MedicineServiceImpl;

@Controller
@RequestMapping("/tl_b/kh/*")
public class MedicineController {
	
	@Autowired
	private MedicineServiceImpl medicineService; 
	
	// 의약품 코드 등록 페이지
	@RequestMapping("codeRegistPage")
	public String codeRegistPage(Model model) {
		
		List<MedicineCodeDto> list = medicineService.getAllMedicineInfo();
		
		
		MedicineCodeDto dto = list.get(0);
		dto.getName();
		
		model.addAttribute("list", dto.getName());
		
		return "tl_b/kh/codeRegistPage";
	}
	// 의약품 입고 페이지
	@RequestMapping("medicineAdd")
	public String medicineAdd() {
		
		return "tl_b/kh/medicineAdd";
	}
	// 의약품 재고 관리 페이지
	@RequestMapping("medicineInventory")
	public String medicineInventory() {
		
		return "tl_b/kh/medicineInventory";
	}
	
}
