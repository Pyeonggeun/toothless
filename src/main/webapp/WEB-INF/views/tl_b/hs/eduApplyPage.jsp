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
	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
	<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
		<div class="container-fluid">


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

		<pre>
		
		
		
		
		
		
		
		
		
		
		</pre>
		
		
		
		
		<jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>

		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
</html>