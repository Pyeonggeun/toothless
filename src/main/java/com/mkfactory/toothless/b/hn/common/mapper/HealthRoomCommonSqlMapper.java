package com.mkfactory.toothless.b.hn.common.mapper;

import java.util.List;
import java.util.Map;

public interface HealthRoomCommonSqlMapper {
	
	public List<Map<String, Object>> getItemList();
	public List<Map<String, Object>> getEduList();
	public List<Map<String, Object>> getStudentboardList();
	public List<Map<String, Object>> getStaffboardList();
	public int totalMedicineCount();
	public int addMedicineCount();
	public int outMedicineCount();
	public int disposalMedicineCount();
	public int lossMedicineCount();
	public int adjustmentMedicineCount();
	public List<Integer> getUserCountList();

}
