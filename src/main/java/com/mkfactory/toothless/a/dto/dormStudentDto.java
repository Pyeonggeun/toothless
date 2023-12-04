package com.mkfactory.toothless.a.dto;

public class dormStudentDto {
	public int dorm_student_pk;
	public int semester_pk;
	public int student_pk;
	public int dorm_room_pk;
	public dormStudentDto() {
		super();
	}
	public dormStudentDto(int dorm_student_pk, int semester_pk, int student_pk, int dorm_room_pk) {
		super();
		this.dorm_student_pk = dorm_student_pk;
		this.semester_pk = semester_pk;
		this.student_pk = student_pk;
		this.dorm_room_pk = dorm_room_pk;
	}
	public int getDorm_student_pk() {
		return dorm_student_pk;
	}
	public void setDorm_student_pk(int dorm_student_pk) {
		this.dorm_student_pk = dorm_student_pk;
	}
	public int getSemester_pk() {
		return semester_pk;
	}
	public void setSemester_pk(int semester_pk) {
		this.semester_pk = semester_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	public int getDorm_room_pk() {
		return dorm_room_pk;
	}
	public void setDorm_room_pk(int dorm_room_pk) {
		this.dorm_room_pk = dorm_room_pk;
	}
	
}
