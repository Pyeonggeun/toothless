package com.mkfactory.toothless.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ExitDto {
	
	private int exit_pk;
	private int dorm_student_pk;
	private String reason;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date exit_date;
	private Date apply_create_at;
	
	
	
	public ExitDto() {}

	public ExitDto(int exit_pk, int dorm_student_pk, String reason, Date exit_date, Date apply_create_at) {
	
		this.exit_pk = exit_pk;
		this.dorm_student_pk = dorm_student_pk;
		this.reason = reason;
		this.exit_date = exit_date;
		this.apply_create_at = apply_create_at;
	}

	public int getExit_pk() {
		return exit_pk;
	}

	public void setExit_pk(int exit_pk) {
		this.exit_pk = exit_pk;
	}

	public int getDorm_student_pk() {
		return dorm_student_pk;
	}

	public void setDorm_student_pk(int dorm_student_pk) {
		this.dorm_student_pk = dorm_student_pk;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getExit_date() {
		return exit_date;
	}

	public void setExit_date(Date exit_date) {
		this.exit_date = exit_date;
	}

	public Date getApply_create_at() {
		return apply_create_at;
	}

	public void setApply_create_at(Date apply_create_at) {
		this.apply_create_at = apply_create_at;
	}
	
	
	
	
	
	
	

}
