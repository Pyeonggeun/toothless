package com.mkfactory.toothless.e.dto;

public class GroupCounselCounselorDto {

	private int id;
	private int group_counsel_id;
	private int counselor_id;
	
	public GroupCounselCounselorDto() {
		super();
	}

	public GroupCounselCounselorDto(int id, int group_counsel_id, int counselor_id) {
		super();
		this.id = id;
		this.group_counsel_id = group_counsel_id;
		this.counselor_id = counselor_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGroup_counsel_id() {
		return group_counsel_id;
	}

	public void setGroup_counsel_id(int group_counsel_id) {
		this.group_counsel_id = group_counsel_id;
	}

	public int getCounselor_id() {
		return counselor_id;
	}

	public void setCounselor_id(int counselor_id) {
		this.counselor_id = counselor_id;
	}
	
	
	
	
}
