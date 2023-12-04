package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class CompanyDto {
	
	private int com_pk;
	private int com_manager_pk;
	private int com_scale_category_pk;
	private String business_number;
	private String com_name;
	private String com_bossname;
	private String com_address;
	private String is_family_company;
	private Date created_at;
	
	public CompanyDto() {
		super();
	}

	public CompanyDto(int com_pk, int com_manager_pk, int com_scale_category_pk, String business_number,
			String com_name, String com_bossname, String com_address, String is_family_company, Date created_at) {
		super();
		this.com_pk = com_pk;
		this.com_manager_pk = com_manager_pk;
		this.com_scale_category_pk = com_scale_category_pk;
		this.business_number = business_number;
		this.com_name = com_name;
		this.com_bossname = com_bossname;
		this.com_address = com_address;
		this.is_family_company = is_family_company;
		this.created_at = created_at;
	}

	public int getCom_pk() {
		return com_pk;
	}

	public void setCom_pk(int com_pk) {
		this.com_pk = com_pk;
	}

	public int getCom_manager_pk() {
		return com_manager_pk;
	}

	public void setCom_manager_pk(int com_manager_pk) {
		this.com_manager_pk = com_manager_pk;
	}

	public int getCom_scale_category_pk() {
		return com_scale_category_pk;
	}

	public void setCom_scale_category_pk(int com_scale_category_pk) {
		this.com_scale_category_pk = com_scale_category_pk;
	}

	public String getBusiness_number() {
		return business_number;
	}

	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getCom_bossname() {
		return com_bossname;
	}

	public void setCom_bossname(String com_bossname) {
		this.com_bossname = com_bossname;
	}

	public String getCom_address() {
		return com_address;
	}

	public void setCom_address(String com_address) {
		this.com_address = com_address;
	}

	public String getIs_family_company() {
		return is_family_company;
	}

	public void setIs_family_company(String is_family_company) {
		this.is_family_company = is_family_company;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	
	
}
