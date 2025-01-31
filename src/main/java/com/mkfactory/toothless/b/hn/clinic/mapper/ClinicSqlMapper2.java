package com.mkfactory.toothless.b.hn.clinic.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;

public interface ClinicSqlMapper2 {

	public List<ClinicPatientDto> getAllClinicPatientInfoList();
	
	public ClinicPatientDto getClinicPatientInfoByClinicPatientPk(int clinic_patient_pk);
	
	public List<ClinicPatientLogDto> getClinicPatientLogInfoListByClinicPatientPk(int clinic_patient_pk);
	public List<PrescriptionDto> getPrescriptionInfoListByClinicPatientLogPk(int clinic_patient_log_pk);
	public String getMedicineNameByMedicineCodePk(int medicine_code_pk);
	
	public List<MedicineCodeDto> getMedicineInfoList();
	
	public int isClinicPatientInfoExsit(String resident_id);
	public ClinicPatientDto getClinicPatientInfoByResidentId(String resident_id);
	public int getClinicPatientPkByResidentId(String resident_id);
	public int getClinicPatientLogPk();
	public void insertClinicPatientLogInfo(ClinicPatientLogDto clinicPatientLogDto);
	public void insertPrescriptionInfo(PrescriptionDto prescriptionDto);
	public void insertClinicPatientInfo(ClinicPatientDto clinicPatientDto);
	
	public String getClinicPatientClassifyByResidentId(String resident_id);
	
	
}
