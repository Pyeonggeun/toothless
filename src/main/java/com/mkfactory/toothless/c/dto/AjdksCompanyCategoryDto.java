package com.mkfactory.toothless.c.dto;

public class AjdksCompanyCategoryDto {
	
	private int company_category_pk;
	private String company_category_name;
	
	public AjdksCompanyCategoryDto() {
		super();
	}

	public AjdksCompanyCategoryDto(int company_category_pk, String company_category_name) {
		super();
		this.company_category_pk = company_category_pk;
		this.company_category_name = company_category_name;
	}

	public int getCompany_category_pk() {
		return company_category_pk;
	}

	public void setCompany_category_pk(int company_category_pk) {
		this.company_category_pk = company_category_pk;
	}

	public String getCompany_category_name() {
		return company_category_name;
	}

	public void setCompany_category_name(String company_category_name) {
		this.company_category_name = company_category_name;
	}
	
}
