package com.mkfactory.toothless.a.dto;

public class DormRoomDto {
	private int dorm_room_pk;
	private int dorm_pk;
	private int dorm_amount_pk;
	private String room_name;
	private String gender;
	private int dorm_floor;
	
	public DormRoomDto() {
		super();
	}

	public DormRoomDto(int dorm_room_pk, int dorm_pk, int dorm_amount_pk, String room_name, String gender,
			int dorm_floor) {
		super();
		this.dorm_room_pk = dorm_room_pk;
		this.dorm_pk = dorm_pk;
		this.dorm_amount_pk = dorm_amount_pk;
		this.room_name = room_name;
		this.gender = gender;
		this.dorm_floor = dorm_floor;
	}

	public int getDorm_room_pk() {
		return dorm_room_pk;
	}

	public void setDorm_room_pk(int dorm_room_pk) {
		this.dorm_room_pk = dorm_room_pk;
	}

	public int getDorm_pk() {
		return dorm_pk;
	}

	public void setDorm_pk(int dorm_pk) {
		this.dorm_pk = dorm_pk;
	}

	public int getDorm_amount_pk() {
		return dorm_amount_pk;
	}

	public void setDorm_amount_pk(int dorm_amount_pk) {
		this.dorm_amount_pk = dorm_amount_pk;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getDorm_floor() {
		return dorm_floor;
	}

	public void setDorm_floor(int dorm_floor) {
		this.dorm_floor = dorm_floor;
	}
	
	

	
	
}
