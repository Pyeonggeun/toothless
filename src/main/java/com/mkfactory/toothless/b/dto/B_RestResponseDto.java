package com.mkfactory.toothless.b.dto;

public class B_RestResponseDto {
	
	private String result;
	private Object data;
	
	public B_RestResponseDto() {
		super();
	}

	public B_RestResponseDto(String result, Object data) {
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
