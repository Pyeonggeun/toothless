package com.mkfactory.toothless.b.hn.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.hn.common.mapper.HealthRoomCommonSqlMapper;

@Service
public class HealthRoomCommonServiceImpl {
	
	@Autowired
	private HealthRoomCommonSqlMapper healthRoomCommonSqlMapper;
	
	public List<Map<String, Object>> getItemList() {
		
		return healthRoomCommonSqlMapper.getItemList();
	}
	
	public List<Map<String, Object>> getEduList() {
		
		return healthRoomCommonSqlMapper.getEduList();
	}
	
	public List<Map<String, Object>> getStudentboardList() {
		
		return healthRoomCommonSqlMapper.getStudentboardList();
	}
	
	public List<Map<String, Object>> getStaffboardList() {
		
		return healthRoomCommonSqlMapper.getStaffboardList();
	}
	
	public Map<String, Object> getMedicineCount() {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("totalMedicineCount", healthRoomCommonSqlMapper.totalMedicineCount());
		map.put("addMedicineCount", healthRoomCommonSqlMapper.addMedicineCount());
		map.put("outMedicineCount", healthRoomCommonSqlMapper.outMedicineCount());
		map.put("disposalMedicineCount", healthRoomCommonSqlMapper.disposalMedicineCount());
		map.put("lossMedicineCount", healthRoomCommonSqlMapper.lossMedicineCount());
		map.put("adjustmentMedicineCount", healthRoomCommonSqlMapper.adjustmentMedicineCount());
		
		return map;
	}
	
	public List<Integer> getUserCountList() {
		
		return healthRoomCommonSqlMapper.getUserCountList();
	}

}
