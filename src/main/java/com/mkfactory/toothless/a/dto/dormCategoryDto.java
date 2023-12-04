package com.mkfactory.toothless.a.dto;

public class dormCategoryDto {
	private int dorm_amount_pk;
	private int dorm_amount;
	private String dorm_imgs;
	
	
	public dormCategoryDto() {
		super();
	}


	public dormCategoryDto(int dorm_amount_pk, int dorm_amount, String dorm_imgs) {
		super();
		this.dorm_amount_pk = dorm_amount_pk;
		this.dorm_amount = dorm_amount;
		this.dorm_imgs = dorm_imgs;
	}


	public int getDorm_amount_pk() {
		return dorm_amount_pk;
	}


	public void setDorm_amount_pk(int dorm_amount_pk) {
		this.dorm_amount_pk = dorm_amount_pk;
	}


	public int getDorm_amount() {
		return dorm_amount;
	}


	public void setDorm_amount(int dorm_amount) {
		this.dorm_amount = dorm_amount;
	}


	public String getDorm_imgs() {
		return dorm_imgs;
	}


	public void setDorm_imgs(String dorm_imgs) {
		this.dorm_imgs = dorm_imgs;
	}
	
	
}
