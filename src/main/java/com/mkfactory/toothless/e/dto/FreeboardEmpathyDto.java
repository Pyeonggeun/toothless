package com.mkfactory.toothless.e.dto;

public class FreeboardEmpathyDto {
	
	private int id;
	private int freeboard_id;
	private int student_pk;
	
	public FreeboardEmpathyDto() {
		super();
	}

	public FreeboardEmpathyDto(int id, int freeboard_id, int student_pk) {
		super();
		this.id = id;
		this.freeboard_id = freeboard_id;
		this.student_pk = student_pk;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFreeboard_id() {
		return freeboard_id;
	}

	public void setFreeboard_id(int freeboard_id) {
		this.freeboard_id = freeboard_id;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	

}
