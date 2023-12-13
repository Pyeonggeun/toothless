package com.mkfactory.toothless.x.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LifeLecturerDto {
	
	private int lecturer_key;
	private int external_pk;
	private String name;
	private String resident_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String address;
	private String phone;
	private String email;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date entered_at;
	private Date created_at;
	
	
	public LifeLecturerDto() {}


	public LifeLecturerDto(int lecturer_key, int external_pk, String name, String resident_id, Date birth,
			String gender, String address, String phone, String email, Date entered_at, Date created_at) {
	
		this.lecturer_key = lecturer_key;
		this.external_pk = external_pk;
		this.name = name;
		this.resident_id = resident_id;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.entered_at = entered_at;
		this.created_at = created_at;
	}


	public int getLecturer_key() {
		return lecturer_key;
	}


	public void setLecturer_key(int lecturer_key) {
		this.lecturer_key = lecturer_key;
	}


	public int getExternal_pk() {
		return external_pk;
	}


	public void setExternal_pk(int external_pk) {
		this.external_pk = external_pk;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getResident_id() {
		return resident_id;
	}


	public void setResident_id(String resident_id) {
		this.resident_id = resident_id;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEntered_at() {
		return entered_at;
	}


	public void setEntered_at(Date entered_at) {
		this.entered_at = entered_at;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
	
	
	

}
