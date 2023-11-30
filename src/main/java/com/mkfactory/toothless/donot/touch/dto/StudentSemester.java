package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class StudentSemester {
	private int student_semester_pk;
	private int student_pk;
	private double total_score;
	private Date created_at;
	public StudentSemester() {
		super();
	}
	public StudentSemester(int student_semester_pk, int student_pk, double total_score, Date created_at) {
		super();
		this.student_semester_pk = student_semester_pk;
		this.student_pk = student_pk;
		this.total_score = total_score;
		this.created_at = created_at;
	}
	public int getStudent_semester_pk() {
		return student_semester_pk;
	}
	public void setStudent_semester_pk(int student_semester_pk) {
		this.student_semester_pk = student_semester_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	public double getTotal_score() {
		return total_score;
	}
	public void setTotal_score(double total_score) {
		this.total_score = total_score;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
