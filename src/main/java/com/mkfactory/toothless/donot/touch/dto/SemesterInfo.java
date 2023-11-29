package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class SemesterInfo {
	private int semester_pk;
	private int semester_year;
	private int semester;
	private Date created_at;
	public SemesterInfo() {
		super();
	}
	public SemesterInfo(int semester_pk, int semester_year, int semester, Date created_at) {
		super();
		this.semester_pk = semester_pk;
		this.semester_year = semester_year;
		this.semester = semester;
		this.created_at = created_at;
	}
	public int getSemester_pk() {
		return semester_pk;
	}
	public void setSemester_pk(int semester_pk) {
		this.semester_pk = semester_pk;
	}
	public int getSemester_year() {
		return semester_year;
	}
	public void setSemester_year(int semester_year) {
		this.semester_year = semester_year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
