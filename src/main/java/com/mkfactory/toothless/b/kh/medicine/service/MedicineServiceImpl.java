package com.mkfactory.toothless.b.kh.medicine.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.MedicineAddDto;
import com.mkfactory.toothless.b.dto.MedicineCatDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.MedicineInventoryDto;
import com.mkfactory.toothless.b.dto.MedicineMgmtCatDto;
import com.mkfactory.toothless.b.kh.medicine.mapper.MedicineSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Service
public class MedicineServiceImpl {

	@Autowired
	private MedicineSqlMapper medicineSqlMapper;
	
	// 약 정보 + 카테고리 이름으로(Pk)
	public List<Map<String, Object>> getAllMedicineInfoAndCatName (){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<MedicineCodeDto> mediInfo = medicineSqlMapper.selectAllMedicineInfo();
		
		for(MedicineCodeDto medicineInfo : mediInfo) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			MedicineCatDto medicineCatInfo = medicineSqlMapper.selectedMedicineCatByMedicinePk(medicineInfo.getMedicine_cat_pk());
			
			map.put("medicineInfo", medicineInfo);
			map.put("medicineCatInfo", medicineCatInfo);
			
			list.add(map);
			
		}
		
		return list;
	}
	//약품 정보 등록
	public void registMedicineInfo (MedicineCodeDto medicineCodeDto) {
		
		medicineSqlMapper.insertMedicineInfo(medicineCodeDto);
		
	}
	//약품 정보 삭제(Pk이용)
	public void deleteMedicineInfo (int medicine_code_pk) {
		
		medicineSqlMapper.deleteMedicineInfo(medicine_code_pk);;
		
	}
	
	//##############################################입고########################################
	
	//약품정보 등록
	public void InsertMedicineAdd (MedicineAddDto medicineAddDto) {
		
		medicineSqlMapper.InsertMedicineAdd(medicineAddDto);
		
	}
	//약품정보 가져옴
	public List<MedicineCodeDto> getAllMedicineInfo(){
		
		return medicineSqlMapper.selectAllMedicineInfo();
	}
	
	//입고정보 + 약품정보
	public List<Map<String, Object>> addInfoAndMedicineInfo(){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<MedicineAddDto> addList = medicineSqlMapper.selectAllMedicineAddInfo();
		
		for(MedicineAddDto e : addList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			MedicineCodeDto medicineInfo = medicineSqlMapper.selectedMedicineInfoByMedicineCodePk(e.getMedicine_code_pk());
			StaffInfoDto staffInfo = medicineSqlMapper.selectedStaffInfoByStaffPk(e.getStaff_pk());
			map.put("addInfo", e);
			map.put("medicineInfo", medicineInfo);
			map.put("staffInfo", staffInfo);
			list.add(map);
			
		}
		
		return list;
		
		
		
	}
	
	//재고정보가져오기 -> 수정시 
	public List<Map<String, Object>> getAllInventoryInfo(){
		
		List<Map<String, Object>> allInventoryInfo = new ArrayList<Map<String,Object>>();
		
		//스태프 정보
		List<MedicineInventoryDto> inventoryList = medicineSqlMapper.selectAllInventoryInfo();
		
		for (MedicineInventoryDto e : inventoryList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			// 약품 정보 
			map.put("medicineInfo", medicineSqlMapper.selectedMedicineInfoByMedicineCodePk(e.getMedicine_code_pk())); 
			//관리 카테고리 정보
			map.put("medicineMgmtCatInfo", medicineSqlMapper.selectedMedicineMgmtCatInfoByPk(e.getMedicine_mgmt_cat_pk())); 
			//스태프 정보
			map.put("staffInfo", medicineSqlMapper.selectedStaffInfoByStaffPk(e.getStaff_pk()));
			//재고 정보
			map.put("inventoryInfo", e);
			
			allInventoryInfo.add(map);
			
		}
		
		return allInventoryInfo;
	}
	//재고 관리 카테고리? 가져오기
	public List<MedicineMgmtCatDto> getAllMedicineMgmtCat(){
		
		return medicineSqlMapper.selectAllMedicineMgmtCat();
		
	}
	//재고 수정사항 넣기
	public void insertModifiedInventory(MedicineInventoryDto medicineInventoryDto) {
		
		medicineSqlMapper.insertModifiedInventory(medicineInventoryDto);
	}
	//약품pk로 선택된 재고 Info
	public MedicineInventoryDto getInventoryInfoByMedicinePk(int medicine_code_pk) {
		
		return medicineSqlMapper.selectedInventoryInfoByMedicinePk(medicine_code_pk);
	}
	
	//현재수량계산
	public int currentQuantityCalculate(int pk) {
		
		medicineSqlMapper.selectAllMedicineAddInfo();
		//처방할때 -, 입고할때 + ,   (폐기,망실 - , 조정 + or -)
		return 1;
	}
	//입고 수량 계산
	public int checkTotalAddQuantity(int medicine_code_pk) {
		
		return medicineSqlMapper.checkTotalAddQuantity(medicine_code_pk);
	}
	
	//재고 통계
	public List<Map<String, Object>> inventoryStatistics(){
		
		return medicineSqlMapper.inventoryStatistics();
	}
	//특정 약품 재고 통계
	public List<Map<String, Object>> inventoryMedicineStatistics(int medicine_code_pk){
		
		return medicineSqlMapper.inventoryMedicineStatistics(medicine_code_pk);
	}
	
	
	
	
	
	
	
	
	
	
	//재고체크용이였는데 안씀
	public int checkInventoryInfo(int medicine_code_pk) {
		
		return medicineSqlMapper.countInventoryInfo(medicine_code_pk);
	}
	
	
}
