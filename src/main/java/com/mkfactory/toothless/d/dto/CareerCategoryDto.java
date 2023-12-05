package com.mkfactory.toothless.d.dto;

public class CareerCategoryDto {
	private int career_category_pk;
	private String career_category_name;
	
	public CareerCategoryDto() {
		super();
	}

	public CareerCategoryDto(int career_category_pk, String career_category_name) {
		super();
		this.career_category_pk = career_category_pk;
		this.career_category_name = career_category_name;
	}

	public int getCareer_category_pk() {
		return career_category_pk;
	}

	public void setCareer_category_pk(int career_category_pk) {
		this.career_category_pk = career_category_pk;
	}

	public String getCareer_category_name() {
		return career_category_name;
	}

	public void setCareer_category_name(String career_category_name) {
		this.career_category_name = career_category_name;
	}
	
	
}
