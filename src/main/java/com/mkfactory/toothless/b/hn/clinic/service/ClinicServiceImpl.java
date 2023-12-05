package com.mkfactory.toothless.b.hn.clinic.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;
import com.mkfactory.toothless.b.hn.clinic.mapper.ClinicSqlMapper;

@Service
public class ClinicServiceImpl {
	
	@Autowired
	private ClinicSqlMapper clinicSqlMapper;
	
	public List<Map<String, Object>> getAllClinicPatientInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(ClinicPatientDto clinicPatientDto : clinicSqlMapper.getAllClinicPatientInfoList()) {
			
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
	
	public Map<String, Object> getClinicPatientInfo(int clinic_patient_pk) {
		
		Map<String, Object> map = new HashMap<>();
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(ClinicPatientLogDto clinicPatientLogDto : clinicSqlMapper.getClinicPatientLogInfoListByClinicPatientPk(clinic_patient_pk)) {
			
			Map<String, Object> logMap = new HashMap<>();
			
			List<Map<String, Object>> prescriptionList = new ArrayList<>();
			
			for(PrescriptionDto prescriptionDto : clinicSqlMapper.getPrescriptionInfoListByClinicPatientLogPk(clinicPatientLogDto.getClinic_patient_log_pk())) {
				
				Map<String, Object> prescriptionMap = new HashMap<>();
				
				prescriptionMap.put("prescriptionInfo", prescriptionDto);
				prescriptionMap.put("medicineName", clinicSqlMapper.getMedicineNameByMedicineCodePk(prescriptionDto.getMedicine_code_pk()));
				
				prescriptionList.add(prescriptionMap);
				
			}

			logMap.put("clinicPatientLogInfo", clinicPatientLogDto);
			logMap.put("prescriptionInfoList", prescriptionList);
			
			list.add(logMap);
			
		}
		
		ClinicPatientDto clinicPatientDto = clinicSqlMapper.getClinicPatientInfoByClinicPatientPk(clinic_patient_pk);
		Map<String, Object> clinicPatientMap = new HashMap<>();
		
		if(clinic_patient_pk != 0) {
			String[] phone = clinicPatientDto.getPhone().split("-");
			String[] resident_id = clinicPatientDto.getResident_id().split("-");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String birth = sdf.format(clinicPatientDto.getBirth());
			
			clinicPatientMap.put("firstPhone", phone[0]);
			clinicPatientMap.put("secondPhone", phone[1]);
			clinicPatientMap.put("thirdPhone", phone[2]);
			clinicPatientMap.put("firstResidentId", resident_id[0]);
			clinicPatientMap.put("secondResidentId", resident_id[1]);
			clinicPatientMap.put("birth", birth);
			
			
		}
		clinicPatientMap.put("clinicPatientInfo", clinicPatientDto);
		
		
		map.put("clinicPatientInfoMap", clinicPatientMap);
		map.put("clinicPatientLogInfoList", list);
		
		
		return map;
	}
	
	public List<MedicineCodeDto> getMedicineInfoList() {
		
		return clinicSqlMapper.getMedicineInfoList();
	}
	
	public void insertClinicPatientInfo(ClinicPatientDto clinicPatientDto, ClinicPatientLogDto clinicPatientLogDto, List<PrescriptionDto> list) {
		
		if(clinicSqlMapper.isClinicPatientInfoExsit(clinicPatientDto.getResident_id()) == 0) {
			
			ClinicPatientDto clinicPatientDto2 = clinicSqlMapper.getClinicPatientInfoByResidentId(clinicPatientDto.getResident_id());
			if(clinicPatientDto2 == null) {
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				int age = Integer.parseInt(sdf.format(new Date())) - Integer.parseInt(sdf.format(clinicPatientDto.getBirth())) + 1;
				clinicPatientDto.setAge(age);
				
				clinicSqlMapper.insertClinicPatientInfo(clinicPatientDto);
				
			}else {
				
				clinicSqlMapper.insertClinicPatientInfo(clinicPatientDto2);
				
			}
			
		}
		
		int clinicPatientLogPk = clinicSqlMapper.getClinicPatientLogPk();
		
		clinicPatientLogDto.setClinic_patient_pk(clinicSqlMapper.getClinicPatientPkByResidentId(clinicPatientDto.getResident_id()));
		clinicPatientLogDto.setClinic_patient_log_pk(clinicPatientLogPk);
		clinicSqlMapper.insertClinicPatientLogInfo(clinicPatientLogDto);
		
		for(PrescriptionDto prescriptionDto : list) {
			prescriptionDto.setClinic_patient_log_pk(clinicPatientLogPk);
			clinicSqlMapper.insertPrescriptionInfo(prescriptionDto);
		}
		
	}

}
