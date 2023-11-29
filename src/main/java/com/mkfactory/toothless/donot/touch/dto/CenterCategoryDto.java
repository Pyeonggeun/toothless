package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class CenterCategoryDto {
	private int center_pk;
	private String position;
	private Date created_at;
	public CenterCategoryDto() {
		super();
	}
	public CenterCategoryDto(int center_pk, String position, Date created_at) {
		super();
		this.center_pk = center_pk;
		this.position = position;
		this.created_at = created_at;
	}
	public int getCenter_pk() {
		return center_pk;
	}
	public void setCenter_pk(int center_pk) {
		this.center_pk = center_pk;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
