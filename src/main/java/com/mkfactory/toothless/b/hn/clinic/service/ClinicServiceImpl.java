package com.mkfactory.toothless.b.hn.clinic.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.hn.clinic.mapper.ClinicSqlMapper;

@Service
public class ClinicServiceImpl {
	
	@Autowired
	ClinicSqlMapper clinicSqlMapper;
	
	public List<Map<String, Object>> getAllClinicPatientInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		for(ClinicPatientDto clinicPatientDto : clinicSqlMapper.getAllClinicPatientInfoList()) {
			
			String birth = clinicPatientDto.getResident_id().substring(0);
			
		}
		
		return list;
	}

}
