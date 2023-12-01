package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class MedicineCodeDto {
	
	private int medicine_code_pk;
	private int medicine_cat_pk;
	private String name;
	private String company;
	private String efficacy;
	private String precaution;
	private Date created_at;
	
	public MedicineCodeDto() {
		super();
	}

	public MedicineCodeDto(int medicine_code_pk, int medicine_cat_pk, String name, String company, String efficacy,
			String precaution, Date created_at) {
		super();
		this.medicine_code_pk = medicine_code_pk;
		this.medicine_cat_pk = medicine_cat_pk;
		this.name = name;
		this.company = company;
		this.efficacy = efficacy;
		this.precaution = precaution;
		this.created_at = created_at;
	}

	public int getMedicine_code_pk() {
		return medicine_code_pk;
	}

	public void setMedicine_code_pk(int medicine_code_pk) {
		this.medicine_code_pk = medicine_code_pk;
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

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEfficacy() {
		return efficacy;
	}

	public void setEfficacy(String efficacy) {
		this.efficacy = efficacy;
	}

	public String getPrecaution() {
		return precaution;
	}

	public void setPrecaution(String precaution) {
		this.precaution = precaution;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
