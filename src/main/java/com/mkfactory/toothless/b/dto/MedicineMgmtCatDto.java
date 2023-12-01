package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class MedicineMgmtCatDto {

	private int medicine_mgmt_cat_pk;
	private String name;
	private Date created_at;
	
	public MedicineMgmtCatDto() {
		super();
	}

	public MedicineMgmtCatDto(int medicine_mgmt_cat_pk, String name, Date created_at) {
		super();
		this.medicine_mgmt_cat_pk = medicine_mgmt_cat_pk;
		this.name = name;
		this.created_at = created_at;
	}

	public int getMedicine_mgmt_cat_pk() {
		return medicine_mgmt_cat_pk;
	}

	public void setMedicine_mgmt_cat_pk(int medicine_mgmt_cat_pk) {
		this.medicine_mgmt_cat_pk = medicine_mgmt_cat_pk;
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
