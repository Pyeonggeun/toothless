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
        <title>교육 학생 메인</title>
    </head>
    <body>
        <div class="container-fluid">
        	<jsp:include page="../hs/eduStudentTopBanner.jsp"></jsp:include>
            <div class="row">
				<div class="col">
					<div class="row">
						<div class="col"></div>
						<div class="col-8 text-start">
							<a class="btn btn-sm fw-bold" href="./eduMainPageForStudent"
							role="button" style="color: #4c4a4c;">메인페이지</a>
						</div>
						<div class="col"></div>
					</div>
				</div>
			</div> 

            <h1>학생 메인 페이지!!!</h1>
            <div class="row">
                <div class="col"></div>
                    <a href="./eduMyPageForStudent">마이페이지</a>
                <div class="col-8">
                    <div class="row">
                        <div class="col"></div>
                        <div class="col fw-bold" style="font-size: 1.5em;">
                            보건 교육 프로그램
                        </div>
                        <div class="col-4"></div>
                    </div>
                </div>    




                    <table border="1">
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
                            <td><a href="./readEduProgPageForStudent?edu_pk=${map.eduDto.edu_pk}">${map.eduDto.name }</a></td>
                            <td>${map.staffInfoDto.name }</td>
                            <td><fmt:formatDate value="${map.eduDto.edu_date }"
                            pattern="yy년 MM월 dd일 hh시"/></td>
                            <td><fmt:formatDate value="${map.eduDto.created_at }"
                            pattern="yy년 MM월 dd일 hh시"/></td>
                        </tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
                      






                    <!-- 푸터 시작 -->
                    <div class="row">
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
                    <!-- 푸터 끝 -->
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>