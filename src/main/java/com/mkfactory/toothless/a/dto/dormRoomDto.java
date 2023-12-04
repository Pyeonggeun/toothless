package com.mkfactory.toothless.a.dto;

public class dormRoomDto {
	private int dorm_room_pk;
	private int dorm_pk;
	private String room_name;
	private String gender;
	private int dorm_floor;
	
	
	public dormRoomDto() {
		super();
	}


	public dormRoomDto(int dorm_room_pk, int dorm_pk, String room_name, String gender, int dorm_floor) {
		super();
		this.dorm_room_pk = dorm_room_pk;
		this.dorm_pk = dorm_pk;
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
