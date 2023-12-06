package com.mkfactory.toothless.e.dto;

public class NoticeBoardLikeDto {

	private int id;
	private int notice_id;
	private int student_pk; 
	private int notice_like;
	private int notice_dislike;
	
	public NoticeBoardLikeDto() {
		super();
	}

	public NoticeBoardLikeDto(int id, int notice_id, int student_pk, int notice_like, int notice_dislike) {
		super();
		this.id = id;
		this.notice_id = notice_id;
		this.student_pk = student_pk;
		this.notice_like = notice_like;
		this.notice_dislike = notice_dislike;
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

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getNotice_like() {
		return notice_like;
	}

	public void setNotice_like(int notice_like) {
		this.notice_like = notice_like;
	}

	public int getNotice_dislike() {
		return notice_dislike;
	}

	public void setNotice_dislike(int notice_dislike) {
		this.notice_dislike = notice_dislike;
	}
	
}
