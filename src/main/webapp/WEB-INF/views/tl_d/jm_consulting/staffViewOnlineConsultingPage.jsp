<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">

	<div class="row">
		<div class="col">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>			
		</div>
	</div>
	
	

	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="row">
				<div class="col-3">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>
				</div>
				
				<div class="col-9">
					<div class="row mt-5">
						<div class="col">
							상담 목록
						</div>
						
						<div class="row mt-4">
							<div class="col">	
								<%--							
								<select name="isReply" class="form-select">
									<option value="all" ${searchType == 'title' ? 'selected' : null}>제목</option>
									<option value="reply" ${searchType == 'content' ? 'selected' : null}>내용</option>
									<option value="Unreply" ${searchType == 'nickname' ? 'selected' : null}>작성자</option>
								</select>
								 --%>										
								<form action="./staffViewOnlineConsultingPage" method="post">
								<div class="row" style="font-size:0.6em;">
									<div class="col">
										<input type="radio" name="isAnswer" value="all"
										${isReply == 'all' ? 'checked' : null}
										>전체
									</div>
									<div class="col">
										<input type="radio" name="isAnswer" value="reply"
										${isReply == 'reply' ? 'checked' : null}
										>답변완료
									</div>
									<div class="col">
										<input type="radio" name="isAnswer"  value="unReply"
										${isReply == 'unReply' ? 'checked' : null}
										>미답변
									</div>
									<div class="col">
										<button type="submit" style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i>
										</button>
									</div>										
									<div class="col-7">
									</div>																												
								</div>
								</form>
								
							</div>
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col">
							<form action="" method="post">	
							<div class="row border" style="align-items:center;">
							
													
								<div class="col-3">
									<select name="searchCategory" class="ps-0 form-select" aria-label="Default select example" style="border:none; outline:none; font-size:0.7em;">
									 <%-- <option selected>전체</option> --%>									 
									  <option value="all">전체</option>
									  <option value="studentName">학생 이름</option>
									  <option value="onConsultingPk">신청번호</option>
									</select>							
								</div>
								<div class="col-9">
									<div class="row">
										<div class="col-11">
											<input type="text" placeholder="검색 미구현" style="border:none; outline:none; width:100%; font-size:0.7em;">
										</div>								
										<div class="col-1">
											<button type="submit" style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i>
											</button>
										</div>

									</div>									
								</div>										

													
							</div>
							</form>
						</div>
					</div>
					
					<div class="row border border-bottom-0 pt-4">
						<div class="col">
							<div class="row">
								<div class="col">
									온라인 상담 번호
								</div>
								<div class="col">
									학생 이름
								</div>
								<div class="col">
									상담 날짜
								</div>
								<div class="col">
									응답여부
								</div>
								<div class="col">
									링크
								</div>								
							</div>
						</div>
					</div>
					
					
					<div class="row pt-4 border border-top-0">
						<div class="col">
							
								<c:forEach items="${list }" var="e">
								<div class="row py-2 border-top" style="align-items:center;">
										<div class="col">
											${e.onlineConsultingDto.on_consulting_pk }
										</div>
										<div class="col">
											${e.studentInfoDto.name }
										</div>
										<div class="col">
											<fmt:formatDate value="${e.onlineConsultingDto.created_at }" pattern="yyyy-MM-dd"/>
										</div>
										<div class="col">
											
											<c:choose>
												<c:when test="${e.isReply}">
															<span class="badge text-bg-primary">답변완료</span>								
												</c:when>
											
												<c:otherwise>
															<span class="badge text-bg-danger">미답변</span>  
												</c:otherwise>										
												
											</c:choose>
											
										</div>	
										<div class="col" >
											 <a href="./staffManageOnlineConsultingPage?onlineConsultingPk=${e.onlineConsultingDto.on_consulting_pk}">
											 <button type="button" class="btn btn-primary" style="width:50%;"><span style="font-size:0.7em;">이동</span></button>											
											</a>
										</div>
								</div>																													
								</c:forEach>
								
						</div>
					</div>					
					<div class="row mt-5 ps-0">
						<div class="col">
							<a href="./jmTempStaffMainPage">
								<button type="button" class="btn btn-primary">목록</button>
							</a>
						</div>
					</div>						
					
					
				</div>
			</div>
		
		</div>
		<div class="col-1"></div>				
	</div>
	

	
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>