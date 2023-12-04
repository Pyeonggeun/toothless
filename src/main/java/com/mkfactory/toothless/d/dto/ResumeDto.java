package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class ResumeDto {
	// 이력서
	private int resume_pk;
	private int student_pk;
	private String resume_title;
	private String cover_letter;
	private String main_resume;
	private String is_public;
	private Date created_at;
	
	public ResumeDto() {
		super();
	}

	public ResumeDto(int resume_pk, int student_pk, String resume_title, String cover_letter, String main_resume,
			String is_public, Date created_at) {
		super();
		this.resume_pk = resume_pk;
		this.student_pk = student_pk;
		this.resume_title = resume_title;
		this.cover_letter = cover_letter;
		this.main_resume = main_resume;
		this.is_public = is_public;
		this.created_at = created_at;
	}

	public int getResume_pk() {
		return resume_pk;
	}

	public void setResume_pk(int resume_pk) {
		this.resume_pk = resume_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public String getResume_title() {
		return resume_title;
	}

	public void setResume_title(String resume_title) {
		this.resume_title = resume_title;
	}

	public String getCover_letter() {
		return cover_letter;
	}

	public void setCover_letter(String cover_letter) {
		this.cover_letter = cover_letter;
	}

	public String getMain_resume() {
		return main_resume;
	}

	public void setMain_resume(String main_resume) {
		this.main_resume = main_resume;
	}

	public String getIs_public() {
		return is_public;
	}

	public void setIs_public(String is_public) {
		this.is_public = is_public;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
}
