package com.mkfactory.toothless.d.sb.resume.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.sb.resume.mapper.ResumeSqlMapper;

@Service
public class ResumeServiceImpl {

	@Autowired
	private ResumeSqlMapper resumeSqlMapper;
	
	// 이력서 등록
	public void resumeRegistration(ResumeDto resumeDto) {
		
		if(resumeDto.getMain_resume().equals("Y")) {
		
			List<ResumeDto> resumeList = resumeSqlMapper.getResumeListByStudentPk(resumeDto);
			for(ResumeDto resumeDto2 : resumeList) {
				if(resumeDto2.getMain_resume().equals("Y") || resumeDto2.getIs_public().equals("Y") ) {
					int resume_pk = resumeDto2.getResume_pk();
					resumeDto.setResume_pk(resume_pk);
					resumeSqlMapper.changeMainAndPublic(resumeDto);
				}
				
			}
			
		}
		
		resumeSqlMapper.insertResumeDto(resumeDto);
		
	}
	
	// 학생 이력서 목록 가져오기
	public List<ResumeDto> getResumeList(ResumeDto resumeDto) {
		
		List<ResumeDto> resumeList = resumeSqlMapper.getResumeListByStudentPk(resumeDto);
		
		return resumeList;
	}
	
	
	// 이력서 상세보기
	public ResumeDto getResume(ResumeDto resumeDto) {
		
		ResumeDto dto = resumeSqlMapper.getThisResumeDtoByResumePk(resumeDto);
		
		return dto;
	}
	
	// 경력 카테고리 가져오기
	public List<CareerCategoryDto> getCareerCategory(){
		
		List<CareerCategoryDto> careerList = resumeSqlMapper.getCareerCategoryList();
		
		return careerList;
	}
	
	
	// 경력 추가
	public void insertCareer(CareerDto careerDto) {
		
		resumeSqlMapper.insertCareerContents(careerDto);
	}
	
	
	// 해당 이력성에 작성한 경력 목록 가져오기
	public List<Map<String, Object>> getCareerDtoList(ResumeDto resumeDto) {
		// 이력서 번호에 해당되는 경력 리스트 뽑아오기
		
		List<Map<String, Object>> careerList = new ArrayList<Map<String,Object>>();
		
		List<CareerDto> list = resumeSqlMapper.getCareerByResumePk(resumeDto);
		
		for(CareerDto careerDto : list) {
			int category_pk = careerDto.getCareer_category_pk();
			CareerCategoryDto careerName = resumeSqlMapper.getCareerCategoryNameByCategoryPk(category_pk);
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("careerName", careerName);
			map.put("careerDto", careerDto);
			
			careerList.add(map);
		}
		
		return careerList;
	}
	
	// 경력 삭제
	public void deleteCareer(CareerDto careerDto) {
		resumeSqlMapper.deleteCareerByCareerPk(careerDto);
	}
	
	// 경력 수정
	public void updateCareer(CareerDto careerDto) {
		resumeSqlMapper.updateCareerByCareerPk(careerDto);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
