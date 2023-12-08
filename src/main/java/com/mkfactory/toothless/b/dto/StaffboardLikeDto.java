package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffboardLikeDto {
	
	private int staffboard_like_pk;
	private int staff_pk;
	private int staffboard_pk;
	private Date created_at;
	
	public StaffboardLikeDto() {
		super();
	}

	public StaffboardLikeDto(int staffboard_like_pk, int staff_pk, int staffboard_pk, Date created_at) {
		super();
		this.staffboard_like_pk = staffboard_like_pk;
		this.staff_pk = staff_pk;
		this.staffboard_pk = staffboard_pk;
		this.created_at = created_at;
	}

	public int getStaffboard_like_pk() {
		return staffboard_like_pk;
	}

	public void setStaffboard_like_pk(int staffboard_like_pk) {
		this.staffboard_like_pk = staffboard_like_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}
	
	public int getStaffboard_pk() {
		return staffboard_pk;
	}

	public void setStaffboard_pk(int staffboard_pk) {
		this.staffboard_pk = staffboard_pk;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
