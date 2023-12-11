package com.mkfactory.toothless.b.hn.clinic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;

public interface ClinicSqlMapper {
	
	public List<ClinicPatientDto> getClinicPatientInfoList(
			@Param("pageNumber") int pageNumber, @Param("searchWord") String searchWord);
	public String getClinicPatientClassifyByResidentId(String resident_id);
	
	public int getClinicPatientTotalPageNumber(String searchWord);
	
	public void insertWaitingClinicPatientInfo(int clinic_patient_pk);
	
	public List<Integer> getWaitingClinicPatientPkList(int pageNumber);
	public ClinicPatientDto getClinicPatientInfoByClinicPatientPk(int clinic_patient_pk);
	
	public int getWaitingClinicPatientTotalPageNumber();
}
