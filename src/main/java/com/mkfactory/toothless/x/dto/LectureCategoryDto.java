package com.mkfactory.toothless.x.dto;

public class LectureCategoryDto {
	
	private int lecture_category_key;
	private String category_name;
	
	public LectureCategoryDto() {}

	public LectureCategoryDto(int lecture_category_key, String category_name) {
	
		this.lecture_category_key = lecture_category_key;
		this.category_name = category_name;
	}

	public int getLecture_category_key() {
		return lecture_category_key;
	}

	public void setLecture_category_key(int lecture_category_key) {
		this.lecture_category_key = lecture_category_key;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	
	
	
	
	

}
