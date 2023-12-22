<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>qnaboardPage</title>
</head>
<body>
	

	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<!-- 
		1.row밑에 또 row를 쓰려면 그 전에 col을 닫고 다시 row열어야함
		2.규격의 마지막은 무조건 col로, row끝내기 X
	
		 -->
		<%-- 예시
		<div class="row">
			<div class="row></div> <--안됨
			<div class="col"></div>
			<div class="col">
				<div class="row">
					<div class="col"></div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		 --%>
		
		<div class="row">
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
			<%-- 공지사항 칸 --%>
				<div class="row  border-bottom border-2 border-grey mb-5 mt-5 pt-3 pb-3 ">
					<div class="col fw-bold fs-3">공지사항</div>															
				</div>
				<div class="row justify-content-end mb-2">
					<div class="col-6"></div>
                    <div class="col ms-5 pe-0 text-end">
						<div class="row  ms-5">
							<div class="col-4 ms-5 pe-0">
								<select name="searchType" class="form-select" aria-label="Default select example">
		                             <option selected value="title">제목</option>
		                             <option value="content">내용</option>
		                         </select>      
							</div>
							<div class="col  px-0">
								<input id="inputComment" name="searchWord" class="form-control " type="text" placeholder="내용입력">			
							</div>
							<div class="col-2 ps-0">
								<input type="button" onclick="formSubmit()" class="btn btn-outline-primary" value="검색">
							</div>
						</div>
                    </div>
				</div>
				<div class="row border-2 border-top border-black bg-body-secondary pt-3 ps-4">
				
					<div class="col">
						<div class="row">	
							<div class="col mb-3 ms-3 fw-bold">글번호</div>
							<div class="col-6 text-center fw-bold">제목</div>
							<div class="col ps-3  me-3 fw-bold text-end">작성자</div>
							<div class="col fw-bold ps-5 text-center">작성일</div>
						</div>
					</div>	
					
					
				</div>
				
				<div class="row">
					<div class="col">
						<c:forEach items="${list }" var="map">
							<div class="row border-bottom mt-4">
								<div class="col mb-3 text-center ">
									${map.qnaBoardDto.board_pk }	
								</div>
								<div class="col-6 text-start ">
									<a  class="navbar-brand"  href="./readPageForStudent?board_pk=${map.qnaBoardDto.board_pk }">
										<span class="d-inline-block text-truncate" style="max-width: 23em;">${map.qnaBoardDto.board_title }</span>
									</a>
								</div>
								<div class="col ps-3  text-end">
									${map.staffInfoDto.name}
								</div>
								<div class="col  ps-5 text-center">
								<fmt:formatDate value="${map.qnaBoardDto.created_at }" pattern="yyyy-MM-dd"/>	
								</div>
							</div>
						</c:forEach>	
					</div>
				</div>
				
				<div class="row pt-3">
					<div class="col">
						<div class="row text-center">
							<div class="col"></div>
							<div class="col text-center">
								<nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-center">
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
							<div class="col"></div>
						</div>
					</div>
				</div>
					
			</div>
					
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	<div class="row">
         <div class="col">
            <jsp:include page="../common/futter.jsp"></jsp:include>
         </div>
      </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>