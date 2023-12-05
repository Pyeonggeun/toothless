package com.mkfactory.toothless.e.dto;

public class LicenseImageDto {

	private int id;
	private int counselor_id;
	private String license;
	
	public LicenseImageDto() {
		super();
	}

	public LicenseImageDto(int id, int counselor_id, String license) {
		super();
		this.id = id;
		this.counselor_id = counselor_id;
		this.license = license;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCounselor_id() {
		return counselor_id;
	}

	public void setCounselor_id(int counselor_id) {
		this.counselor_id = counselor_id;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}
	
	
	
}
