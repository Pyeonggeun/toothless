<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<title>교육프로그램 신청</title>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="../hs/eduStudentTopBanner.jsp"></jsp:include>

			<div class="row">
                <div class="col">
                    <div class="row">
						<div class="col"></div>
						<div class="col-8 text-start">
							<a href="./eduMainPageForStudent" class="btn btn-sm fw-bold" 
							style="color: #4c4a4c;">메인페이지</a>
							<a href="./eduMyPageForStudent" class="btn btn-sm fw-bold"
							style="color: #4c4a4c;">마이페이지</a>
						</div>
						<div class="col"></div>
					</div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col"></div>

                <div class="col-6" >
					<form action="./eduApplyProcess" method="get">
                 	<div class="row border-bottom border-dark border-2">
                        <div class="col mb-3 fw-bold text-center" style="font-size: 1.5em;">
							교육프로그램 신청
						</div>
                    </div>
                    <div class="row border-bottom ">
                        <div class="col"></div>
                        <div class="col-8 px-0 mt-3">
                            

                            <div class="row">
                                <div class="col fw-bold" 
								style="font-size: 24px;
                                color: #2969B0;">
                                    ${name }
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col fw-bold">
                                    <span style="font-size: 18px;">
                                        신청자 &nbsp;
                                    </span> 
                                    <span style="font-size: 18px;">
                                        ${sessionStudentInfo.name}
                                    </span>
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col fw-bold">
                                    <span style="font-size: 18px;">
                                        학&nbsp;&nbsp;&nbsp;번 &nbsp;
                                    </span> 
                                    <span style="font-size: 18px;">
										${sessionStudentInfo.student_id}
                                    </span>
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col fw-bold" style="font-size: 18px;">
                                    <span>
                                        학&nbsp;&nbsp;&nbsp;과 &nbsp;
                                    </span> 
                                    <span>
                                        ${studentOtherInfo.departmentName } 
                                        <c:if test="${studentOtherInfo.graduationInfo == 0 }">
                                        ${studentOtherInfo.studentYear }학년
                                        </c:if> 
                                    </span>
                                </div>

                            </div>
                            <div class="row my-2">
                                <div class="col fw-bold" style="font-size: 18px;">
                                    <span>
                                        연락처 &nbsp;
                                    </span> 
                                    <span>
                                        ${sessionStudentInfo.phone}
                                    </span>
                                </div>
								<input name="edu_pk" type="hidden" value="${edu_pk}" >	
                            </div>
                        </div>
						<div class="col"></div>
                    </div>

					<!-- 신청 버튼 -->
					<div class="row mt-3">
						<div class="col"></div>
						<div class="col-8 text-center">
							<c:choose>
								<c:when test="${applyStudentCount < eduDto.capacity}">
									<button class="btn fw-bold text-white" 
											style="background-color: #014195;" 
											type="submit">
										프로그램 신청
									</button>
								</c:when>
							
								<c:otherwise>
									<button class="btn fw-bold" style="background-color: #a6abb2;" disabled>
										프로그램 신청
									</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col"></div>
					</div>

					</form>
				</div>
				<!-- col-8 끝나는곳 -->
				<div class="col"></div>
			</div>	
		</div>















		<!-- <h1>프로그램 신청 페이지입니다</h1>
		
		<form action="./eduApplyProcess" method="get">
		
			프로그램명 ${name}<br>
			신청자 ${sessionStudentInfo.name}<br>
			학번 ${sessionStudentInfo.student_id}<br>
			학과 ${sessionStudentInfo.department_pk}<br>
			전화번호 ${sessionStudentInfo.phone}<br>
			<input name="edu_pk" type="hidden" value="${edu_pk}" >
		
			<c:choose>
	            <c:when test="${applyStudentCount < eduDto.capacity}">
				    <button class="btn fw-bold text-white" 
		                	style="background-color: #014195;" 
		                	type="submit">
			            프로그램 신청
			        </button>
	            </c:when>
			
	            <c:otherwise>
		            <button class="btn fw-bold" style="background-color: #a6abb2;" disabled>
		            	프로그램 신청
		            </button>
	            </c:otherwise>
	        </c:choose>
		</form> -->
		
		
		
		
		
					<div class="row mt-5">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                                </div>
                                                <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                                </div>
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                                    <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                    <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
</html>