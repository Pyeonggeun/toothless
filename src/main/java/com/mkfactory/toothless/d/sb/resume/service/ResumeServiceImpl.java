package com.mkfactory.toothless.d.sb.resume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
