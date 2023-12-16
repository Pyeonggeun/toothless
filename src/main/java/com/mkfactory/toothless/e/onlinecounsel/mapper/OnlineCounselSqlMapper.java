package com.mkfactory.toothless.e.onlinecounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.NoticeBoardDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.OnlineCounselReplyDto;
import com.mkfactory.toothless.e.dto.OnlineCounselSurveyDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface OnlineCounselSqlMapper {

	//		**		공용		**
	
	public int getReplyCount(int counsel_pk);
	
	public List<TypeCategoryDto> takeAllCategory();
	
	public TypeCategoryDto selectCategoryDto(int category_id);

	public int isSurveyed(int counsel_pk);
	
	public OnlineCounselSurveyDto selectSurvey(int counsel_pk);

	
	//		**	학생관련	**
	
	public void insertOnlineCounsel(OnlineCounselBoardDto onlineCounselBoardDto);
	
	public List<OnlineCounselBoardDto> selectAllCounselListByStudentPk(int student_id);
	
	public StudentInfoDto getStudentInfo(int student_id);
	
	public OnlineCounselBoardDto selectCounsel(int counsel_pk);
	
	public void insertOnlineCounselSurvey(OnlineCounselSurveyDto onlineCounselSurveyDto);
	
	
	//		***		상담원 관련	***
	
	public CounselorDto selectCounselorDto(int externalPk);
	
	public List<CounselorTypeDto> selectCounselTypeDto(int counselorId);
	
	public List<OnlineCounselBoardDto> selectCounselList(int typeCategoryId);
	
	public void insertOnlineCounselReply(OnlineCounselReplyDto onlineCounselReplyDto);
	
	public List<OnlineCounselReplyDto> selectReplyListByCounselPk(int counsel_pk);
	
	
	
	
	//		***		공용 UI용		***
	
	public List<NoticeBoardDto> selectNoticeListSpecificNum();
	
	public List<FreeboardDto> selectFreeboardListSpecificNum();
	
	public List<GroupCounselDto> selectGroupCounselListSpecificNum();
	
	
	
}