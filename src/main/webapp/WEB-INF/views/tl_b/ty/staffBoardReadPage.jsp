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
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                	<div class="row mx-1 my-3 ">
                                        <div class="col ms-1 " style="font-size: 15px;">
                                        	<a href="../common/staffMainPage"; 
                                        	style="text-decoration: none; color:#015A9E;">
                                        	홈
                                        	</a>>
                                        	<a href="./staffBoardPage"; 
                                        	style="text-decoration: none; color:#015A9E;">
                                        	공지사항
                                        	<a/>>
                                        	상세글
                                        </div>
                                    </div>

                                    <div class="row mx-3 my-3  border">
                      				 <div class="col">

                                    
                                    
                                    
                                    <div class="row mt-2 ">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col fw-bold" style="font-size: 26px;"><span style="color:#015A9E">[공지]</span>&nbsp;&nbsp; ${read.noticeboardDto.title }</div>
                                            </div>
                                            <div class="row">
                                                <div class="col fw-bold" style="font-size: 13px;">
                                                	${read.staffInfoDto.name } &nbsp;&nbsp;
                                                	<span style="font-size: 12px; color:rgb(110, 106, 106)">
                                                		<fmt:formatDate value="${read.noticeboardDto.created_at }" pattern="yy년 MM월 dd일"/>
													 	&nbsp;&nbsp; | 
													 	<i class="bi bi-eye"></i>
													 	${read.noticeboardDto.read_count }
													 	&nbsp;&nbsp; | <i class="bi bi-heart-fill"></i>${likeCount }
													 	<i class="bi bi-chat-dots-fill"></i>${replyCount}
													</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

									<div class="row mt-3">
										<div class="col">${read.noticeboardDto.content }</div>
									</div>
                                    <div class="row mt-5">
                                        <div class="col">
                                        	<c:forEach items="${read.boardImageDtoList }" var="boardImageDto">
                                        	<img src="../../resources/img/healthRoom/TY/${boardImageDto.img_link }">
                                        	
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
                                                    		<a href="./replyDeleteProcess?id=${boardReply.replyDto.studentboard_reply_pk }
	                                                    		&deleteId=${boardReply.studentDto.student_pk}
	                                                    		&boardPk=${read.noticeboardDto.studentboard_pk}"
	                                                    		style="text-decoration: none; color:#015A9E;">
	                                                    		삭제
                                                    		</a>
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
                                            <input type='button' class='btn btn-outline-primary' value='목록'  >
                                        </a>
                                    </div>
                                    <c:if test="${sessionStaffInfo.staff_pk == read.noticeboardDto.staff_pk }">
                                    <div class="col ps-0">
                                        <a href="./noticeUpdatePage?id=${read.noticeboardDto.studentboard_pk }">
                                            <input type='button' class='btn btn-outline-primary' value='수정' >
                                        </a>
                                    </div>
                                    <div class="col ps-0 ">
                                        <a href="./noticeDeleteProcess?id=${read.noticeboardDto.studentboard_pk }">
                                            <input type='button' class='btn btn-outline-danger' value='삭제'  >
                                        </a>
                                    </div>
                                    </c:if>
                                    <div class="col-10"></div>
                                </div>
 									
 									
 									
                                    <div class="row mt-5 border">
                                        <div class="col">
                                            <div class="row border-bottom border-black ">
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