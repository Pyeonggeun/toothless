<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>        
    </head>
		 
		 <script>
		 
            function formSubmit(){
                const frm = document.getElementById("frm");

                const inputComment = document.getElementById("inputComment");
                console.log(inputComment);
                    if(inputComment.value == ''){
                        alert("댓글 입력");
                        inputComment.focus;
                        return;

                    }
           		frm.submit();
            }
        </script>
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
                                	<div class="row py-2" style="background-color:#F2F2F2 ;">
                                         <div class="col">
                                             <a href="../common/staffMainPage";
	                                             style="text-decoration: none; color:#015A9E;">
	                                             홈
                                             </a>
                                             >공지사항
                                        </div>
                                        <div class="col">
                                        	<i class="bi bi-caret-right-fill"></i>
                                        	<a href="./staffBoardImgPage";>	 
                                        		<i class="bi bi-caret-left"></i>
                                        	</a>
                                        </div>
                                        <div class="col-10"></div>
                                     </div>
                                    <div class="row">
                                        <div class="col"></div>
																			
                                        <div class="col-7">
                                            <div class="row mt-5">
                                                <div class="col fw-bold text-center fs-3">공지사항</div>
                                            </div>
                                            <form id="frm" action="./staffBoardPage" method="get">
                                            <div class="row mt-5 pt-3 mb-2">
                                                <div class="col-6 ps-0">
                                                	[Total] ${total }개
                                                </div>
                                                <div class="col-2 ">
                                                    <select name="searchType" class="form-select" aria-label="Default select example">
                                                        <option selected value="title">제목</option>
                                                        <option value="content">내용</option>
                                                    </select>
                                                </div>
                                                <div class="col pe-0 ">
                                                    <input id="inputComment" name="searchWord" class="form-control " type="text" placeholder="내용입력">
                                                </div> 
                                                <div class="col-1 me-0 pe-0 text-start">
                                                    <input type="button" onclick="formSubmit()" class="btn btn-outline-primary" value="검색">
                                                </div>
                                            </div>
                                            </form>
                                            <div class="row border-bottom">
                                                <div class="col">
                                                    <div class="row fw-bold py-2 mt-3 text-center border-top border-2 border-black" style="background-color: #F2F2F2; font-size: 1.0em;">
                                                        <div class="col-1">번호</div>
                                                        <div class="col-4">제목</div>
                                                        <div class="col"></div>
                                                        <div class="col-2">작성자</div>
                                                        <div class="col-2">작성일</div>
                                                        <div class="col">조회수</div>
                                                        <div class="col">파일</div>
                                                    </div>
                                                    <c:forEach items="${noticeList }" var="notice">
                                                    <div class="row py-2 border-bottom ">
                                                        <div class="col-1 text-center">${notice.noticeboardDto.studentboard_pk }</div>
                                                        <div class="col-5">
															<span class="d-inline-block text-truncate" style="max-width: 20em; font-size:0.9em;">
                                                            	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
	                                                             	style="text-decoration:none; color: black;">
	                                                             	${notice.noticeboardDto.title }
                                                            	</a>
                                                           	</span>
															<c:if test="${notice.replyDto !=0 }">
                                                      		<span class="d-inline-block text-truncate" style="font-size:0.9em;">
                                                      			&nbsp;[${notice.replyDto }]
                                                      		</span>
                                                      		</c:if>
														</div>
                                                        <div class="col-2 text-center" style="font-size:0.9em;">${notice.staffDto.name }</div>
                                                        <div class="col-2" style="font-size:0.9em;">
                                                        	<fmt:formatDate value="${notice.noticeboardDto.created_at  }" pattern="yyyy년 MM월 dd일"/>
                                                        </div>
                                                        <div class="col text-center" style="font-size:0.9em;">${notice.noticeboardDto.read_count}</div>
                                                        <div class="col text-center">
															<c:if test="${notice.imgDto !=0}">
                                                         		<i class="bi bi-images"></i>
                                                         	</c:if>
														</div>
                                                    </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col me-0 pe-0 text-end">
                                                    <a href="./staffWriteBoardPage">
                                                    	<input type="button" class="btn btn-outline-primary " value="글쓰기">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <nav aria-label="Page navigation example ">
                                                        <ul class="pagination  justify-content-center ">
	                                                        <li class="page-item">
	                                                            <a class="page-link" href="#" aria-label="Previous">
	                                                            	<span aria-hidden="true">&laquo;</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
	                                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
	                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                                        <li class="page-item">
	                                                            <a class="page-link" href="#" aria-label="Next">
	                                                            	<span aria-hidden="true">&raquo;</span>
	                                                            </a>
	                                                        </li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-1"></div>
                                        <div class="col" style="background-color:#F2F2F2";>
                                        	<div class="row" >
                                        		<div class="col-1"></div>
                                        		<div class="col">
                                        			<div class="row"></div>
                                        			<div class="row mt-5 pt-1" style="background-color:#F2F2F2";>
                                        				<div class="col fw-bold mb-4 text-center" style="font-size: 1.1em;">
	                                        				<i class="bi bi-asterisk"></i>
	                                        				인기검색어
	                                        				<i class="bi bi-asterisk"></i>
                                        				</div>
                                        			</div>
                                        			<c:forEach items="${readList }" var="notice" varStatus="loop">
	                                        		<c:if test="${loop.index<5 }">
                                        			<div class="row mx-2" >
                                        				<div class="col-1 mt-2">
                                        					<i class="bi bi-award-fill" style="color:#F7C113"></i>
                                        				</div>
                                        				<div class="col mt-2">
                                   							<span class="d-inline-block text-truncate" style="max-width: 9em;">
                                                     			<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
	                                                              	class="navbar-brand"
	                                                              	style="text-decoration:none; font-size: 0.9em;">
	                                                              	${notice.noticeboardDto.title }
                                                            	</a>
                                                            </span>
                                        				</div>
                                        			</div>
													</c:if>
                                       				</c:forEach>                                        			
                                        		</div>
                                        		<div class="col-1"></div>
                                        	</div>
                                        </div>
                                    </div>
                             

                                </div>
                            </div>
                        </div>
                    </div>
                   <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>