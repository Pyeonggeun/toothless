package com.mkfactory.toothless.d.dto;

public class ComScaleCategoryDto {

	private int com_scale_category_pk;
	private String com_scale_category_name;
	
	
	public ComScaleCategoryDto() {
		super();
	}
	
	public ComScaleCategoryDto(int com_scale_category_pk, String com_scale_category_name) {
		super();
		this.com_scale_category_pk = com_scale_category_pk;
		this.com_scale_category_name = com_scale_category_name;
	}
	
	
	public int getCom_scale_category_pk() {
		return com_scale_category_pk;
	}
	
	public void setCom_scale_category_pk(int com_scale_category_pk) {
		this.com_scale_category_pk = com_scale_category_pk;
	}
	
	public String getCom_scale_category_name() {
		return com_scale_category_name;
	}
	
	public void setCom_scale_category_name(String com_scale_category_name) {
		this.com_scale_category_name = com_scale_category_name;
	}
	
	
	
}
