package com.mkfactory.toothless.b.hn.clinic.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
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

}
