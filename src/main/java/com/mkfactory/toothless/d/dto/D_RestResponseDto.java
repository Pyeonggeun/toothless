package com.mkfactory.toothless.d.dto;

public class D_RestResponseDto {

	private String result;
	private Object data;
	
	
	public D_RestResponseDto() {
		super();
	}


	public D_RestResponseDto(String result, Object data) {
		super();
		this.result = result;
		this.data = data;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public Object getData() {
		return data;
	}


	public void setData(Object data) {
		this.data = data;
	}
	
	
}
