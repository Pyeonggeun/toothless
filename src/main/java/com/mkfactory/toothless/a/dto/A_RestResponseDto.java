package com.mkfactory.toothless.a.dto;

import java.util.*;

//RESTful API 응답을 포장하고 반환하기 위한 데이터 전송 객체 (DTO)
public class A_RestResponseDto {
	
	private String result;	// 성공여부
	private Object data;	// true/false결과
	
	
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
