package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class GraduationInfoDto {
	private int graduation_pk;
	private int student_pk;
	private Date graduated_at;
	private Date created_at;
	public GraduationInfoDto() {
		super();
	}
	public GraduationInfoDto(int graduation_pk, int student_pk, Date graduated_at, Date created_at) {
		super();
		this.graduation_pk = graduation_pk;
		this.student_pk = student_pk;
		this.graduated_at = graduated_at;
		this.created_at = created_at;
	}
	public int getGraduation_pk() {
		return graduation_pk;
	}
	public void setGraduation_pk(int graduation_pk) {
		this.graduation_pk = graduation_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	public Date getGraduated_at() {
		return graduated_at;
	}
	public void setGraduated_at(Date graduated_at) {
		this.graduated_at = graduated_at;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
