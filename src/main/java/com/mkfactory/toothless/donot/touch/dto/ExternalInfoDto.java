package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class ExternalInfoDto {
	private int external_pk;
	private String external_id;
	private String password;
	private int external_category;
	private Date created_at;
	public ExternalInfoDto() {
		super();
	}
	public ExternalInfoDto(int external_pk, String external_id, String password, int external_category,
			Date created_at) {
		super();
		this.external_pk = external_pk;
		this.external_id = external_id;
		this.password = password;
		this.external_category = external_category;
		this.created_at = created_at;
	}
	public int getExternal_pk() {
		return external_pk;
	}
	public void setExternal_pk(int external_pk) {
		this.external_pk = external_pk;
	}
	public String getExternal_id() {
		return external_id;
	}
	public void setExternal_id(String external_id) {
		this.external_id = external_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getExternal_category() {
		return external_category;
	}
	public void setExternal_category(int external_category) {
		this.external_category = external_category;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
