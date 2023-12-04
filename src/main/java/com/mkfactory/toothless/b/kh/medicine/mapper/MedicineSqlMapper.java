package com.mkfactory.toothless.b.kh.medicine.mapper;

import java.util.List;
import java.util.Map;

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
	
	//staff정보 가져오기
	
	public StaffInfoDto selectedStaffInfoByStaffPk(int staff_pk);
	
}
