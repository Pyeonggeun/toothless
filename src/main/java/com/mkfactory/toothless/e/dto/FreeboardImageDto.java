package com.mkfactory.toothless.e.dto;

public class FreeboardImageDto {
	
	private int id;
	private int freeboard_id;
	private String freeboard_image_link;
	
	public FreeboardImageDto() {
		super();
	}

	public FreeboardImageDto(int id, int freeboard_id, String freeboard_image_link) {
		super();
		this.id = id;
		this.freeboard_id = freeboard_id;
		this.freeboard_image_link = freeboard_image_link;
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

	public String getFreeboard_image_link() {
		return freeboard_image_link;
	}

	public void setFreeboard_image_link(String freeboard_image_link) {
		this.freeboard_image_link = freeboard_image_link;
	}
	
	
	
	

}
