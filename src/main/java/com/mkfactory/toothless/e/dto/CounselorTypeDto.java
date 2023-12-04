package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class CounselorTypeDto {

	private int id;
	private int counselor_id;
	private int type_category_id;
	private Date created_at;
	
	public CounselorTypeDto() {
		super();
	}

	public CounselorTypeDto(int id, int counselor_id, int type_category_id, Date created_at) {
		super();
		this.id = id;
		this.counselor_id = counselor_id;
		this.type_category_id = type_category_id;
		this.created_at = created_at;
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

	public int getType_category_id() {
		return type_category_id;
	}

	public void setType_category_id(int type_category_id) {
		this.type_category_id = type_category_id;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
