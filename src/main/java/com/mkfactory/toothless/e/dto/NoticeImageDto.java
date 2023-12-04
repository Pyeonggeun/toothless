package com.mkfactory.toothless.e.dto;

public class NoticeImageDto {
	
	private int id;
	private int notice_id;
	private String notice_image_link;
	
	public NoticeImageDto() {
		super();
	}

	public NoticeImageDto(int id, int notice_id, String notice_image_link) {
		super();
		this.id = id;
		this.notice_id = notice_id;
		this.notice_image_link = notice_image_link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_image_link() {
		return notice_image_link;
	}

	public void setNotice_image_link(String notice_image_link) {
		this.notice_image_link = notice_image_link;
	}

}
