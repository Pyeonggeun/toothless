package com.mkfactory.toothless.a.student.sj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.RequestRepairDto;
import com.mkfactory.toothless.a.student.sj.mapper.RequestRepairSqlMapper;

@Service
public class RequestRepairServiceImpl {
	@Autowired
	private RequestRepairSqlMapper requestRepairSqlMapper;
	
	public void insertRequestRepair(RequestRepairDto requestRepairDto){
		requestRepairSqlMapper.insertRequestRepair(requestRepairDto);
	}
}
