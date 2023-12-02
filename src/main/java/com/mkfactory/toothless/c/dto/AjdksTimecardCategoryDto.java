package com.mkfactory.toothless.c.dto;

public class AjdksTimecardCategoryDto {
	
	public int timecard_category_pk;
	public String timecard_category_name;
	
	public AjdksTimecardCategoryDto() {
		super();
	}

	public AjdksTimecardCategoryDto(int timecard_category_pk, String timecard_category_name) {
		super();
		this.timecard_category_pk = timecard_category_pk;
		this.timecard_category_name = timecard_category_name;
	}

	public int getTimecard_category_pk() {
		return timecard_category_pk;
	}

	public void setTimecard_category_pk(int timecard_category_pk) {
		this.timecard_category_pk = timecard_category_pk;
	}

	public String getTimecard_category_name() {
		return timecard_category_name;
	}

	public void setTimecard_category_name(String timecard_category_name) {
		this.timecard_category_name = timecard_category_name;
	}
	
}
