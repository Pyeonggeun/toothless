<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        .gold{
            color: #8C7430;
        }
        
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <jsp:include page="../commons/student/leftButtons3.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">합격 조회</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 합격조회</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <!-- 합격통보 -->
						<div class="row text-center">
							<div class="col">
							    <div class="row border mt-2 mb-3">
							    	<div class="col p-1 bg-light">
								    	<div class="row m-3">
								            <div class="col border bg-white">
								                <!-- 신청 결과 -->
								                <div class="row mt-4 text-center">
						                            <div class="col fs-3 fw-bold">
						                                신청 결과
						                            </div>
								                </div>
								
								                <!-- 내용 -->
								                <div class="row p-4">
								                    <div class="col p-3 border bg-light">
								                       <!-- 정보/양식 -->
														<div class="row bg-white border rounded-0 m-3 text-center">
															<div class="col">
																<div class="row border-bottom">
																	<div class="col-2 py-2 border-end fw-bold">
																		학  번
																	</div>
																	<div class="col-4 py-2 border-end">
																		${studentInfoAll.studentInfo.student_id }
																	</div>
																	<div class="col-2 py-2 border-end fw-bold">
																		성  명
																	</div>
																	<div class="col-4 py-2">
																		${studentInfoAll.studentInfo.name }
																	</div>
																</div>
																<div class="row border-bottom">
																	<div class="col-2 py-2 border-end fw-bold">
																		차  수
																	</div>
																	<div class="col-4 py-2 border-end">
																		${thisSemesterJoinDormInfo.joinDormInfoDto.title }
																	</div>
																	<div class="col-2 py-2 border-end fw-bold">
																		상  태
																	</div>
																	<div class="col-4 py-2">
																		<c:choose>
																			<c:when test="${isPass == 1}">
																				<span class="text-primary fw-bold">합격</span>
																			</c:when>
																			<c:when test="${isPass == 2}">
																				<span class="text-danger fw-bold">불합격</span>
																			</c:when>
																			<c:when test="${isPass == 3}">
																				<span class="text-danger fw-bold">신청 정보가 없습니다</span>
																			</c:when>
																		</c:choose>
																	</div>
																</div>
																
																<!-- 불합격이면 납부 관련 안뜨게 -->
																<c:choose>
																	<c:when test="${isPass == 1}">
																		<div class="row border-bottom">
																			<div class="col-2 py-2 border-end fw-bold">
																				납부 금액
																			</div>
																			<div class="col-4 py-2 border-end">
																				일단은! 동일.. 90만원 >_O
																			</div>
																			<div class="col-2 py-2 border-end fw-bold">
																				가상 계좌
																			</div>
																			<div class="col-4 py-2">
																				민짱은행 199-80-704-202312
																			</div>
																		</div>
																		<div class="row border-bottom">
																			<div class="col-2 py-2 border-end fw-bold">
																				납부 기간
																			</div>
																			<div class="col py-2 border-end">
																				<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_start_date }" pattern="yy년 MM월 dd일" />
																				 &nbsp; ~ &nbsp;
																				 <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_end_date }" pattern="yy년 MM월 dd일" />
																			</div>
																		</div>
																		<div class="row border-bottom">
																			<div class="col-2 py-2 border-end fw-bold">
																				납부 여부
																			</div>
																			<div class="col py-2 text-end">
																				<c:choose>
																					<c:when test="${isPay == 1}">
																						<span class="text-primary fw-bold">납부완료</span>
																					</c:when>
																					<c:when test="${isPay == 2}">
																						<span class="text-danger fw-bold">미납부</span>
																					</c:when>
																				</c:choose>
																			</div>
																			<div class="col align-self-center text-end">
																			
																				<c:choose>
																					<c:when test="${isPay == 1}">
																						<button type="button" class="px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
																	           				<i class="bi bi-download"></i>
																	           				 납부 고지서 출력
																	           			</button>
																					</c:when>
																					<c:when test="${isPay == 2}">
																						<button disabled type="button" class="px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
																	           				<i class="bi bi-download"></i>
																	           				 납부 고지서 출력
																	           			</button>
																					</c:when>
																				</c:choose>
																				
																				
																			</div>
																		</div>
																	</c:when>
																</c:choose>
																
															</div>
														</div>
														
								                        <!-- main바로가기/1:1문의하기 -->
								                        <div class="row mt-5 mb-3 text-center">
								                        	<div class="col"></div>
								                            <div class="col">
								                            	<a href="./mj_dormPosted" class=" text-secondary" style="text-decoration: none; font-size: 0.9em;">
								                                모집공고 >
								                                </a>
								                            </div>
								                            <div class="col">
								                            	<a href="./dm_paymentMoney" class=" text-secondary" style="text-decoration: none; font-size: 0.9em;">
								                                납부금 안내 >
								                                </a>			                           			                               
								                            </div>
								                            <div class="col">
								                            	<a href="./dm_FAQ" class=" text-secondary" style="text-decoration: none; font-size: 0.9em;">
								                                FAQ >
								                                </a>			                           			                               
								                            </div>
								                            <div class="col"></div>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
							    	</div>
							    </div>
							
							</div>
							
						</div>
                        
                    </div>
                </div><!-- 여기까지-->
            </div>
            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>