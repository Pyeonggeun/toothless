package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffboardLikeDto {
	
	private int staffboard_like_pk;
	private int staff_pk;
	private int staffeboard_pk;
	private Date created_at;
	
	public StaffboardLikeDto() {
		super();
	}

	public StaffboardLikeDto(int staffboard_like_pk, int staff_pk, int staffeboard_pk, Date created_at) {
		super();
		this.staffboard_like_pk = staffboard_like_pk;
		this.staff_pk = staff_pk;
		this.staffeboard_pk = staffeboard_pk;
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

	public int getStaffeboard_pk() {
		return staffeboard_pk;
	}

	public void setStaffeboard_pk(int staffeboard_pk) {
		this.staffeboard_pk = staffeboard_pk;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
