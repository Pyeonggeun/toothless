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
    </head>
		 
		 <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
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
                                                           ${sessionStaffInfo.name}님 환영합니다.
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
                                    <div class="row">
                                        <div class="col">
                                            <div class="row mt-5  ">
                                                <div class="col fw-bold fs-2 text-center border-bottom border-4">보건진료소</div>
                                            </div>

                                            <div class="row px-5 mx-3">
                                                <div class="col">
                                                    <form id="frm" action="./staffBoardPage" method="get">
                                                    
                                                        <div class="row mt-4">
                                                        <div class="col">
                                                            <span style="font-size: 120%; font-weight: bold;">Total</span>
                                                            <span style="font-size: 80%;">${total }개</span> 
                                                        </div>
                                                        <div class="col-2">
                                                            <select name="searchType" class="form-select" aria-label="Default select example">
                                                                <option selected>항목</option>
                                                                <option value="title">제목</option>
                                                                <option value="content">내용</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-3 pe-0 text-end">
                                                            <input id="inputComment" name="searchWord" class="form-control" type="text" placeholder="내용을검색하세요">
                                                        </div> 
                                                        <div class="col-1 text-start">
                                                            <input type="submit" onclick="formSubmit()" class="btn btn-outline-dark" value="검색">
                                                        </div>
                                                    </div>
                                                    </form>
                                                    <div class="row">
                                                        <div class="col text-start" style="font-size: 60%">홈>공지사항</div>
                                                    </div>

                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <div class="row ">
                                                                <div class="col fw-bold fs-5 text-center ">[ 인기 게시글 ]</div>
                                                            </div>
                                                                <div class="row mt-3" >
                                                                    <div class="col text-center">
                                                                        <div class="row border-2 border-bottom border-dark fw-bold">
                                                                            <div class="col-3">인기글 순위</div>
                                                                            <div class="col-5">제목</div>
                                                                            <div class="col-2">작성자</div>
                                                                            <div class="col-2">조회수</div>                                                                   
                                                                        </div>
                                                                        <c:forEach items="${readList }" var="notice" varStatus="loop">
                                                                        <c:if test="${loop.index<3 }">
                                                                        <div class="row border-1 border-bottom">
                                                                            <div class="col-3 fw-bold text-danger">${loop.index+1}</div>
                                                                            <div class="col-5" style="text-decoration:none;" >
                                                                            	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
		                                                                        	style="text-decoration:none;">
		                                                                        	${notice.noticeboardDto.title }
		                                                                        </a>
                                                                            	<%-- <c:if test="${notice.replyDto !=0 }">
                                                                        			&nbsp;[${notice.replyDto }]
                                                                        		</c:if>
                                                                        		<c:if test="${notice.imgDto !=0}">
	                                                                        		<i class="bi bi-images"></i>
	                                                                        	</c:if> --%>
                                                                            	</div>
                                                                            <div class="col-2">${notice.staffDto.name }</div>
                                                                            <div class="col-2">${notice.noticeboardDto.read_count }</div>
                                                                        </div>
                                                                        </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>  
                                                        </div>
                                                        <div class="col-7"></div>
                                                    </div>


                                                    <div class="row mt-5">
                                                        <div class="col">
                                                        	<div class="row">
                                                        		<div class="col fw-bold fs-5 text-center">[ 공지사항 ]</div>
                                                        	</div>
                                                            <div class="row mt-3 my-2">
                                                                <div class="col fw-bold fs-5">
                                                                    <div class="row border-bottom border-dark border-3 text-center">
                                                                        <div class="col-1">글 번호</div>
                                                                        <div class="col-5">제목</div>
                                                                        <div class="col-1">작성자</div>
                                                                        <div class="col">작성일</div>
                                                                        <div class="col-1">좋아요</div>
                                                                        <div class="col-1">조회수</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:forEach items="${noticeList }" var="notice">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row border-bottom border-0 text-center">
                                                                        <div class="col-1">${notice.noticeboardDto.studentboard_pk }</div>
                                                                        <div class="col-5">
                                                                        	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
                                                                        	style="text-decoration:none;">
                                                                        	${notice.noticeboardDto.title }
                                                                        	</a>
                                                                        	<c:if test="${notice.replyDto !=0 }">
                                                                        		&nbsp;[${notice.replyDto }]
                                                                        	</c:if>
                                                                        	<c:if test="${notice.imgDto !=0}">
                                                                        		<i class="bi bi-images"></i>
                                                                        	</c:if>
                                                                        </div>
                                                                        <div class="col-1">${notice.staffDto.name }</div>
                                                                        <div class="col">
                                                                        <fmt:formatDate value="${notice.noticeboardDto.created_at  }" pattern="yyyy년 MM월 dd일"/>
                                                                        </div>
                                                                        <div class="col-1">${notice.likeDto }</div>
                                                                        <div class="col-1">${notice.noticeboardDto.read_count }</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </c:forEach> 
                                                        </div>
                                                    </div>
                                                    <div class="row mx-5">
                                                        <div class="col text-end">
                                                            <a href="./staffWriteBoardPage" style="text-decoration:none;">글쓰기</a>
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
                                            </div> 
                                        </div>
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