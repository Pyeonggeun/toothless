package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ClinicPatientDto {

	private int clinic_patient_pk;
	private String resident_id;
	private String name;
	private int age;
	private String address;
	private String phone;
	private Date created_at;
	
	public ClinicPatientDto() {
		super();
	}

	public ClinicPatientDto(int clinic_patient_pk, String resident_id, String name, int age, String address,
			String phone, Date created_at) {
		super();
		this.clinic_patient_pk = clinic_patient_pk;
		this.resident_id = resident_id;
		this.name = name;
		this.age = age;
		this.address = address;
		this.phone = phone;
		this.created_at = created_at;
	}

	public int getClinic_patient_pk() {
		return clinic_patient_pk;
	}

	public void setClinic_patient_pk(int clinic_patient_pk) {
		this.clinic_patient_pk = clinic_patient_pk;
	}

	public String getResident_id() {
		return resident_id;
	}

	public void setResident_id(String resident_id) {
		this.resident_id = resident_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
