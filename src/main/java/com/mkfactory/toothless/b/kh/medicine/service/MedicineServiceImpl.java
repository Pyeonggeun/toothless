package com.mkfactory.toothless.b.kh.medicine.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.MedicineCodeDto;
import com.mkfactory.toothless.b.kh.medicine.mapper.MedicineSqlMapper;

@Service
public class MedicineServiceImpl {

	@Autowired
	private MedicineSqlMapper medicineSqlMapper;
	
	//테스트 코드
	public List<MedicineCodeDto> getAllMedicineInfo (){
		
		return medicineSqlMapper.selectAllMedicineInfo();
	}
}
