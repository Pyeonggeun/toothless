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
	
	//재고정보가져오기
	public List<MedicineInventoryDto> getAllInventoryInfo(){
		
		return medicineSqlMapper.selectAllInventoryInfo();
	}
	//재고 관리 카테고리? 가져오기
	public List<MedicineMgmtCatDto> getAllMedicineMgmtCat(){
		
		return medicineSqlMapper.selectAllMedicineMgmtCat();
	}
	//재고체크용이였는데 안씀
	public int checkInventoryInfo(int medicine_code_pk) {
		
		return medicineSqlMapper.countInventoryInfo(medicine_code_pk);
	}
}
