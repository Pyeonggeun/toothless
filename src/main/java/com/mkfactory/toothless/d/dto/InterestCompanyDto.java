package com.mkfactory.toothless.d.dto;

public class InterestCompanyDto {

	private int intrest_company_pk;
	private int com_pk;
	private int student_pk;
	
	
	public InterestCompanyDto() {
		super();
	}
	
	public InterestCompanyDto(int intrest_company_pk, int com_pk, int student_pk) {
		super();
		this.intrest_company_pk = intrest_company_pk;
		this.com_pk = com_pk;
		this.student_pk = student_pk;
	}
	
	
	public int getIntrest_company_pk() {
		return intrest_company_pk;
	}
	public void setIntrest_company_pk(int intrest_company_pk) {
		this.intrest_company_pk = intrest_company_pk;
	}
	public int getCom_pk() {
		return com_pk;
	}
	public void setCom_pk(int com_pk) {
		this.com_pk = com_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	
	
}
