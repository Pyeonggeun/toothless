package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StudentboardLikeDto {
	
	private int studentboard_like_pk;
	private int student_pk;
	private int studentboard_pk;
	private Date created_at;
	
	public StudentboardLikeDto() {
		super();
	}

	public StudentboardLikeDto(int studentboard_like_pk, int student_pk, int studentboard_pk, Date created_at) {
		super();
		this.studentboard_like_pk = studentboard_like_pk;
		this.student_pk = student_pk;
		this.studentboard_pk = studentboard_pk;
		this.created_at = created_at;
	}

	public int getStudentboard_like_pk() {
		return studentboard_like_pk;
	}

	public void setStudentboard_like_pk(int studentboard_like_pk) {
		this.studentboard_like_pk = studentboard_like_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getStudentboard_pk() {
		return studentboard_pk;
	}

	public void setStudentboard_pk(int studentboard_pk) {
		this.studentboard_pk = studentboard_pk;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
