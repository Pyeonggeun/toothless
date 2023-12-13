<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col col-auto border-end">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row mt-4">
                                                        <div class="col text-center" style="font-size: xx-large;">
                                                            MENU
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-center">
                                                            <i class="bi bi-person-lines-fill" style="font-size: 4em;"></i>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-center">
                                                           ${read.staffInfoDto.name }님 환영합니다.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col text-center" style="font-size: small;">
                                                            마이페이지&nbsp;&nbsp;|&nbsp;&nbsp;<a href="./logoutProcess">로그아웃</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-capsule"></i>&nbsp;&nbsp;의약품관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample1">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        재고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        입고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        코드관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-ui-checks"></i>&nbsp;&nbsp;진료관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-person-exclamation"></i>&nbsp;&nbsp;요보호학생관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-box-seam"></i>&nbsp;&nbsp;물품관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample2">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        등록
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        현황관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-highlighter"></i>&nbsp;&nbsp;교육프로그램관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample3">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        등록
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        조회
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        이수자관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-calendar-check"></i>&nbsp;&nbsp;일정관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-question-octagon"></i>&nbsp;&nbsp;공지사항
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">

                                    <div class="row">
                      				  <div class="col">

                                    <div class="row mt-5">
                                        <div class="col fw-bold fs-2">공지사항</div>
                                    </div>
                                    <div class="row">
                                        <div class="col ms-1 " style="font-size: 60%">홈>공지사항</div>
                                    </div>
                                    <div class="row mt-3 border-4 border-bottom"></div>
                                    
                                    
                                    <div class="row mt-2">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col fw-bold fs-4">[제목]&nbsp;&nbsp; ${read.noticeboardDto.title }</div>
                                            </div>
                                            <div class="row">
                                                <div class="col fw-bold" style="font-size: 80%;">${read.staffInfoDto.name }</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-2 text-secondary mx-1" style="font-size: 60%;">
                                                <fmt:formatDate value="${read.noticeboardDto.created_at }" pattern="yy년 MM월 dd일"/>
												 &nbsp;&nbsp; 조회수: ${read.noticeboardDto.read_count }
												</div>
                                                <div class="col-10"></div>
                                            </div>
                                        </div>
                                    </div>

									<div class="row mt-3">
										<div class="col">${read.noticeboardDto.content }</div>
									</div>
                                    <div class="row mt-5">
                                        <div class="col">${read.noticeboardDto.content }
                                        	<c:forEach items="${read.boardImageDtoList }" var="boardImageDto">
                                        	<img src="/uploadFiles/${boardImageDto.img_link }">
                                        </c:forEach>
                                        </div>
                                    </div>
                                    
                                    <div class="row mt-5 pt-3">
                                        <div class="col">
                                           
                                            <div class="row">
                                                <div class="col ">
													<i class="bi bi-heart-fill"></i>${likeCount }
													<i class="bi bi-chat-dots-fill"></i>${replyCount}
                                                </div>
                                            </div>
                                            
                                            
                                            <c:forEach items="${reply }" var="boardReply">
                                            <div class="row mt-3 border-1 border-bottom">
                                                <div class="col">
                                                    <div class="row ">
                                                        <div class="col fw-bold">작성자: ${boardReply.studentDto.name }</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">${boardReply.replyDto.content }</div>
                                                    </div>
                                                    <div class="row">
                                                    	<div class="col" style="text-dacoration: none; font-size: 80%">
                                                    		<fmt:formatDate value="${boardReply.replyDto.created_at }" pattern="yy년 MM월 dd일 "/>
                                                    		<a href="./replyDeleteProcess?id=${boardReply.replyDto.studentboard_reply_pk }&deleteId=${boardReply.studentDto.student_pk}&boardPk=${read.noticeboardDto.studentboard_pk}">삭제</a>
                                                    	</div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
 									
 									
 									
									<div class="row">
                                    <div class="col pe-0 ">
                                        <a href="./staffBoardPage">
                                            <input type='button' class='btn' value='목록'  >
                                        </a>
                                    </div>
                                    <div class="col ps-0 ">
                                        <a href="./noticeDeleteProcess?id=${read.noticeboardDto.studentboard_pk }">
                                            <input type='button' class='btn' value='삭제'  >
                                        </a>
                                    </div>
                                    <div class="col ps-0">
                                        <a href="./noticeUpdatePage?id=${read.noticeboardDto.studentboard_pk }">
                                            <input type='button' class='btn' value='수정' >
                                        </a>
                                    </div>
                                    <div class="col-10"></div>
                                </div>
 									
 									
 									
                                    <div class="row mt-5">
                                        <div class="col">
                                            <div class="row border-1 border-bottom">
                                                <div class="col-1 fw-bold fs-5">이전 글</div>
                                                <div class="col">손씻기 방법</div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-1 fw-bold fs-5">다음 글</div>
                                                <div class="col ">코로나 예방</div>
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