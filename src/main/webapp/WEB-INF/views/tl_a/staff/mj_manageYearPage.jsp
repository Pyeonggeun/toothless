<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include> 
	
	<!-- 기숙사관리 탭 페이지 -->
	<jsp:include page="../commons/staff/topNavi2.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					학년도/학기 관리
				</div>
			</div>
			
			<!-- 상품 주요 정보 -->
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
			
			<!-- 상품목록 -->
			<div class="row mt-4 py-3 justify-content-between">
				<div class="col-6">
					검색결과 (총 ${countYearList }개)
					<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
           				<i class="bi bi-download"></i>
           				학년도/학기 내역 다운로드
           			</button>
				</div>
				<div class="col-2 me-1 justify-content-end">
					<select class="form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
					  <option selected>내림차순</option>
					  <option value="1">오름차순</option>
					</select>
				</div>
			</div>
			
			<!-- 표 -->
			<table class="table table-bordered p-0 text-center align-middle">
			  <thead>
			    <tr class="align-middle border-bottom border-2">
			      <th scope="col" class="col-1 text-bg-light"></th>
			      <th scope="col" class="col-3 text-bg-light">학년도</th>
			      <th scope="col" class="col-3 text-bg-light">학기</th>
			      <th scope="col" class="col-2 text-bg-light">진행상태</th>
			      <th scope="col" class="text-bg-light">수정</th>
			      <th scope="col" class="text-bg-light">삭제</th>
			    </tr>
			  </thead>
			  <c:forEach items="${yearList }" var="item">
			  <tbody>
			    <tr>
			      <td class="p-0 pt-1 text-center">
				    <div class="form-check m-0 p-0 d-inline-block">
				        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
				        <label class="form-check-label" for="flexCheckDefault">
				        </label>
				    </div>
				  </td>
				  <td>${item.semester_year }</td>
				  <td>${item.semester }</td>
				  <td>${item.progress_state }</td>
				  <td>언젠가수정버튼</td>
				  <td>언젠가삭제버튼</td>
			    </tr>		    
			  </tbody>
			  </c:forEach>
			</table>

			
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>