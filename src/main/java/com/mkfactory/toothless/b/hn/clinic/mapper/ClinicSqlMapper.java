package com.mkfactory.toothless.b.hn.clinic.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;

public interface ClinicSqlMapper {

	public List<ClinicPatientDto> getAllClinicPatientInfoList();
	
	public ClinicPatientDto getClinicPatientInfoByClinicPatientPk(int clinic_patient_pk);
	
	public List<ClinicPatientLogDto> getClinicPatientLogInfoListByClinicPatientPk(int clinic_patient_pk);
	public List<PrescriptionDto> getPrescriptionInfoListByClinicPatientLogPk(int clinic_patient_log_pk);
	public String getMedicineNameByMedicineCodePk(int medicine_code_pk);
	
	public List<MedicineCodeDto> getMedicineInfoList();
	
}
