package com.mkfactory.toothless.a.student.dm.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface DormStudentSqlMapperDm {
	
	public SemesterDto semesterByProgressState();
	
	public JoinDormInfoDto joinDormInfoBySemesterPk(int semester_pk);
	
	public List<DormNoticeDto> dormNoticeAllList();
	
	public StaffInfoDto staffInfoByStaffPk(int staff_pk);
	
	public void dormNoticeInsertByDormNoticeDto(DormNoticeDto dormNoticeDto);
	
	public DormNoticeDto dormNoticeInfoByDormNoticePk(int dorm_notice_pk);
	
	public void deleteDormNoticeInfoByDormNoticePk(int dorm_notice_pk);
}