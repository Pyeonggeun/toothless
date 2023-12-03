package com.mkfactory.toothless.e.registercounselor.mapper;

import com.mkfactory.toothless.e.dto.CounselorDto;

public interface RegisterCounselorSqlMapper {
	
	// 상담원 PK 생성
	public int createCounselorPk();
	
	// 상담원 등록
	public void insertCounselor(CounselorDto counselorDto);

}
