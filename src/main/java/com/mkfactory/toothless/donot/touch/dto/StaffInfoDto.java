package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StaffInfoDto {
	private int staff_pk;
	private int center_pk;
	private String staff_id;
	private String password;
	private String name;
	private String resident_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private Date entered_at;
	private Date created_at;
	public StaffInfoDto() {
		super();
	}
	public StaffInfoDto(int staff_pk, int center_pk, String staff_id, String password, String name, String resident_id,
			Date birth, String gender, String address, String phone, String email, Date entered_at, Date created_at) {
		super();
		this.staff_pk = staff_pk;
		this.center_pk = center_pk;
		this.staff_id = staff_id;
		this.password = password;
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
	public int getStaff_pk() {
		return staff_pk;
	}
	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}
	public int getCenter_pk() {
		return center_pk;
	}
	public void setCenter_pk(int center_pk) {
		this.center_pk = center_pk;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
