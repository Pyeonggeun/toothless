package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class LectureStudentDto {
	private int lecture_student_key;
	private int open_lecture_key;
	private int life_student_key;
	private Date created_at;
	public LectureStudentDto() {
		super();
	}
	public LectureStudentDto(int lecture_student_key, int open_lecture_key, int life_student_key, Date created_at) {
		super();
		this.lecture_student_key = lecture_student_key;
		this.open_lecture_key = open_lecture_key;
		this.life_student_key = life_student_key;
		this.created_at = created_at;
	}
	public int getLecture_student_key() {
		return lecture_student_key;
	}
	public void setLecture_student_key(int lecture_student_key) {
		this.lecture_student_key = lecture_student_key;
	}
	public int getOpen_lecture_key() {
		return open_lecture_key;
	}
	public void setOpen_lecture_key(int open_lecture_key) {
		this.open_lecture_key = open_lecture_key;
	}
	public int getLife_student_key() {
		return life_student_key;
	}
	public void setLife_student_key(int life_student_key) {
		this.life_student_key = life_student_key;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
