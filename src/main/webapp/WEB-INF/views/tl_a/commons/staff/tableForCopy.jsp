<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 검색바 -->
	<div class="row mb-3">
		<div class="col fs-5 fw-bold">
			검색조건
		</div>
	</div>
	<div class="row">
		<div class="col border rounded-0 mx-2" style="background-color: #eeeeee;">
			<div class="row border-bottom py-2">
				<div class="col-2 text-center align-self-center fw-bold">
					기준일
				</div>
				<div class="col align-self-center">
					<!-- 버튼들 -->
	            	<div class="row">
	            		<div class="col-2 text-end">
							<select class="border-secondary-subtle form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
							  <option selected>학년도</option>
							  <option value="1">학기</option>
							</select>
						</div>
	            		<div class="col-2 align-self-center">
	            			<input type="date" class="border border-secondary-subtle form-control rounded-0 py-1" style="font-size: 0.9rem; color: #aaaaaa">
	            		</div> ~ 
	            		<div class="col-2 align-self-center">
	            			<input type="date" class="border-secondary-subtle form-control rounded-0 py-1" style="font-size: 0.9rem; color: #aaaaaa">
	            		</div>
	            		<div class="col-1 d-grid px-1">
	            			<button type="button" class="border-secondary-subtle px-0 btn btn-sm btn-light text-black" style="color: #aaaaaa">
	            				최근 1주
	            			</button>
	            		</div>
	            		<div class="col-1 d-grid px-1">
	            			<button type="button" class="border-secondary-subtle px-0 btn btn-sm btn-light text-black" style="color: #aaaaaa">
	            				최근 1달
	            			</button>
	            		</div>
	            	</div>
				</div>
			</div>
			<div class="row border-bottom py-2">
				<div class="col-2 text-center align-self-center fw-bold">
					진행 상태
				</div>
				<div class="col ms-2">
					<div class="row">
						 <div class="col text-start">
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="1" value="" checked>
	                            <label class="form-check-label" for="inlineRadio1">전체</label>
	                        </div>                                
	                    </div>
	                    <div class="col text-start">
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="1" value="">
	                            <label class="form-check-label" for="inlineRadio2">현재</label>
	                        </div>
	                    </div>
	                    <div class="col text-start">
	                        <div class="form-check form-check-inline">
	                            <input class="form-check-input" type="radio" name="1" value="" >
	                            <label class="form-check-label" for="inlineRadio3">이전</label>
	                        </div>
	                    </div>
	                    <div class="col-7"></div>
					</div>
				</div>
			</div>
			<div class="row border-bottom py-2">
				<div class="col-2 text-center align-self-center fw-bold">
					유형
				</div>
				<div class="col-1 text-end">
					<select class="border-secondary-subtle form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
					  <option selected>전체</option>
					  <option value="1">WEEKLY</option>
					  <option value="1">MONTHLY</option>
					</select>
				</div>
				<div class="col-1"></div>
				<div class="col-2 text-center align-self-center fw-bold">
					상세조건
				</div>
				<div class="col-1 text-end">
					<select class="border-secondary-subtle form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
					  <option selected>옵션ID</option>
					  <option value="1">#</option>
					</select>
				</div>
				<div class="col-3">
					<input type="text" class="border-1 border-secondary-subtle ">						
				</div>
			</div>
			<div class="row py-2 justify-content-center">
           		<div class="col-3 d-grid px-3">
           			<button type="button" class="border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-primary">
           				<i class="bi bi-search"></i> 조회하기
           			</button>
           		</div>
           		<div class="col-3 d-grid px-3">
           			<button type="button" class="border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
           				<i class="bi bi-arrow-clockwise"></i> 초기화
           			</button>
           		</div>
			</div>			
		</div>
	</div>


	<!-- 표 -->
	<table class="table table-bordered p-0 text-center align-middle">
	  <thead>
	    <tr class="align-middle border-bottom border-2">
	      <th scope="col" class="text-bg-light"></th>
	      <th scope="col" class="text-bg-light">주문번호</th>
	      <th scope="col" class="text-bg-light">주문일시</th>
	      <th scope="col" class="text-bg-light">운송장번호</th>
	      <th scope="col" class="text-bg-light">출고예정일</th>
	      <th scope="col" class="col-2 text-bg-light">등록상품명</th>
	      <th scope="col" class="text-bg-light">수량</th>
	      <th scope="col" class="col-2 text-bg-light">배송지</th>
	      <th scope="col" class="text-bg-light">수취인</th>
	      <th scope="col" class="text-bg-light">연락처</th>
	      <th scope="col" class="col-1 text-bg-light">진행상태</th>
	      <th scope="col" class="text-bg-light">배송지시</th>
	    </tr>
	  </thead>
	  <c:forEach items="${bItemList }" var="item">
	  <tbody>
	    <tr>
	      <td class="p-0 ps-2 pe-1 pt-1">
		    <div class="form-check m-0 p-0">
			  <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
			  <label class="form-check-label" for="flexCheckDefault">
			  </label>
			</div>
		  </td>
	      <th scope="row">${item.purchaseDto.id }</th>
	      <td><fmt:formatDate value="${item.purchaseDto.purchaseDate }" pattern="yy.MM.dd" /></td>
	      <td>53401-7319-01-078</td>
	      <td>
			<fmt:formatDate value="${item.purchaseDto.purchaseDate}" pattern="yy.MM.dd" />
	      </td>					      					      
	      <td>${item.someItemDto.itemName }</td>
	      <td>${item.purchaseDto.purchaseCount }</td>
	      <td>${item.purchaseDto.address }</td>
	      <td>${item.someCustomerDto.nickname }</td>					      
	      <td>01098761234</td>
	      <td>
		  <c:choose>
		  	<c:when test="${item.purchaseDto.progressState == 'b' }">
				상품 준비중
		  	</c:when>
		  	<c:when test="${item.purchaseDto.progressState == 'c' }">
				배송중
		  	</c:when>
		  	<c:when test="${item.purchaseDto.progressState == 'd' 
			  			|| item.purchaseDto.progressState == 'e' 
			  			|| item.purchaseDto.progressState == 'f'}">
				배송완료
		  	</c:when>
		  </c:choose>
	      </td>
	      <td>
		      <c:choose>
			  	<c:when test="${item.purchaseDto.progressState == 'b' }">
				  <a href="./updateProgressState?id=${item.purchaseDto.id }&progressState=c">
			      <button type="button" class="rounded-0 btn btn-primary btn-sm mb-1">배송지시</button> <br>
			      </a>
			  	</c:when>
			  	<c:when test="${item.purchaseDto.progressState == 'c'}">
			      <button type="button" class="rounded-0 btn btn-secondary btn-sm mb-1" disabled>지시완료</button> <br>
			  	</c:when>
			  </c:choose>
			  
			  <c:choose>
	    	  	<c:when test="${item.purchaseDto.progressState == 'b' }">
			      <button type="button" class="rounded-0 btn btn-light btn-sm mb-1" disabled>배송확정</button> <br>
			  	</c:when>
			  	<c:when test="${item.purchaseDto.progressState == 'c' }">
				  <a href="./updateProgressState?id=${item.purchaseDto.id }&progressState=d">
			      <button type="button" class="rounded-0 btn btn-warning btn-sm mb-1">배송확정</button> <br>
			      </a>
			  	</c:when>
			  	<c:when test="${item.purchaseDto.progressState == 'd' 
			  			|| item.purchaseDto.progressState == 'e' 
			  			|| item.purchaseDto.progressState == 'f'}">
			      <button type="button" class="rounded-0 btn btn-success btn-sm py-3 mb-1" disabled>배송완료</button> <br>
			  	</c:when>
			  </c:choose>
	      </td>
	    </tr>		    
	  </tbody>
	  </c:forEach>
	</table>


</body>
</html>