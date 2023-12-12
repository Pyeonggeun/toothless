package com.mkfactory.toothless.a.student.jw.mapper;


import java.util.List;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;

public interface DormStudentMapperJw {

	// 외출/외박 신청페이지
	public int countDormStudentByStudentAndProgressSemester(int student_pk);
	public DormStudentDto selectDormStudentByStudentAndProgressSemester(int student_pk);
	public void insertExit(ExitDto exitDto);
	
	// 상/벌점 확인페이지
	public List<PointDto> selectPointByStudentAndProgressSemester(int student_pk);
	public PointCategory selectPointCategoryByPointCategoryPk(int point_category_pk);
	public int sumTotalPointByStudentPk(int student_pk);
	
}
