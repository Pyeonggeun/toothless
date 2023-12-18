package com.mkfactory.toothless.b.kh.medicine.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
		
		//add pk select로 seq올리는 코드 필요
		
		medicineService.InsertMedicineAdd(medicineAddDto);
		
		
		//입고후 계산을 위해서 재고관리에도 넣어줌
//		MedicineInventoryDto medicineInventoryDto = new MedicineInventoryDto();
//		
//		medicineInventoryDto.setMedicine_code_pk(medicineAddDto.getMedicine_code_pk());
//		medicineInventoryDto.setStaff_pk(medicineAddDto.getStaff_pk());
//		//입고된 약품전체 수량
//		int addTotalQuantity = medicineService.checkTotalAddQuantity(medicineAddDto.getMedicine_code_pk());
//		//입고후 약품재고 수량
//		MedicineInventoryDto justQuantity = medicineService.getInventoryInfoByMedicinePk(medicineAddDto.getMedicine_code_pk());
//		int inventoryQuantity =	justQuantity.getQuantity();
//		int result = addTotalQuantity + inventoryQuantity;
//		medicineInventoryDto.setQuantity(result);
//		
//		//mgmt, reason은 null로 들어가나?
//		if(medicineInventoryDto.getReason() == null) {
//			medicineInventoryDto.setReason("입고");
//		}
		
		return "redirect:./medicineAdd";
	}
	
	// 의약품 재고 관리 페이지
	@RequestMapping("medicineInventory")
	public String medicineInventory(
			@RequestParam(required = false, defaultValue = "0")int medicine_code_pk,
			Model model) {
		
		//의약품 목록 + 자동으로 코드 작성용
		List<MedicineCodeDto> medicineList = medicineService.getAllMedicineInfo();
		model.addAttribute("medicineList",medicineList);
		
		//코드넘버만 받기위한
		if(medicine_code_pk == 0) {
			
		}else {
			model.addAttribute("medicine_code_pk", medicine_code_pk);
		}
		//재고 정보 모두 보내기
		List<Map<String, Object>> allInventoryInfo = medicineService.getAllInventoryInfo();
		model.addAttribute("allInventoryInfo", allInventoryInfo);
		
		//약 카테고리 가져오기
		List<MedicineMgmtCatDto> MedicineMgmtCatDtoList = medicineService.getAllMedicineMgmtCat();
		model.addAttribute("MedicineMgmtCatDtoList",MedicineMgmtCatDtoList);
		
		//현재수량 계산
		
		List<Map<String, Object>> inventoryStatisticsList = medicineService.inventoryStatistics();
		
		model.addAttribute("inventoryStatisticsList", inventoryStatisticsList);
		
		List<Map<String, Object>> inventoryMedicineStatisticsList = medicineService.inventoryMedicineStatistics(medicine_code_pk);
		
//		//여기 첫번째만 합계 구할꺼임
//		
//		e.put("nowSum", nowSum);
		
		Integer sum = 0;
		
		for( int i = 0; i < inventoryMedicineStatisticsList.size(); i++ ) {
			
			Map<String, Object> map =  inventoryMedicineStatisticsList.get(i);
			map.get("QUANTITY");
//			System.out.println(map.get("QUANTITY"));
			Integer quantity = Integer.valueOf(String.valueOf(map.get("QUANTITY")));
			if("처방".equals(map.get("M_TYPE"))){
				sum -= quantity;
			}else {
				sum += quantity;
			}
			map.put("sum", sum);
			
		}
		
		model.addAttribute("inventoryMedicineStatisticsList",inventoryMedicineStatisticsList);
		
//		for(Map<String, Object> e : inventoryStatisticsList) {
//			
//			Integer mdPk = Integer.valueOf(String.valueOf(e.get("MEDICINE_CODE_PK")));
//			
//			List<Map<String, Object>> inventoryMedicineStatisticsList = medicineService.inventoryMedicineStatistics(mdPk);
//			//여기 첫번째만 합계 구할꺼임
//			
////			e.put("nowSum", nowSum);
//			
//			Integer sum = 0;
//			
//			for( int i = 0; i < inventoryMedicineStatisticsList.size() ; i++ ) {
//				
//				Map<String, Object> map =  inventoryMedicineStatisticsList.get(i);
//				map.get("QUANTITY");
////				System.out.println(map.get("QUANTITY"));
//				Integer quantity = Integer.valueOf(String.valueOf(map.get("QUANTITY")));
//				if("처방".equals(map.get("M_TYPE"))){
//					sum -= quantity;
//				}else {
//					sum += quantity;
//				}
//				System.out.println(sum);
//				
//			}
//
//		}
		
//		 모든 엔트리 출력
//	      Map<String, Object> testMap = inventoryStatisticsList.get(0);
//	      for (Map.Entry<String, Object> entry : testMap.entrySet()) {
//	          String key = entry.getKey();
//	          Object value = entry.getValue();
//	          System.out.println("Key: " + key + ", Value: " + value);
//	      }
		
		return "tl_b/kh/medicineInventory";
	}
	
	@RequestMapping("inventoryModifyProcess")
	public String inventoryModify(MedicineInventoryDto medicineInventoryDto) { 
		
		medicineService.insertModifiedInventory(medicineInventoryDto);
		
		return "redirect:./medicineInventory";
	}
	
}
