package com.mkfactory.toothless.b.kh.medicine.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.MedicineCodeDto;

public interface MedicineSqlMapper {

	public List<MedicineCodeDto> selectAllMedicineInfo();
}
