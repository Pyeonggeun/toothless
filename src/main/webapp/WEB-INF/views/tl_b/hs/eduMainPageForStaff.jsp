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
        <title>교육 교직원 메인</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
               		<jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <!-- 여기 안에만 사용하면 됨 -->
                                	<div class="row mx-5">
                                        <div class="col">
                                            <div class="row">  
                                                <div class="col pt-4 px-4">
                                                    <div class="row">

                                                        <div class="col"> <!--교육목록-->
                                                            <div class="row">
                                                            	<div class="col">
                                                            	</div>
                                                                <div class="col text-center fw-bold" style="font-size: 1.3em;">
                                                                    교육 프로그램 신청 현황
                                                                </div>
                                                                <div class="col-4 text-end">
                                                                    <input name="name" type="text" style="height: 25px;">
                                                                    <i class="bi bi-search-heart"></i>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col">
                                                                    <div class="row fw-bold pb-1 border-bottom border-dark">
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>학생이름</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>프로그램명</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>신청일</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>상태</span>
                                                                        </div>
                                                                    </div>
                                                                    <c:forEach items="${eduApplyList }" var="edu">
                                                                        <div class="row py-1 border-bottom">
                                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                                <span>${edu.studentInfoDto.name }</span>
                                                                            </div>
                                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                                <span>${edu.eduDto.name }</span>
                                                                            </div>
                                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                                <span><fmt:formatDate value="${edu.eduApplyDto.created_at}"
                                                                                pattern="yy년 MM월 dd일"/></span>
                                                                            </div>
                                                                            <!-- <div class="col" style="text-align: center;">
                                                                                <span>1/10</span>
                                                                            </div> -->
                                                                            <div class="col align-self-center text-center">
                                                                            	<c:choose>
                                                                            		<c:when test="${edu.eduApplyDto.status eq 'N'}">
                                                                            			<a class="btn btn-sm px-2 fw-bold text-white" href="./updateStatusYProcess?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
	                                                                                	role="button" style="background-color: black;">수료대기</a>
                                                                            		</c:when>
                                                                            		<c:when test="${edu.eduApplyDto.status eq 'Y'}">
                                                                            			<a class="btn btn-sm fw-bold text-white" href="./updateStatusNProcess?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
	                                                                                	role="button" style="background-color: #014195;">수료완료</a>
                                                                            		</c:when>
	                                                                                <c:otherwise>
	                                                                                	<a class="btn btn-sm fw-bold" href=#
	                                                                                	role="button" style="background-color: #F3F3F3; color: #C4C3C4;" >신청취소</a>
	                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div> <!--교육목록 끝--> 

                                                        <div class="col-4"> <!--만족도 ㅎㅎ-->
                                                            <div class="row">
                                                                <div class="col text-center fw-bold" style="font-size: 1.3em;">
                                                                    만족도
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row my-5"> <!--교육현황관리-->
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.3em;">
                                                            교육 프로그램 목록
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3"> <!--목록 출력-->
                                                        <div class="col">
                                                            <div class="row fw-bold pb-1 border-bottom border-dark">
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>글번호</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>프로그램명</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>신청인원/교육정원</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>작성자</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>교육일</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>작성일</span>
                                                                </div>
                                                            </div>
                                                            <!-- 프로그램 신청 현황목록 내용 -->
                                                            <c:forEach items="${list }" var="edu">
                                                                <div class="row py-1 border-bottom">
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>${edu.eduDto.edu_pk }</span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>
                                                                        <a href="./readEduProgPage?edu_pk=${edu.eduDto.edu_pk}" class="text-black"
                                                                        style="text-decoration: none;">
                                                                        ${edu.eduDto.name }
                                                                        </a></span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>1/${edu.eduDto.capacity }</span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>${edu.staffInfoDto.name }</span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span><fmt:formatDate value="${edu.eduDto.edu_date }" pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span><fmt:formatDate value="${edu.eduDto.created_at }" pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                            <div class="row mt-2"> <!--등록버튼이요-->
                                                                <div class="col text-end" >
                                                                    <a class="btn fw-bold text-white" href="./eduProgRegisterPage"
                                                                    role="button" style="background-color: #014195;
                                                                    ">프로그램 등록</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>    
                                        </div>
                                    </div>

                                    
                                    <!-- <table border="1">
										<tr>
											<td>글번호</td>
											<td>프로그램명</td>
											<td>작성자</td>
											<td>교육일</td>
											<td>작성일</td>
										</tr>   
                                    <c:forEach items="${list }" var="map">
                                    	<tr>
											<td>${map.eduDto.edu_pk }</td>
											<td><a href="./readEduProgPage?edu_pk=${map.eduDto.edu_pk}">${map.eduDto.name }</a></td>
											<td>${map.staffInfoDto.name }</td>
											<td>${map.eduDto.edu_date }</td>
											<td><fmt:formatDate value="${map.eduDto.created_at }"
											pattern="yy년 MM월 dd일 hh시 mm분 ss초"/></td>
										</tr>
                                    </c:forEach>
                                    </table>
                                    <a href="./eduProgRegisterPage">프로그램 등록</a>  -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-4 my-auto">
                                                    <img class="img-fluid" src="./img/health/health_ci.gif">
                                                </div>
                                                <div class="col text-body-tertiary" style="font-size: small;">
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
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>