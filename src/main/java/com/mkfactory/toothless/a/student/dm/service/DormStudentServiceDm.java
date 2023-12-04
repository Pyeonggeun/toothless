package com.mkfactory.toothless.a.student.dm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.student.dm.mapper.DormStudentSqlMapperDm;

@Service
public class DormStudentServiceDm {
	
	@Autowired
	public DormStudentSqlMapperDm dormStudentSqlMapperDm;
	
	
}
