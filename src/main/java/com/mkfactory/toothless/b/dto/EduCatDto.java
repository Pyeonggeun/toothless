package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class EduCatDto {
	
	private int edu_cat_pk;
	private String name;
	private Date created_at;
	
	public EduCatDto() {
		super();
	}

	public EduCatDto(int edu_cat_pk, String name, Date created_at) {
		super();
		this.edu_cat_pk = edu_cat_pk;
		this.name = name;
		this.created_at = created_at;
	}

	public int getEdu_cat_pk() {
		return edu_cat_pk;
	}

	public void setEdu_cat_pk(int edu_cat_pk) {
		this.edu_cat_pk = edu_cat_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
