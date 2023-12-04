package com.mkfactory.toothless.a.dto;

import java.util.Date;


public class PointDto {

	private int dorm_point_pk;
	private int dorm_student_pk;
	private int staff_pk;
	private int point_category_pk;
	private String reason;
	private Date created_at;
	
	
	public PointDto() {}


	public PointDto(int dorm_point_pk, int dorm_student_pk, int staff_pk, int point_category_pk, String reason,
			Date created_at) {
		
		this.dorm_point_pk = dorm_point_pk;
		this.dorm_student_pk = dorm_student_pk;
		this.staff_pk = staff_pk;
		this.point_category_pk = point_category_pk;
		this.reason = reason;
		this.created_at = created_at;
	}


	public int getDorm_point_pk() {
		return dorm_point_pk;
	}


	public void setDorm_point_pk(int dorm_point_pk) {
		this.dorm_point_pk = dorm_point_pk;
	}


	public int getDorm_student_pk() {
		return dorm_student_pk;
	}


	public void setDorm_student_pk(int dorm_student_pk) {
		this.dorm_student_pk = dorm_student_pk;
	}


	public int getStaff_pk() {
		return staff_pk;
	}


	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}


	public int getPoint_category_pk() {
		return point_category_pk;
	}


	public void setPoint_category_pk(int point_category_pk) {
		this.point_category_pk = point_category_pk;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
	
	
}
