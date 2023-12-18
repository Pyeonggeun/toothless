package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class NoticeStaffBoardDto {
	
	private int notice_board_pk;
	private int staff_pk;
	private String notice_title;
	private String notice_contents;
	private Date created_at;
	
	public NoticeStaffBoardDto() {
		super();
	}

	public NoticeStaffBoardDto(int notice_board_pk, int staff_pk, String notice_title, String notice_contents,
			Date created_at) {
		super();
		this.notice_board_pk = notice_board_pk;
		this.staff_pk = staff_pk;
		this.notice_title = notice_title;
		this.notice_contents = notice_contents;
		this.created_at = created_at;
	}

	public int getNotice_board_pk() {
		return notice_board_pk;
	}

	public void setNotice_board_pk(int notice_board_pk) {
		this.notice_board_pk = notice_board_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	

}
