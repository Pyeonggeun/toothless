package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class LicenseDto {
	private int license_pk;
	private int resume_pk;
	private String lic_name;
	private int lic_gain_year;
	private int lic_gain_month;
	private String lic_center;
	private Date created_at;
	
	public LicenseDto() {
		super();
	}

	public LicenseDto(int license_pk, int resume_pk, String lic_name, int lic_gain_year, int lic_gain_month,
			String lic_center, Date created_at) {
		super();
		this.license_pk = license_pk;
		this.resume_pk = resume_pk;
		this.lic_name = lic_name;
		this.lic_gain_year = lic_gain_year;
		this.lic_gain_month = lic_gain_month;
		this.lic_center = lic_center;
		this.created_at = created_at;
	}

	public int getLicense_pk() {
		return license_pk;
	}

	public void setLicense_pk(int license_pk) {
		this.license_pk = license_pk;
	}

	public int getResume_pk() {
		return resume_pk;
	}

	public void setResume_pk(int resume_pk) {
		this.resume_pk = resume_pk;
	}

	public String getLic_name() {
		return lic_name;
	}

	public void setLic_name(String lic_name) {
		this.lic_name = lic_name;
	}

	public int getLic_gain_year() {
		return lic_gain_year;
	}

	public void setLic_gain_year(int lic_gain_year) {
		this.lic_gain_year = lic_gain_year;
	}

	public int getLic_gain_month() {
		return lic_gain_month;
	}

	public void setLic_gain_month(int lic_gain_month) {
		this.lic_gain_month = lic_gain_month;
	}

	public String getLic_center() {
		return lic_center;
	}

	public void setLic_center(String lic_center) {
		this.lic_center = lic_center;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
