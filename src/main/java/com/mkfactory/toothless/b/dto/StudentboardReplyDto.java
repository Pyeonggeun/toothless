package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StudentboardReplyDto {
	
	private int studentboard_reply_pk;
	private int staff_pk;
	private int student_pk;
	private int studentboard_pk;
	private String content;
	private Date created_at;
	
	public StudentboardReplyDto() {
		super();
	}

	public StudentboardReplyDto(int studentboard_reply_pk, int staff_pk, int student_pk, int studentboard_pk,
			String content, Date created_at) {
		super();
		this.studentboard_reply_pk = studentboard_reply_pk;
		this.staff_pk = staff_pk;
		this.student_pk = student_pk;
		this.studentboard_pk = studentboard_pk;
		this.content = content;
		this.created_at = created_at;
	}

	public int getStudentboard_reply_pk() {
		return studentboard_reply_pk;
	}

	public void setStudentboard_reply_pk(int studentboard_reply_pk) {
		this.studentboard_reply_pk = studentboard_reply_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
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
