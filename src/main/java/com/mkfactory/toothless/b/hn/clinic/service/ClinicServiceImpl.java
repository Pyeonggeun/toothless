package com.mkfactory.toothless.b.hn.clinic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.hn.clinic.mapper.ClinicSqlMapper;

@Service
public class ClinicServiceImpl {
	
	@Autowired
	private ClinicSqlMapper clinicSqlMapper;
	
	public List<Map<String, Object>> getAllClinicPatientInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(ClinicPatientDto clinicPatientDto : clinicSqlMapper.getAllClinicPatientInfoList()) {
			
			Map<String, Object> map = new HashMap<>();
			
			String birth = clinicPatientDto.getResident_id().substring(0, clinicPatientDto.getResident_id().indexOf("-"));
			
			map.put("clinicPatientInfo", clinicPatientDto);
			map.put("birth", birth);
			
			list.add(map);
		}
		
		return list;
	}
	
	public Map<String, Object> getClinicPatientInfo(int clinic_patient_pk) {
		
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(ClinicPatientLogDto clinicPatientLogDto : clinicSqlMapper.getClinicPatientLogInfoListByClinicPatientPk(clinic_patient_pk)) {
			
			Map<String, Object> logMap = new HashMap<>();
			
			logMap.put("clinicPatientLogInfo", clinicPatientLogDto);
			logMap.put("prescriptionInfoList", clinicSqlMapper.getPrescriptionInfoListByClinicPatientLogPk(clinicPatientLogDto.getClinic_patient_log_pk()));
			
			list.add(logMap);
			
		}
		
		map.put("clinicPatientInfo", clinicSqlMapper.getClinicPatientInfoByClinicPatientPk(clinic_patient_pk));
		map.put("clinicPatientLogInfoList", list);
		
		
		return map;
	}

}
