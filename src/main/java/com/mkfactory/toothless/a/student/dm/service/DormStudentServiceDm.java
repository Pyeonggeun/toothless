package com.mkfactory.toothless.a.student.dm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.student.dm.mapper.DormStudentSqlMapperDm;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Service
public class DormStudentServiceDm {
	
	@Autowired
	public DormStudentSqlMapperDm dormStudentSqlMapperDm;
	
	public Map<String, Object> semesterByProgressState() {
		
		Map<String, Object> map = new HashMap<>();
		
		SemesterDto semesterDto = dormStudentSqlMapperDm.semesterByProgressState();
		int semester_pk = semesterDto.getSemester_pk();
		
		JoinDormInfoDto joinDormInfoDto = dormStudentSqlMapperDm.joinDormInfoBySemesterPk(semester_pk);
		
		map.put("joinDormInfoDto", joinDormInfoDto);
		map.put("semesterDto", semesterDto);
		
		
		return map;
	}
	
	public List<Map<String, Object>> dormNoticeAllList(){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<DormNoticeDto> dormNoticeDto = dormStudentSqlMapperDm.dormNoticeAllList();
		
		for(DormNoticeDto e : dormNoticeDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int staff_pk = e.getStaff_pk();
			StaffInfoDto staffInfoDto = dormStudentSqlMapperDm.staffInfoByStaffPk(staff_pk);
			
			map.put("dormNoticeDto", e);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);
			
		}
		
		return list;
	}
	
	public void dormNoticeInsertByDormNoticeDto(DormNoticeDto dormNoticeDto) {
		
		dormStudentSqlMapperDm.dormNoticeInsertByDormNoticeDto(dormNoticeDto);
	}
	
	public DormNoticeDto dormNoticeInfoByDormNoticePk(int dorm_notice_pk) {
		
		
		return dormStudentSqlMapperDm.dormNoticeInfoByDormNoticePk(dorm_notice_pk);
	}
	
	public void deleteDormNoticeInfoByDormNoticePk(int dorm_notice_pk) {
		
		dormStudentSqlMapperDm.deleteDormNoticeInfoByDormNoticePk(dorm_notice_pk);
	}
	
}
