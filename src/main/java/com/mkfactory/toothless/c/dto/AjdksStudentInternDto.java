package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksStudentInternDto {
	
	private int student_intern_pk;
	private int internship_course_pk;
	private int student_pk;
	private Date created_at;
	
	public AjdksStudentInternDto() {
		super();
	}

	public AjdksStudentInternDto(int student_intern_pk, int internship_course_pk, int student_pk, Date created_at) {
		super();
		this.student_intern_pk = student_intern_pk;
		this.internship_course_pk = internship_course_pk;
		this.student_pk = student_pk;
		this.created_at = created_at;
	}

	public int getStudent_intern_pk() {
		return student_intern_pk;
	}

	public void setStudent_intern_pk(int student_intern_pk) {
		this.student_intern_pk = student_intern_pk;
	}

	public int getInternship_course_pk() {
		return internship_course_pk;
	}

	public void setInternship_course_pk(int internship_course_pk) {
		this.internship_course_pk = internship_course_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
