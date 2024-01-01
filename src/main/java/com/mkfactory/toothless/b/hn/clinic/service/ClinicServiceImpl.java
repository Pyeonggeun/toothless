package com.mkfactory.toothless.b.hn.clinic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.DiseaseCodeDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;
import com.mkfactory.toothless.b.hn.clinic.mapper.ClinicSqlMapper;

@Service
public class ClinicServiceImpl {
	
	@Autowired
	private ClinicSqlMapper clinicSqlMapper;
	
	public List<Map<String, Object>> getClinicPatientInfoList(int pageNumber, String searchWord) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ClinicPatientDto> clinicPatientInfoList = clinicSqlMapper.getClinicPatientInfoList(pageNumber, searchWord);
		
		for(ClinicPatientDto clinicPatientDto : clinicPatientInfoList) {
			Map<String, Object> map = new HashMap<>();
			String classify = clinicSqlMapper.getClinicPatientClassifyByResidentId(clinicPatientDto.getResident_id());
			
			if(classify == null) {
				classify = "외부인";
			}
			
			map.put("clinicPatientInfo", clinicPatientDto);
			map.put("classify", classify);
			
			list.add(map);
		}
		
		return list;
	}
	
	public int getClinicPatientTotalPageNumber(String searchWord) {
		
		return clinicSqlMapper.getClinicPatientTotalPageNumber(searchWord);
	}
	
	public void insertWaitingClinicPatientInfo(int clinic_patient_pk) {
		
		clinicSqlMapper.insertWaitingClinicPatientInfo(clinic_patient_pk);
	}
	
	public List<Map<String, Object>> getWaitingClinicPatientInfoList(int pageNumber) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<Integer> waitingClinicPatientPkList = clinicSqlMapper.getWaitingClinicPatientPkList(pageNumber);
		
		for(int e : waitingClinicPatientPkList) {
			Map<String, Object> map = new HashMap<>();
			ClinicPatientDto clinicPatientDto = clinicSqlMapper.getClinicPatientInfoByClinicPatientPk(e);
			String classify = clinicSqlMapper.getClinicPatientClassifyByResidentId(clinicPatientDto.getResident_id());
			
			if(classify == null) {
				classify = "외부인";
			}
			
			map.put("clinicPatientInfo", clinicPatientDto);
			map.put("classify", classify);
			
			list.add(map);
		}
		
		return list;
	}
	
	public int getWaitingClinicPatientTotalPageNumber() {
		
		return clinicSqlMapper.getWaitingClinicPatientTotalPageNumber();
	}
	
	public Map<String, Object> getNewClinicPatientInfo(String resident_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		String clasify = clinicSqlMapper.getClinicPatientClassifyByResidentId(resident_id);
		
		if(clasify == null) {
			clasify = "외부인";
		}
		
		map.put("clinicPatientInfo", clinicSqlMapper.getNewClinicPatientInfoByResidentId(resident_id));
		map.put("classify",clasify);
		
		return map;
	}
	
	public void insertNewClinicPatientInfo(ClinicPatientDto clinicPatientDto) {
		
		clinicSqlMapper.insertNewClinicPatientInfo(clinicPatientDto);
		clinicSqlMapper.insertWaitingClinicPatientInfo(clinicSqlMapper.getClinicPatientPkByResidentId(clinicPatientDto.getResident_id()));
	}
	
	public Map<String, Object> getClinicPatientLogInfo(int clinic_patient_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<ClinicPatientLogDto> clinicPatientLogList = clinicSqlMapper.getClinicPatientLogInfoListByClinicPatientPk(clinic_patient_pk);
		
		for(ClinicPatientLogDto clinicPatientLogDto : clinicPatientLogList) {
			
			Map<String, Object> logMap = new HashMap<>();
			
			logMap.put("clinicPatientLogInfo", clinicPatientLogDto);
			logMap.put("staffName", clinicSqlMapper.getStaffNameByStaffPk(clinicPatientLogDto.getStaff_pk()));
			logMap.put("diseaseName", clinicSqlMapper.getDiseaseNameByDiseaseCodePk(clinicPatientLogDto.getDisease_code_pk()));
			
			list.add(logMap);
			
		}
		
		map.put("clinicPatientInfo", clinicSqlMapper.getClinicPatientInfoByClinicPatientPk(clinic_patient_pk));
		map.put("clinicPatientLogInfoList", list);
		
		return map;
	}
	
	public Map<String, Object> getClinicPatientDetailLogInfo(int clinic_patient_log_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		ClinicPatientLogDto clinicPatientLogDto = clinicSqlMapper.getClinicPatientLogInfoByClinicPatientLogPk(clinic_patient_log_pk);
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<PrescriptionDto> prescriptionList = clinicSqlMapper.getPrescriptionInfoListByClinicPatientLogPk(clinic_patient_log_pk);
		
		for(PrescriptionDto prescriptionDto : prescriptionList) {
			
			Map<String, Object> prescriptionMap = new HashMap<>();			
			
			prescriptionMap.put("prescriptionInfo", prescriptionDto);
			prescriptionMap.put("medicineName", clinicSqlMapper.getMedicineNameByMedicineCodePk(prescriptionDto.getMedicine_code_pk()));
			
			list.add(prescriptionMap);
			
		}
		
		map.put("clinicPatientLogInfo", clinicPatientLogDto);
		map.put("diseaseName", clinicSqlMapper.getDiseaseNameByDiseaseCodePk(clinicPatientLogDto.getDisease_code_pk()));
		map.put("prescriptionInfoList", list);
		
		return map;
	}
	
	public List<DiseaseCodeDto> getDiseaseCodeInfoList() {
		
		return clinicSqlMapper.getDiseaseCodeInfoList();
	}
	
	public List<MedicineCodeDto> getMedicineCodeInfoList(int[] selectMedicines) {
		
		return clinicSqlMapper.getMedicineCodeInfoList(selectMedicines);
	}
	
	public int getMedicineMaxQuantity(int medicine_code_pk) {
		
		return clinicSqlMapper.getMedicineMaxQuantity(medicine_code_pk);
	}
	
	public void insertClinicPatientLogInfo(ClinicPatientLogDto clinicPatientLogDto, List<PrescriptionDto> list) {
		
		int clinic_patient_log_pk = clinicSqlMapper.getClinicPatientlogPk();
		clinicPatientLogDto.setClinic_patient_log_pk(clinic_patient_log_pk);
		
		if(list.size() != 1) {
			for(PrescriptionDto prescriptionDto : list) {
				
				if(prescriptionDto.getMedicine_code_pk() == 0) {
					continue;
				}
				
				prescriptionDto.setClinic_patient_log_pk(clinic_patient_log_pk);
				
				clinicSqlMapper.insertPrescriptionInfo(prescriptionDto);
				
			}
		}
		
		clinicSqlMapper.insertClinicPatientLogInfo(clinicPatientLogDto);
		
	}
	
	public void updateWaitingStatus(int clinic_patient_pk) {
		
		clinicSqlMapper.updateWaitingStatus(clinic_patient_pk);
		
	}
	
	public boolean isAreadyWaiting(int clinic_patient_pk) {
		
		return clinicSqlMapper.isAlreadyWaiting(clinic_patient_pk) > 0 ? true : false;
	}
	
	public boolean isAlreadyPatient(String resident_id) {
		
		return clinicSqlMapper.isAlreadyPatient(resident_id) > 0 ? true : false;
	}

}
