package com.mkfactory.toothless.b.hn.clinic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.DiseaseCodeDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;

public interface ClinicSqlMapper {
	
	public List<ClinicPatientDto> getClinicPatientInfoList(
			@Param("pageNumber") int pageNumber, @Param("searchWord") String searchWord);
	public String getClinicPatientClassifyByResidentId(String resident_id);
	
	public int getClinicPatientTotalPageNumber(String searchWord);
	
	public void insertWaitingClinicPatientInfo(int clinic_patient_pk);
	
	public List<Integer> getWaitingClinicPatientPkList(int pageNumber);
	public ClinicPatientDto getClinicPatientInfoByClinicPatientPk(int clinic_patient_pk);
	
	public int getWaitingClinicPatientTotalPageNumber();
	
	public ClinicPatientDto getNewClinicPatientInfoByResidentId(String resident_id);
	
	public void insertNewClinicPatientInfo(ClinicPatientDto clinicPatientDto);
	public int getClinicPatientPkByResidentId(String resident_id);
	
	public List<ClinicPatientLogDto> getClinicPatientLogInfoListByClinicPatientPk(int clinic_patient_pk);
	public String getStaffNameByStaffPk(int staff_pk);
	public String getDiseaseNameByDiseaseCodePk(int disease_code_pk);
	
	public ClinicPatientLogDto getClinicPatientLogInfoByClinicPatientLogPk(int clinic_patient_log_pk);
	public List<PrescriptionDto> getPrescriptionInfoListByClinicPatientLogPk(int clinic_patient_log_pk);
	public String getMedicineNameByMedicineCodePk(int medicine_code_pk);
	
	public List<DiseaseCodeDto> getDiseaseCodeInfoList();
	public List<MedicineCodeDto> getMedicineCodeInfoList(int[] selectMedicines);
	public int getMedicineMaxQuantity(int medicine_code_pk);
	
	public int getClinicPatientlogPk();
	public void insertClinicPatientLogInfo(ClinicPatientLogDto clinicPatientLogDto);
	public void insertPrescriptionInfo(PrescriptionDto prescriptionDto);
	
	public void updateWaitingStatus(int clinic_patient_pk);
	
	public int isAlreadyWaiting(int clinic_patient_pk);
	public int isAlreadyPatient(String resident_id);
}
