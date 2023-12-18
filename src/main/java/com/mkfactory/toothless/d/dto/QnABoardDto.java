package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class QnABoardDto {
	
	private int board_pk;
	private int staff_pk;
	private String board_title;
	private String board_contents;
	private String board_answer;
	private Date created_at;
	
	public QnABoardDto() {
		super();
	}

	public QnABoardDto(int board_pk, int staff_pk, String board_title, String board_contents, String board_answer,
			Date created_at) {
		super();
		this.board_pk = board_pk;
		this.staff_pk = staff_pk;
		this.board_title = board_title;
		this.board_contents = board_contents;
		this.board_answer = board_answer;
		this.created_at = created_at;
	}

	public int getBoard_pk() {
		return board_pk;
	}

	public void setBoard_pk(int board_pk) {
		this.board_pk = board_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_contents() {
		return board_contents;
	}

	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}

	public String getBoard_answer() {
		return board_answer;
	}

	public void setBoard_answer(String board_answer) {
		this.board_answer = board_answer;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	

}
