package com.mkfactory.toothless.c.dto;

public class AjdksCompanyInfoDto {
	
	private int company_pk;
	private int company_category_pk;
	private int staff_pk;
	private int external_pk;
	private String company_id;
	private String company_name;
	private String ceo_name;
	private String address;
	private String phone;
	private String url;
	
	public AjdksCompanyInfoDto() {
		super();
	}

	public AjdksCompanyInfoDto(int company_pk, int company_category_pk, int staff_pk, int external_pk,
			String company_id, String company_name, String ceo_name, String address, String phone, String url) {
		super();
		this.company_pk = company_pk;
		this.company_category_pk = company_category_pk;
		this.staff_pk = staff_pk;
		this.external_pk = external_pk;
		this.company_id = company_id;
		this.company_name = company_name;
		this.ceo_name = ceo_name;
		this.address = address;
		this.phone = phone;
		this.url = url;
	}

	public int getCompany_pk() {
		return company_pk;
	}

	public void setCompany_pk(int company_pk) {
		this.company_pk = company_pk;
	}

	public int getCompany_category_pk() {
		return company_category_pk;
	}

	public void setCompany_category_pk(int company_category_pk) {
		this.company_category_pk = company_category_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public int getExternal_pk() {
		return external_pk;
	}

	public void setExternal_pk(int external_pk) {
		this.external_pk = external_pk;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCeo_name() {
		return ceo_name;
	}

	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
