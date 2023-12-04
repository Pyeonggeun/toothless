package com.mkfactory.toothless.a.dto;

public class executiveManagementDto {

	private int executive_management_pk;
	private int executive_pk;
	private int dorm_student_pk;
	
	public executiveManagementDto() {
		super();
	}
	
	public executiveManagementDto(int executive_management_pk, int executive_pk, int dorm_student_pk) {
		super();
		this.executive_management_pk = executive_management_pk;
		this.executive_pk = executive_pk;
		this.dorm_student_pk = dorm_student_pk;
	}

	public int getExecutive_management_pk() {
		return executive_management_pk;
	}

	public void setExecutive_management_pk(int executive_management_pk) {
		this.executive_management_pk = executive_management_pk;
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