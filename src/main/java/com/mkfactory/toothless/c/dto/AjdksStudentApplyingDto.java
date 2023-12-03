package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksStudentApplyingDto {
	
	public int student_applying_pk;
	public int internship_course_pk;
	public int student_pk;
	public String status;
	public Date created_at;
	
	public AjdksStudentApplyingDto() {
		super();
	}

	public AjdksStudentApplyingDto(int student_applying_pk, int internship_course_pk, int student_pk, String status,
			Date created_at) {
		super();
		this.student_applying_pk = student_applying_pk;
		this.internship_course_pk = internship_course_pk;
		this.student_pk = student_pk;
		this.status = status;
		this.created_at = created_at;
	}

	public int getStudent_applying_pk() {
		return student_applying_pk;
	}

	public void setStudent_applying_pk(int student_applying_pk) {
		this.student_applying_pk = student_applying_pk;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
