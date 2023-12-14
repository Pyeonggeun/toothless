package com.mkfactory.toothless.b.kh.medicine.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.MedicineMgmtCatDto;
import com.mkfactory.toothless.b.kh.medicine.service.MedicineServiceImpl;

@RestController
@RequestMapping("/tl_b/kh/*")
public class RestMedicineController {
	
	@Autowired
	private MedicineServiceImpl medicineService;
	
	//의약품 정보
	@RequestMapping("getMedicineList")
	public B_RestResponseDto getMedicineList() {
		
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		List<Map<String, Object>> medicineList = medicineService.getAllMedicineInfoAndCatName();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineList);
		
		return b_RestResponseDto;
	}
	
	//의약품 삭제 프로세스
	@RequestMapping("deletMedicineInfo")
	public B_RestResponseDto deletMedicineInfo(int medicine_code_pk) {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		medicineService.deleteMedicineInfo(medicine_code_pk);
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicine_code_pk);
		
		return b_RestResponseDto;
	}
	
	//입고정보 불러오기
	@RequestMapping("getAddInfo")
	public B_RestResponseDto getAddInfo() {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.addInfoAndMedicineInfo());
		
		return b_RestResponseDto;
	}
	//재고 통계 불러오기(DB쿼리맵)
	@RequestMapping("inventoryStatistics")
	public B_RestResponseDto inventoryStatistics() {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		medicineService.inventoryStatistics();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.inventoryStatistics());
		
		return b_RestResponseDto;
	}
	//의약품 현황 불러오기
	@RequestMapping("existMedicineInfo")
	public B_RestResponseDto existMedicineInfo(int medicine_code_pk) {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.ExistMedicineInfoByPk(medicine_code_pk));
		
		return b_RestResponseDto;
	}
	//의약품 등록할때 카테고리 값 불러오기
	@RequestMapping("getCategoryInfo")
	public B_RestResponseDto getCategoryInfo() {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		medicineService.getCategoryInfo();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.getCategoryInfo());
		
		return b_RestResponseDto;
	}
	
	//rest전용 정렬(의약품 리스트)
	@RequestMapping("orderedByMedicineList")
	public B_RestResponseDto orderedByMedicineList(
			@RequestParam(value = "orderNumber", defaultValue = "1", required = false) int orderNumber
			) {
		
//		@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,

		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		List<Map<String, Object>> medicineList = medicineService.RestGetMedicineInfo(orderNumber);
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineList);
		
		return b_RestResponseDto;
	}
	
	//rest전용 입고정보 불러오기
	@RequestMapping("restGetAddInfo")
	public B_RestResponseDto restGetAddInfo(
			@RequestParam(value = "orderDate", defaultValue = "1", required = false) int orderDate
			) {
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.RestAddInfoAndMedicineInfo(orderDate));
		
		return b_RestResponseDto;
	}
	
	@RequestMapping("reloadAddCatInfo")
	public B_RestResponseDto reloadAddCatInfo(){
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.getAllMedicineInfo());
		
		return b_RestResponseDto;
	}
	
	@RequestMapping("reloadInventoryInfo")
	public B_RestResponseDto reloadInventoryInfo(
			@RequestParam(value = "orderNumber", defaultValue = "1" , required = false) int orderNumber
			){
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.restInventoryStatistics(orderNumber));
		
		return b_RestResponseDto;
	}
	
	//수정할때 사용할 의약품 리스트
	
	@RequestMapping("restGetMedicineList")
	public B_RestResponseDto restGetMedicineList() {
		
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		List<Map<String, Object>> medicineList = medicineService.getAllMedicineInfoAndCatName();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineList);
		
		return b_RestResponseDto;
	}
	
	
	//수정할때 불러오는 restMedicineList
	
	@RequestMapping("restGetMedicineCodePk")
	public B_RestResponseDto restGetMedicineCodePk(
			@RequestParam(value = "medicine_code_pk" , required = false) int medicine_code_pk){
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.restSelectedMedicineInfoByMedicineCodePk(medicine_code_pk));
		
		return b_RestResponseDto;
	}
	
	//재고 카테고리 가져오기
	@RequestMapping("reloadInventoryCat")
	public B_RestResponseDto reloadInventoryCat(){
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		List<MedicineMgmtCatDto> MedicineMgmtCatDtoList = medicineService.getAllMedicineMgmtCat();
		b_RestResponseDto.setData(MedicineMgmtCatDtoList);
		
		return b_RestResponseDto;
	}
	//이름으로 유효성검사할라고 이름 가져옴
	@RequestMapping("getMedicineMgmtCatInfoByPk")
	public B_RestResponseDto getMedicineMgmtCatInfoByPk(int medicine_mgmt_cat_pk){
		B_RestResponseDto b_RestResponseDto = new B_RestResponseDto();
		
		b_RestResponseDto.setResult("success");
		b_RestResponseDto.setData(medicineService.restSelectedMedicineMgmtCatInfoByPk(medicine_mgmt_cat_pk));
		
		return b_RestResponseDto;
	}

}
