package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class MedicineCatDto {
	
	private int	medicine_cat_pk;
	private String name;
	private Date created_at;
	
	public MedicineCatDto() {
		super();
	}

	public MedicineCatDto(int medicine_cat_pk, String name, Date created_at) {
		super();
		this.medicine_cat_pk = medicine_cat_pk;
		this.name = name;
		this.created_at = created_at;
	}

	public int getMedicine_cat_pk() {
		return medicine_cat_pk;
	}

	public void setMedicine_cat_pk(int medicine_cat_pk) {
		this.medicine_cat_pk = medicine_cat_pk;
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
