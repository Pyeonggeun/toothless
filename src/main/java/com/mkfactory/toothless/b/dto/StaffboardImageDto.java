package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffboardImageDto {
	
	private int staffboard_image_pk;
	private int staffboard_pk;
	private String img_link;
	private String original_link;
	private Date created_at;
	
	public StaffboardImageDto() {
		super();
	}

	public StaffboardImageDto(int staffboard_image_pk, int staffboard_pk, String img_link, String original_link,
			Date created_at) {
		super();
		this.staffboard_image_pk = staffboard_image_pk;
		this.staffboard_pk = staffboard_pk;
		this.img_link = img_link;
		this.original_link = original_link;
		this.created_at = created_at;
	}

	public int getStaffboard_image_pk() {
		return staffboard_image_pk;
	}

	public void setStaffboard_image_pk(int staffboard_image_pk) {
		this.staffboard_image_pk = staffboard_image_pk;
	}

	public int getStaffboard_pk() {
		return staffboard_pk;
	}

	public void setStaffboard_pk(int staffboard_pk) {
		this.staffboard_pk = staffboard_pk;
	}

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}

	public String getOriginal_link() {
		return original_link;
	}

	public void setOriginal_link(String original_link) {
		this.original_link = original_link;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
