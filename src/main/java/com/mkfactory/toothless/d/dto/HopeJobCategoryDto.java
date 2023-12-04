package com.mkfactory.toothless.d.dto;

public class HopeJobCategoryDto {
	
	public int hope_job_category_pk;
	public int hope_job_pk;
	public int job_field_category_pk;
	
	
	public HopeJobCategoryDto() {
		super();
	}


	public HopeJobCategoryDto(int hope_job_category_pk, int hope_job_pk, int job_field_category_pk) {
		super();
		this.hope_job_category_pk = hope_job_category_pk;
		this.hope_job_pk = hope_job_pk;
		this.job_field_category_pk = job_field_category_pk;
	}


	public int getHope_job_category_pk() {
		return hope_job_category_pk;
	}


	public void setHope_job_category_pk(int hope_job_category_pk) {
		this.hope_job_category_pk = hope_job_category_pk;
	}


	public int getHope_job_pk() {
		return hope_job_pk;
	}


	public void setHope_job_pk(int hope_job_pk) {
		this.hope_job_pk = hope_job_pk;
	}


	public int getJob_field_category_pk() {
		return job_field_category_pk;
	}


	public void setJob_field_category_pk(int job_field_category_pk) {
		this.job_field_category_pk = job_field_category_pk;
	}
	
	
}
