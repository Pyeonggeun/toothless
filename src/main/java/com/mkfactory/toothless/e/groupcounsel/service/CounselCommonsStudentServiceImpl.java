package com.mkfactory.toothless.e.groupcounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.groupcounsel.mapper.CounselCommonsStudentSqlMapper;

@Service
public class CounselCommonsStudentServiceImpl {
	
	@Autowired
	CounselCommonsStudentSqlMapper counselCommonsStudentMapper;
	
	
	public List<Map<String, Object>> getGroupCounselList(int student_pk){
		List<Map<String, Object>> list = counselCommonsStudentMapper.getGroupCounselReservationById(student_pk);

		return counselCommonsStudentMapper.getGroupCounselReservationById(student_pk);
	}
	
	
	public List<Map<String, Object>> getNoticeList(){
		
		List<NoticeBoardDto> noticeList = counselCommonsStudentMapper.getNoticeList();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(NoticeBoardDto noticeBoardDto : noticeList ) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			int staffPk = noticeBoardDto.getStaff_pk();
			int noticeId = noticeBoardDto.getId();
			
			int countNoticeComment = counselCommonsStudentMapper.getCountNoticeCommentByNoticeId(noticeId);
			StaffInfoDto staffInfoDto = counselCommonsStudentMapper.getStaffInfoByStaffPk(staffPk);
			map.put("staffInfoDto", staffInfoDto);
			map.put("noticeBoardDto", noticeBoardDto);
			map.put("countNoticeComment", countNoticeComment);
			
			list.add(map);
		}
		
		
		return list;
	}
	
	public List<FreeboardDto> getFreeboardList(){
		
		return counselCommonsStudentMapper.getFreeboardList();
	}
	
	public List<Map<String, Object>> getOfflineCounselList(int student_pk){
		
		return counselCommonsStudentMapper.getOfflineCounselListByStudentId(student_pk);
	}
	
	
	
	
}
