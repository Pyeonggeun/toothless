package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffboardReplyDto {

	private int staffboard_reply_pk;
	private int staff_pk;
	private int staffboard_pk;
	private String content;
	private Date created_at;
	
	public StaffboardReplyDto() {
		super();
	}

	public StaffboardReplyDto(int staffboard_reply_pk, int staff_pk, int staffboard_pk, String content,
			Date created_at) {
		super();
		this.staffboard_reply_pk = staffboard_reply_pk;
		this.staff_pk = staff_pk;
		this.staffboard_pk = staffboard_pk;
		this.content = content;
		this.created_at = created_at;
	}

	public int getStaffboard_reply_pk() {
		return staffboard_reply_pk;
	}

	public void setStaffboard_reply_pk(int staffboard_reply_pk) {
		this.staffboard_reply_pk = staffboard_reply_pk;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
