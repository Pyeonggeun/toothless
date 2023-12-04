package com.mkfactory.toothless.a.dto;

public class executiveDto {

	private int executive_pk;
	private int dorm_student_pk;
	
	public executiveDto() {
		super();
	}
	
	public executiveDto(int executive_pk, int dorm_student_pk) {
		super();
		this.executive_pk = executive_pk;
		this.dorm_student_pk = dorm_student_pk;
	}
	
	public int getExecutive_pk() {
		return executive_pk;
	}
	
	public void setExecutive_pk(int executive_pk) {
		this.executive_pk = executive_pk;
	}
	
	public int getDorm_student_pk() {
		return dorm_student_pk;
	}
	
	public void setDorm_student_pk(int dorm_student_pk) {
		this.dorm_student_pk = dorm_student_pk;
	}
	
}
