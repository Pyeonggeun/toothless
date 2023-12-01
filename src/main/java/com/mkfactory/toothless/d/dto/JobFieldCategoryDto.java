package com.mkfactory.toothless.d.dto;

public class JobFieldCategoryDto {
	
	public int job_field_category_pk;
	public String job_field_category_name;
	
	
	public JobFieldCategoryDto() {
		super();
	}


	public JobFieldCategoryDto(int job_field_category_pk, String job_field_category_name) {
		super();
		this.job_field_category_pk = job_field_category_pk;
		this.job_field_category_name = job_field_category_name;
	}


	public int getJob_field_category_pk() {
		return job_field_category_pk;
	}


	public void setJob_field_category_pk(int job_field_category_pk) {
		this.job_field_category_pk = job_field_category_pk;
	}


	public String getJob_field_category_name() {
		return job_field_category_name;
	}


	public void setJob_field_category_name(String job_field_category_name) {
		this.job_field_category_name = job_field_category_name;
	}
	
	
}
