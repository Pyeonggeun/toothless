<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

  

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
	
	<!-- 두번째 상단 -->
	<jsp:include page="../commons/staff/topNavi3.jsp"></jsp:include>
	
	<!-- 내용시작 -->
	<div class="row">
		
		<!-- 우측내용 -->
		<div class="col" style="background-color: aliceblue;">
            <!-- 메인페이지 -->
            
            
            <div class="row">
                <div class="col">
                    <!-- 상단 -->
                    <div class="row">
                        <div class="col">
                            <div class="row pe-2 pt-4 ps-5">
                                <div class="col bg-white rounded-4 border border-light-subtle" style="height: 396px;">
                                    <div class="row ms-3 mt-3">
	                                	<div class="col fs-4 fw-bold align-middle">
	                                		업무 게시판
	                                	</div>
	                                </div>
                                    <div class="row ms-3 mt-5">
                                    	<div class="col mt-3">
		                                    <a class="btn btn-lg fw-bold" href="#" role="button" style="background-color: rgb(219, 241, 248);">글 등록하기</a>
                                    	</div>                          
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <div class="row ps-2 pb-2 pt-4 pe-5">
                                        <div class="col bg-white rounded-4 border border-light-subtle" style="height: 190px;">
                                            <div class="row ms-3 mt-3">
                                                <div class="col fs-4 fw-bold align-middle">
                                                    공고 목록
                                                </div>
                                            </div>
		                                    <div class="row me-3 mb-2 text-end">
		                                    	<div class="col">
				                                    <a class="btn fw-bold" href="#" role="button" style="background-color: rgb(219, 241, 248);">공고 등록하기</a>
		                                    	</div>                          
		                                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="row ps-2 pb-2 pt-2 pe-5">
                                        <div class="col bg-white rounded-4 border border-light-subtle" style="height: 190px;">
                                            <div class="row ms-3 mt-3">
                                                <div class="col fs-4 fw-bold align-middle">
                                                    선발 현황
                                                </div>
                                            </div>
                                            <div class="row mt-4 fs-4 fw-bold text-center">
                                                <div class="col-1"></div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    x
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    x
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    x
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    x
                                                    </a>
                                                </div>
                                                <div class="col-1"></div>
                                            </div>
                                            <div class="row mt-2 text-center">
                                                <div class="col-1"></div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    신청</a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    선발완료</a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    납부완료</a>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="text-black" style="text-decoration: none;">
                                                    배정완료</a>
                                                </div>
                                                <div class="col-1"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                	
                    <!-- 중간 -->
                    <div class="row">
                        <div class="col">
                        	<div class="row">
                        		<div class="col ps-5 pt-2 pe-2">
		                            <div class="col bg-white rounded-4 border border-light-subtle" style="height: 220px;">
		                                <div class="row ms-3 mt-3">
		                                	<div class="col fs-5 fw-bold">
		                                		임원 관리
		                                	</div>
		                                </div>
                                        <div class="row ms-3 mt-1">
		                                	<div class="col fw-lighter" style="font-size: 0.9rem">
		                                		23.12.03 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">임원 현황</div>
		                                			<div class="col fw-bold fs-4 text-end">7
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">일지 관리</div>
		                                			<div class="col fw-bold fs-4 text-end">11 
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                	</div>
		                                </div>
		                            </div>
		                        </div>
                        		<div class="col ps-2 pb-2 pt-2 pe-2">
		                            <div class="col bg-white rounded-4 border border-light-subtle" style="height: 220px;">
		                                <div class="row ms-3 mt-3">
		                                	<div class="col fs-5 fw-bold">
		                                		상/벌점 관리
		                                	</div>
		                                </div>
		                                <div class="row ms-3 mt-1">
		                                	<div class="col fw-lighter" style="font-size: 0.9rem">
		                                		23.12.03 기준
		                                	</div>
		                                </div>
                                        <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">장학금 대상</div>
		                                			<div class="col fw-bold fs-4 text-end">7
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">징계 대상</div>
		                                			<div class="col fw-bold fs-4 text-end text-danger">11 
		                                				<span class="fw-lighter text-black" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                	</div>
		                                </div>
		                            </div>
		                        </div>
                        	</div>                            
                        </div>
                        <div class="col">
                        	<div class="row">
                        		<div class="col ps-2 pb-4 pt-2 pe-2">
		                            <div class="col bg-white rounded-4 border border-light-subtle" style="height: 220px;">
		                                <div class="row ms-3 mt-3">
		                                	<div class="col fs-5 fw-bold">
		                                		외출/외박 현황
		                                	</div>
		                                </div>
		                                <div class="row ms-3 mt-1">
		                                	<div class="col fw-lighter" style="font-size: 0.9rem">
		                                		23.12.03 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">외출 인원</div>
		                                			<div class="col fw-bold fs-4 text-end">7
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">외박 인원</div>
		                                			<div class="col fw-bold fs-4 text-end">11 
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                	</div>
		                                </div>
		                            </div>
		                        </div>
                        		<div class="col ps-2 pb-2 pt-2 pe-5">
		                            <div class="col bg-white rounded-4 border border-light-subtle" style="height: 220px;">
		                                <div class="row ms-3 mt-3">
		                                	<div class="col fs-5 fw-bold">
		                                		점호 참석 현황
		                                	</div>
		                                </div>
		                                <div class="row ms-3 mt-1">
		                                	<div class="col fw-lighter" style="font-size: 0.9rem">
		                                		23.12.03 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">
		                                				<a href="#" class="text-black" style="text-decoration: none;">
			                                				불참 인원		                                				
		                                				</a>		                                				
		                                			</div>
		                                			<div class="col fw-bold fs-4 text-end">
														<a href="#" class="text-danger" style="text-decoration: none;">
			                                				7                                				
		                                				</a>
		                                				<span class="fw-lighter" style="font-size: 0.9rem"> <i class="bi bi-chevron-right"></i> </span>
		                                			</div>
		                                			<div class="col-2"></div>
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

            <!-- 최하단 -->
            <div style="background-color:rgb(219, 241, 248)">
                
            </div>
		</div>
	</div>

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>