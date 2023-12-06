package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class GroupCounselReservationDto {
	
	private int id;
	private int student_pk;
	private int group_counsel_id;
	private String isAttend;
	private Date created_at;
	
	public GroupCounselReservationDto() {
		super();
	}

	public GroupCounselReservationDto(int id, int student_pk, int group_counsel_id, String isAttend, Date created_at) {
		super();
		this.id = id;
		this.student_pk = student_pk;
		this.group_counsel_id = group_counsel_id;
		this.isAttend = isAttend;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getGroup_counsel_id() {
		return group_counsel_id;
	}

	public void setGroup_counsel_id(int group_counsel_id) {
		this.group_counsel_id = group_counsel_id;
	}

	public String getIsAttend() {
		return isAttend;
	}

	public void setIsAttend(String isAttend) {
		this.isAttend = isAttend;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
}


