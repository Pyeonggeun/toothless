package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class DepartmentCategoryDto {
	private int department_pk;
	private String name;
	private Date created_at;
	public DepartmentCategoryDto() {
		super();
	}
	public DepartmentCategoryDto(int department_pk, String name, Date created_at) {
		super();
		this.department_pk = department_pk;
		this.name = name;
		this.created_at = created_at;
	}
	public int getDepartment_pk() {
		return department_pk;
	}
	public void setDepartment_pk(int department_pk) {
		this.department_pk = department_pk;
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
