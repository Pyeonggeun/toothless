package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class CareerDto {

	private int career_pk;
	private int resume_pk;
	private int career_category_pk;
	private String career_contents;
	private Date created_at;
	
	public CareerDto() {
		super();
	}

	public CareerDto(int career_pk, int resume_pk, int career_category_pk, String career_contents, Date created_at) {
		super();
		this.career_pk = career_pk;
		this.resume_pk = resume_pk;
		this.career_category_pk = career_category_pk;
		this.career_contents = career_contents;
		this.created_at = created_at;
	}

	public int getCareer_pk() {
		return career_pk;
	}

	public void setCareer_pk(int career_pk) {
		this.career_pk = career_pk;
	}

	public int getResume_pk() {
		return resume_pk;
	}

	public void setResume_pk(int resume_pk) {
		this.resume_pk = resume_pk;
	}

	public int getCareer_category_pk() {
		return career_category_pk;
	}

	public void setCareer_category_pk(int career_category_pk) {
		this.career_category_pk = career_category_pk;
	}

	public String getCareer_contents() {
		return career_contents;
	}

	public void setCareer_contents(String career_contents) {
		this.career_contents = career_contents;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
}
