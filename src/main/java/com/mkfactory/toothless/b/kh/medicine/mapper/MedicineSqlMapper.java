package com.mkfactory.toothless.b.kh.medicine.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.MedicineAddDto;
import com.mkfactory.toothless.b.dto.MedicineCatDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.MedicineInventoryDto;
import com.mkfactory.toothless.b.dto.MedicineMgmtCatDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface MedicineSqlMapper {

	public List<MedicineCodeDto> selectAllMedicineInfo();
	
	public List<MedicineCatDto> selectAllMedicineCat();
	
	public MedicineCatDto selectedMedicineCatByMedicinePk(int medicine_code_pk);
	
	public void insertMedicineInfo(MedicineCodeDto medicineCodeDto);
	
	public void deleteMedicineInfo(int medicine_code_pk);
	
	public void InsertMedicineAdd(MedicineAddDto medicineAddDto);
	
	public List<MedicineAddDto> selectAllMedicineAddInfo();
	
	public MedicineCodeDto selectedMedicineInfoByMedicineCodePk(int medicine_code_pk);
	
	public int countInventoryInfo(int medicine_code_pk);
	
	public List<MedicineInventoryDto> selectAllInventoryInfo();
	
	public List<MedicineMgmtCatDto> selectAllMedicineMgmtCat();
	
	public MedicineMgmtCatDto selectedMedicineMgmtCatInfoByPk (int medicine_mgmt_cat_pk);
	
	public int checkTotalAddQuantity (int medicine_code_pk);
	
	public MedicineInventoryDto selectedInventoryInfoByMedicinePk (int medicine_code_pk);
	
	public List<Map<String, Object>> inventoryStatistics ();
	
	public List<Map<String, Object>> inventoryMedicineStatistics(int medicine_code_pk);
	
	//staff정보 가져오기
	
	public StaffInfoDto selectedStaffInfoByStaffPk(int staff_pk);
	
	public void insertModifiedInventory(MedicineInventoryDto medicineInventoryDto);
	
	//ajax때문에 생성
	
	public MedicineCodeDto selectExistMedicineInfoByPk(int medicine_code_pk);
	
	public List<MedicineCodeDto> RestSelectMedicineInfo(@Param("orderNumber") int orderNumber);
	
	public int checkAddLog(int medicine_code_pk);
	
	public List<MedicineAddDto> RestSelectAllMedicineAddInfo(@Param("orderDate") int orderDate);
	
	public List<Map<String, Object>> restInventoryStatistics(@Param("orderNumber") int orderNumber);
	
	public MedicineCodeDto restSelectedMedicineInfoByMedicineCodePk(int medicine_code_pk);
	
	public MedicineMgmtCatDto restSelectedMedicineMgmtCatInfoByPk(int medicine_mgmt_cat_pk);
	
	public void chainedDeleteAddinfo(int medicine_code_pk);
	
	public void chainedDeleteInventoryInfo(int medicine_code_pk);
	
	public List<Map<String, Object>> restInventoryInfoByPk(int medicine_code_pk);


	
}
