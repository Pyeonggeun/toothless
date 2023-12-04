package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class CompanyManagerDto {

	private int com_manager_pk;
	private int external_pk;
	private String com_manager_name;
	private String com_manager_email;
	private String com_manager_department;
	private String com_manager_position;
	private String com_direct_number;
	private String com_manager_phone;
	private Date created_at;
	
	
	public CompanyManagerDto() {
		super();
	}
	
	
	public CompanyManagerDto(int com_manager_pk, int external_pk, String com_manager_name, String com_manager_email,
			String com_manager_department, String com_manager_position, String com_direct_number,
			String com_manager_phone, Date created_at) {
		super();
		this.com_manager_pk = com_manager_pk;
		this.external_pk = external_pk;
		this.com_manager_name = com_manager_name;
		this.com_manager_email = com_manager_email;
		this.com_manager_department = com_manager_department;
		this.com_manager_position = com_manager_position;
		this.com_direct_number = com_direct_number;
		this.com_manager_phone = com_manager_phone;
		this.created_at = created_at;
	}
	
	public int getCom_manager_pk() {
		return com_manager_pk;
	}
	public void setCom_manager_pk(int com_manager_pk) {
		this.com_manager_pk = com_manager_pk;
	}
	public int getExternal_pk() {
		return external_pk;
	}
	public void setExternal_pk(int external_pk) {
		this.external_pk = external_pk;
	}
	public String getCom_manager_name() {
		return com_manager_name;
	}
	public void setCom_manager_name(String com_manager_name) {
		this.com_manager_name = com_manager_name;
	}
	public String getCom_manager_email() {
		return com_manager_email;
	}
	public void setCom_manager_email(String com_manager_email) {
		this.com_manager_email = com_manager_email;
	}
	public String getCom_manager_department() {
		return com_manager_department;
	}
	public void setCom_manager_department(String com_manager_department) {
		this.com_manager_department = com_manager_department;
	}
	public String getCom_manager_position() {
		return com_manager_position;
	}
	public void setCom_manager_position(String com_manager_position) {
		this.com_manager_position = com_manager_position;
	}
	public String getCom_direct_number() {
		return com_direct_number;
	}
	public void setCom_direct_number(String com_direct_number) {
		this.com_direct_number = com_direct_number;
	}
	public String getCom_manager_phone() {
		return com_manager_phone;
	}
	public void setCom_manager_phone(String com_manager_phone) {
		this.com_manager_phone = com_manager_phone;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
