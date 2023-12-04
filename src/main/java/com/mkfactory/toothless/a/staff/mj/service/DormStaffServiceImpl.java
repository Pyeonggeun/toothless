package com.mkfactory.toothless.a.staff.mj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.staff.mj.mapper.DormStaffSqlMapper;

@Service
public class DormStaffServiceImpl {

	@Autowired
	private DormStaffSqlMapper staffSqlMapper;
}
