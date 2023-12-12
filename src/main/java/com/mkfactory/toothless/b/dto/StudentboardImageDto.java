package com.mkfactory.toothless.b.dto;

public class StudentboardImageDto {
	
	private int studentboard_image_pk;
	private int studentboard_pk;
	private String img_link;
	
	public StudentboardImageDto() {
		super();
	}

	public StudentboardImageDto(int studentboard_image_pk, int studentboard_pk, String img_link) {
		super();
		this.studentboard_image_pk = studentboard_image_pk;
		this.studentboard_pk = studentboard_pk;
		this.img_link = img_link;
	}

	public int getStudentboard_image_pk() {
		return studentboard_image_pk;
	}

	public void setStudentboard_image_pk(int studentboard_image_pk) {
		this.studentboard_image_pk = studentboard_image_pk;
	}

	public int getStudentboard_pk() {
		return studentboard_pk;
	}

	public void setStudentboard_pk(int studentboard_pk) {
		this.studentboard_pk = studentboard_pk;
	}

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}
}
