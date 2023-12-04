package com.mkfactory.toothless.a.dto;

public class pointCategory {

	private int point_category_pk;
	private String content;
	private int point;
	
	
	public pointCategory() {}


	public pointCategory(int point_category_pk, String content, int point) {
	
		this.point_category_pk = point_category_pk;
		this.content = content;
		this.point = point;
	}


	public int getPoint_category_pk() {
		return point_category_pk;
	}


	public void setPoint_category_pk(int point_category_pk) {
		this.point_category_pk = point_category_pk;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
	
	
	
}
