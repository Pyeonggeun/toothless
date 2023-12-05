package com.mkfactory.toothless.b.kh.medicine.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.b.dto.MedicineAddDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.MedicineInventoryDto;
import com.mkfactory.toothless.b.dto.MedicineMgmtCatDto;
import com.mkfactory.toothless.b.kh.medicine.service.MedicineServiceImpl;

@Controller
@RequestMapping("/tl_b/kh/*")
public class MedicineController {
	
	@Autowired
	private MedicineServiceImpl medicineService; 
	
	// 의약품 코드 등록 페이지
	@RequestMapping("codeRegistPage")
	public String codeRegistPage(Model model) {
		
		List<Map<String, Object>> MedicineList = medicineService.getAllMedicineInfoAndCatName();
		
		model.addAttribute("MedicineList", MedicineList);
		
		return "tl_b/kh/codeRegistPage";
	}
	// 의약품 등록 프로세스
	@RequestMapping("codeRegistProcess")
	public String codeRegistProcess(MedicineCodeDto medicineCodeDto) {
		
		medicineService.registMedicineInfo(medicineCodeDto);
		
		return "redirect:./codeRegistPage";
	}
	// 의약품 삭제 프로세스
	@RequestMapping("codeDeleteProcess")
	public String codeDeleteProcess(int medicine_code_pk) {
		
		medicineService.deleteMedicineInfo(medicine_code_pk);
		
		return "redirect:./codeRegistPage";
	}
	// 의약품 입고 페이지
	@RequestMapping("medicineAdd")
	public String medicineAdd(Model model) {
		
		//입고 등록용 정보
		model.addAttribute("medicineInfo",medicineService.getAllMedicineInfo());
		
		List<Map<String, Object>> addInfoAndMedicineInfoList = medicineService.addInfoAndMedicineInfo();
		
		model.addAttribute("addInfoAndMedicineInfoList",addInfoAndMedicineInfoList);
		
//		System.out.println(testMap.get("Q"));
//
//		model.addAttribute("testList", testList);
		// 모든 엔트리 출력
//		List<Map<String, Object>> testList = medicineService.test();
//		Map<String, Object> testMap = testList.get(0);
//		for (Map.Entry<String, Object> entry : testMap.entrySet()) {
//		    String key = entry.getKey();
//		    Object value = entry.getValue();
//		    System.out.println("Key: " + key + ", Value: " + value);
//		}

//		
		
		
		return "tl_b/kh/medicineAdd";
	}
	// 의약품 입고 프로세스
	@RequestMapping("medicineAddProcess")
	public String medicineAddProcess(MedicineAddDto medicineAddDto) {
		
		medicineService.InsertMedicineAdd(medicineAddDto);
		
		return "redirect:./medicineAdd";
	}
	
	// 의약품 재고 관리 페이지
	@RequestMapping("medicineInventory")
	public String medicineInventory(
			@RequestParam(required = false, defaultValue = "0")int medicine_code_pk,
			Model model) {
		
		List<MedicineCodeDto> medicineList = medicineService.getAllMedicineInfo();
		model.addAttribute("medicineList",medicineList);
		
		//코드넘버만 받기위한
		if(medicine_code_pk == 0) {
			
		}else {
			model.addAttribute("medicine_code_pk", medicine_code_pk);
		}
		
		List<MedicineInventoryDto> inventoryList = medicineService.getAllInventoryInfo();
		model.addAttribute("inventoryList",inventoryList);
		
		//약 카테고리 가져오기
		List<MedicineMgmtCatDto> MedicineMgmtCatDtoList = medicineService.getAllMedicineMgmtCat();
		model.addAttribute("MedicineMgmtCatDtoList",MedicineMgmtCatDtoList);
		
		return "tl_b/kh/medicineInventory";
	}
	
	@RequestMapping("inventoryModifyProcess")
	public String inventoryModify(MedicineInventoryDto medicineInventoryDto) { 
		
		
		
		return "redirect:./medicineInventory";
	}
}
