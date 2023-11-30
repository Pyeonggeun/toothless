package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class ProfessorInfoDto {
	private int professor_pk;
	private int department_pk;
	private String professor_id;
	private String password;
	private String name;
	private String resident_id;
	private Date birth;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private Date entered_at;
	private Date created_at;
	public ProfessorInfoDto() {
		super();
	}
	public ProfessorInfoDto(int professor_pk, int department_pk, String professor_id, String password, String name,
			String resident_id, Date birth, String gender, String address, String phone, String email, Date entered_at,
			Date created_at) {
		super();
		this.professor_pk = professor_pk;
		this.department_pk = department_pk;
		this.professor_id = professor_id;
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
	public int getProfessor_pk() {
		return professor_pk;
	}
	public void setProfessor_pk(int professor_pk) {
		this.professor_pk = professor_pk;
	}
	public int getDepartment_pk() {
		return department_pk;
	}
	public void setDepartment_pk(int department_pk) {
		this.department_pk = department_pk;
	}
	public String getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
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
