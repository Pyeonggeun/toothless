<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // 현재 날짜를 가져오기
    Date currentDate = new Date();

    // 날짜를 원하는 형식으로 포맷팅
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd");
    String formattedDate = dateFormat.format(currentDate);
%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
<style>
    .word {
        width: 1rem;
        font-size: 1rem;
        font-weight: !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
</style>

</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/mainPageTopNavi.jsp"></jsp:include>

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
                                                    공지사항 목록
                                                </div>
		                                    	<div class="col text-end me-3">
				                                    <a class="btn fw-bold" href="../student/dm_dormNoticePage" role="button" style="background-color: rgb(219, 241, 248);">공지사항 등록하기</a>
		                                    	</div>
                                            </div>
		                                    <div class="row my-2 me-3">
		                                    	<div class="col">
		                                    		<div class="row my-3 text-center">
		                                    			<div class="col"><span class="fw-bold">제목</span></div>
		                                    			<div class="col"><span class="fw-bold">내용</span></div>
		                                    			<div class="col-2"><span class="fw-bold">작성일</span></div>
		                                    		</div>
		                                    		<c:forEach items="${dormNoticeList}" var="dormNoticeList">
		                                    			<div class="row my-2">
		                                    				<div class="col ms-4">${dormNoticeList.title}</div>
		                                    				<div class="word col">${dormNoticeList.content}</div>
		                                    				<div class="col-2 text-center"><fmt:formatDate value="${dormNoticeList.created_at}" pattern="yyyy-MM-dd" /></div>
		                                    			</div>
		                                    		</c:forEach>
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
                                                    <a href="./mj_readApplyDormInfoPage" class="text-black" style="text-decoration: none;">
                                                    ${countApplyList }
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <a href="./mj_readApplyDormInfoPage" class="text-black" style="text-decoration: none;">
                                                    ${countDormSelectedList }
                                                    </a>
                                                </div>
                                                <div class="col">
                                                    <a href="./mj_managePaymentPage" class="text-black" style="text-decoration: none;">
                                                    ${countPaymentYesList }
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
                                                    <a href="./mj_readApplyDormInfoPage" class="text-black" style="text-decoration: none;">
                                                    신청</a>
                                                </div>
                                                <div class="col">
                                                    <a href="./mj_readApplyDormInfoPage" class="text-black" style="text-decoration: none;">
                                                    선발완료</a>
                                                </div>
                                                <div class="col">
                                                    <a href="./mj_managePaymentPage" class="text-black" style="text-decoration: none;">
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
		                                		 ${thisSemester.semester_year} ${thisSemester.semester} 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">임원 현황</div>
		                                			<div class="col fw-bold fs-4 text-end">${countExecutive}
		                                				<span class="fw-lighter" style="font-size: 0.9rem"><a href="./jw_executiveAssignmentPage"><i class="bi bi-chevron-right"></i></a> </span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">일지 관리</div>
		                                			<div class="col fw-bold fs-4 text-end">${countTodayDiary}
		                                				<span class="fw-lighter" style="font-size: 0.9rem"><a href="./jw_diaryManagementPage"><i class="bi bi-chevron-right"></i></a></span>
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
		                                		${thisSemester.semester_year} ${thisSemester.semester} 기준
		                                	</div>
		                                </div>
                                        <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">장학금 대상</div>
		                                			<div class="col fw-bold fs-4 text-end">${countPlusPointDormStudent}
		                                				<span class="fw-lighter" style="font-size: 0.9rem"><a href="./jw_pointSituationPage"><i class="bi bi-chevron-right"></i></a></span>
		                                			</div>
		                                			<div class="col-2"></div>
		                                		</div>
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">징계 대상</div>
		                                			<div class="col fw-bold fs-4 text-end text-danger">${countMinusPointDormStudent}
		                                				<span class="fw-lighter text-black" style="font-size: 0.9rem"><a href="./jw_pointSituationPage"><i class="bi bi-chevron-right"></i></a></span>
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
		                                		<%= formattedDate %> 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">외출/외박 인원</div>
		                                			<div class="col fw-bold fs-4 text-end">${countTodayExit}
		                                				<span class="fw-lighter" style="font-size: 0.9rem"><a href="./jw_exitSituationPage"><i class="bi bi-chevron-right"></i></a></span>
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
		                                		<%= formattedDate %> 기준
		                                	</div>
		                                </div>
		                                <div class="row mt-4">
		                                	<div class="col">
		                                		<div class="row justify-content-between">
		                                			<div class="col-1"></div>
		                                			<div class="col fw-lighter text-start align-self-center">
			                                				불참 인원
		                                			</div>
		                                			<div class="col fw-bold fs-4 text-end text-danger">${countTodayCallAbsence}
		                                				<span class="fw-lighter" style="font-size: 0.9rem"><a href="./jw_callAttendSituationPage"><i class="bi bi-chevron-right"></i></a></span>
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